NETLIST_PROG?=gnetlist
EXPORT_PROG?=gaf
SRCDIR?=
BUILDDIR?=
DESTDIR?=


all			: $(DESTDIR)pulses_gene.partslist_by_refdes.txt $(DESTDIR)pulses_gene.partslist_by_value.txt $(DESTDIR)pulses_gene.net $(DESTDIR)pulses_gene.cir $(DESTDIR)sch_build_date $(DESTDIR)pulses_gene_numeric.net

lists		: $(DESTDIR)pulses_gene.partslist_by_refdes.txt $(DESTDIR)pulses_gene.partslist_by_value.txt

spice		: $(BUILDDIR)pulses_gene.cir

pcb		: $(DESTDIR)pulses_gene.net

vhdl	: $(DESTDIR)pulses_gene_numeric.net

schemas		: $(DESTDIR)sch_build_date

$(DESTDIR)pulses_gene.partslist_by_refdes.txt : $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch
	$(NETLIST_PROG) -g partslist1 -o $(DESTDIR)pulses_gene.partslist_by_refdes.txt $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch

$(DESTDIR)pulses_gene.partslist_by_value.txt : $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch
	$(NETLIST_PROG) -g partslist3 -o $(DESTDIR)pulses_gene.partslist_by_value.txt $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch


$(BUILDDIR)HC4053.cir	:	$(SCRDIR)HC4053.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)HC4053.cir $(SCRDIR)HC4053.sch
	sed -r -i 's/IOut_/* IOut_/g;s/Isense_/* Isense_/g' $(BUILDDIR)HC4053.cir

$(BUILDDIR)AMP_OP.cir	:	$(SCRDIR)AMP_OP.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)AMP_OP.cir $(SCRDIR)AMP_OP.sch
	sed -r -i 's/IOut_/* IOut_/g;s/Isense_/* Isense_/g' $(BUILDDIR)AMP_OP.cir

$(BUILDDIR)AMP_OP_FAST.cir	:	$(SCRDIR)AMP_OP_FAST.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)AMP_OP_FAST.cir $(SCRDIR)AMP_OP_FAST.sch
	sed -r -i 's/IOut_/* IOut_/g;s/Isense_/* Isense_/g' $(BUILDDIR)AMP_OP_FAST.cir

$(DESTDIR)pulses_gene.net : $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch
	$(NETLIST_PROG) -g PCB -o $(DESTDIR)pulses_gene_temp.net $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)pulses_gene_power.sch
	sed -r --file=$(SRCDIR)net_pcb_fix.reg $(DESTDIR)pulses_gene_temp.net > $(DESTDIR)pulses_gene_temp_2.net
ifeq ($(SRCDIR),)
	./pcb_doublons_fix.sh $(DESTDIR)pulses_gene_temp_2.net $(DESTDIR)pulses_gene.net
else
	$(SRCDIR)pcb_doublons_fix.sh $(DESTDIR)pulses_gene_temp.net $(DESTDIR)pulses_gene.net
endif
	rm -f $(DESTDIR)pulses_gene_temp_2.net
	rm -f $(DESTDIR)pulses_gene_temp.net

$(BUILDDIR)pulses_gene.cir : $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_analog_test.sch $(BUILDDIR)HC4053.cir $(BUILDDIR)AMP_OP.cir $(BUILDDIR)AMP_OP_FAST.cir $(SRCDIR)Modulator.cir
#	Look like weird. But NETLIST_PROG does not have options to pass a path.
ifneq ($(SRCDIR), $(BUILDDIR))
	cp -f $(SRCDIR)pulses_gene_analog.sch $(BUILDDIR)pulses_gene_analog.sch
	cp -f $(SRCDIR)pulses_gene_analog_test.sch $(BUILDDIR)pulses_gene_analog_test.sch
	cp -f $(SRCDIR)Modulator.cir $(BUILDDIR)Modulator.cir
endif
ifeq ($(BUILDDIR),)
	$(NETLIST_PROG) -g spice-sdb -o pulses_gene.cir pulses_gene_analog.sch pulses_gene_analog_test.sch
else
	cd $(BUILDDIR); $(NETLIST_PROG) -g spice-sdb -o pulses_gene.cir pulses_gene_analog.sch pulses_gene_analog_test.sch
endif
	sed -r --file=$(SRCDIR)spice_fix.reg  $(BUILDDIR)pulses_gene.cir > $(BUILDDIR)pulses_gene_spice.cir

$(DESTDIR)pulses_gene_numeric.net : $(SRCDIR)pulses_gene_numeric.sch
	$(NETLIST_PROG) -g vhdl -o $(DESTDIR)pulses_gene_numeric_temp.vhdl $(SRCDIR)pulses_gene_numeric.sch 
	sed -r --file=$(SRCDIR)vhdl_fix.reg $(DESTDIR)pulses_gene_numeric_temp.vhdl > $(DESTDIR)pulses_gene_numeric.vhdl



$(DESTDIR)sch_build_date	: $(SRCDIR)pulses_gene_analog.sch $(SRCDIR)pulses_gene_analog_test.sch $(SRCDIR)pulses_gene_numeric.sch $(SRCDIR)HC4053.sch $(SRCDIR)AMP_OP.sch $(SRCDIR)AMP_OP_FAST.sch $(SRCDIR)Modulator.cir
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_analog.pdf $(SRCDIR)pulses_gene_analog.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_analog.ps $(SRCDIR)pulses_gene_analog.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_analog_test.pdf $(SRCDIR)pulses_gene_analog_test.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_analog_test.ps $(SRCDIR)pulses_gene_analog_test.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_numeric.ps $(SRCDIR)pulses_gene_numeric.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_numeric.pdf $(SRCDIR)pulses_gene_numeric.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_power.ps $(SRCDIR)pulses_gene_power.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_power.pdf $(SRCDIR)pulses_gene_power.sch
	$(EXPORT_PROG) export -o $(DESTDIR)HC4053.pdf $(SRCDIR)HC4053.sch
	$(EXPORT_PROG) export -o $(DESTDIR)HC4053.ps $(SRCDIR)HC4053.sch
	$(EXPORT_PROG) export -o $(DESTDIR)AMP_OP.ps $(SRCDIR)AMP_OP.sch
	$(EXPORT_PROG) export -o $(DESTDIR)AMP_OP.pdf $(SRCDIR)AMP_OP.sch
	$(EXPORT_PROG) export -o $(DESTDIR)AMP_OP_FAST.ps $(SRCDIR)AMP_OP_FAST.sch
	$(EXPORT_PROG) export -o $(DESTDIR)AMP_OP_FAST.pdf $(SRCDIR)AMP_OP_FAST.sch
ifneq ($(SRCDIR), $(DESTDIR))
	cp -f $(SRCDIR)Modulator.cir $(DESTDIR)Modulator.cir
endif


clean	:
	rm -f $(DESTDIR)pulses_gene.partslist_by_refdes.txt $(DESTDIR)pulses_gene.partslist_by_value.txt
	rm -f $(BUILDDIR)HC4053.cir $(BUILDDIR)AMP_OP.cir $(BUILDDIR)AMP_OP_FAST.cir
	rm -f $(DESTDIR)pulses_gene.net $(BUILDDIR)pulses_gene.cir $(BUILDDIR)pulses_gene_spice.cir
	rm -f $(DESTDIR)*.ps $(DESTDIR)*.pdf
