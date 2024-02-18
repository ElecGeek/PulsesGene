NETLIST_PROG?=gnetlist
EXPORT_PROG?=gaf
GHDL_PROG=ghdl
SRCDIR?=
BUILDDIR?=build/
DESTDIR?=
SYNTHDESTDIR?=Synth/
YOSYS_PROG?=yosys
NEXTPNR-ICE40_PROG?=nextpnr-ice40
ICEPACK?=icepack


all			: $(DESTDIR)pulses_gene.partslist_by_refdes.txt $(DESTDIR)pulses_gene.partslist_by_value.txt $(DESTDIR)pulses_gene.net $(DESTDIR)pulses_gene.cir $(DESTDIR)sch_build_date $(DESTDIR)pulses_gene_numeric.net

lists		: $(DESTDIR)pulses_gene.partslist_by_refdes.txt $(DESTDIR)pulses_gene.partslist_by_value.txt

spice		: $(BUILDDIR)pulses_gene.cir

pcb		: $(DESTDIR)pulses_gene.net

vhdl	: $(DESTDIR)pulses_gene_numeric.vhdl

schemas		: $(DESTDIR)sch_build_date

$(DESTDIR)pulses_gene.partslist_by_refdes.txt : $(SCRDIR)pulses_gene_analog.sch $(SCRDIR)pulses_gene_numeric.sch $(SCRDIR)pulses_gene_power.sch
	$(NETLIST_PROG) -g partslist1 -o $(DESTDIR)pulses_gene.partslist_by_refdes.txt $(SCRDIR)pulses_gene_analog.sch $(SCRDIR)pulses_gene_numeric.sch $(SCRDIR)pulses_gene_power.sch

$(DESTDIR)pulses_gene.partslist_by_value.txt : $(SCRDIR)pulses_gene_analog.sch $(SCRDIR)pulses_gene_numeric.sch $(SCRDIR)pulses_gene_power.sch
	$(NETLIST_PROG) -g partslist3 -o $(DESTDIR)pulses_gene.partslist_by_value.txt $(SCRDIR)pulses_gene_analog.sch $(SCRDIR)pulses_gene_numeric.sch $(SCRDIR)pulses_gene_power.sch

$(BUILDDIR)HC4053.cir	:	$(SCRDIR)HC4053.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)HC4053.cir $(SCRDIR)HC4053.sch
	sed -r -i 's/IOut_/* IOut_/g;s/Isense_/* Isense_/g' $(BUILDDIR)HC4053.cir

$(BUILDDIR)AMP_OP.cir	:	$(SCRDIR)AMP_OP.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)AMP_OP.cir $(SCRDIR)AMP_OP.sch
	sed -r -i 's/IOut_/* IOut_/g;s/Isense_/* Isense_/g' $(BUILDDIR)AMP_OP.cir

$(BUILDDIR)AMP_OP_FAST.cir	:	$(SCRDIR)AMP_OP_FAST.sch
	$(NETLIST_PROG) -g spice-sdb -o $(BUILDDIR)AMP_OP_FAST.cir $(SCRDIR)AMP_OP_FAST.sch
	sed -r -i 's/IOut_/* IOut_/g;s/Isense_/* Isense_/g' $(BUILDDIR)AMP_OP_FAST.cir

$(DESTDIR)pulses_gene.net : $(SCRDIR)pulses_gene_analog.sch $(SCRDIR)pulses_gene_numeric.sch $(SCRDIR)pulses_gene_power.sch
	$(NETLIST_PROG) -g PCB -o $(DESTDIR)pulses_gene_temp.net $(SCRDIR)pulses_gene_analog.sch $(SCRDIR)pulses_gene_numeric.sch $(SCRDIR)pulses_gene_power.sch
	sed -r --file=$(SCRDIR)net_pcb_fix.reg $(DESTDIR)pulses_gene_temp.net > $(DESTDIR)pulses_gene_temp_2.net
ifeq ($(SCRDIR),)
	./pcb_doublons_fix.sh $(DESTDIR)pulses_gene_temp_2.net $(DESTDIR)pulses_gene.net
else
	$(SCRDIR)pcb_doublons_fix.sh $(DESTDIR)pulses_gene_temp.net $(DESTDIR)pulses_gene.net
endif
	rm -f $(DESTDIR)pulses_gene_temp_2.net
	rm -f $(DESTDIR)pulses_gene_temp.net

$(BUILDDIR)pulses_gene.cir : $(SCRDIR)pulses_gene_analog.sch $(SCRDIR)pulses_gene_analog_test.sch $(BUILDDIR)HC4053.cir $(BUILDDIR)AMP_OP.cir $(BUILDDIR)AMP_OP_FAST.cir $(SCRDIR)Modulator.cir
#	Look like weird. But NETLIST_PROG does not have options to pass a path.
ifneq ($(SCRDIR), $(BUILDDIR))
	cp -f $(SCRDIR)pulses_gene_analog.sch $(BUILDDIR)pulses_gene_analog.sch
	cp -f $(SCRDIR)pulses_gene_analog_test.sch $(BUILDDIR)pulses_gene_analog_test.sch
	cp -f $(SCRDIR)Modulator.cir $(BUILDDIR)Modulator.cir
endif
ifeq ($(BUILDDIR),)
	$(NETLIST_PROG) -g spice-sdb -o pulses_gene.cir pulses_gene_analog.sch pulses_gene_analog_test.sch
else
	cd $(BUILDDIR); $(NETLIST_PROG) -g spice-sdb -o pulses_gene.cir pulses_gene_analog.sch pulses_gene_analog_test.sch
endif
	sed -r --file=$(SCRDIR)spice_fix.reg  $(BUILDDIR)pulses_gene.cir > $(BUILDDIR)pulses_gene_spice.cir

$(DESTDIR)pulses_gene_numeric.vhdl : $(SCRDIR)pulses_gene_numeric.sch
	$(NETLIST_PROG) -g vhdl -o $(DESTDIR)pulses_gene_numeric.vhdl $(SCRDIR)pulses_gene_numeric.sch 
	sed -r -i --file=$(SCRDIR)vhdl_fix.reg $(DESTDIR)pulses_gene_numeric.vhdl
	sed -r -i '/^ENTITY/a port (\n\tCLK_IN :  in std_logic;\n\tthreshold_input :  in std_logic;\n\tpulse_A : out std_logic;\n\tpulse_B : out std_logic\n);' $(DESTDIR)pulses_gene_numeric.vhdl 
	sed -r -i 's/use IEEE.Std_Logic_1164.all;/use IEEE.Std_Logic_1164.all,\nwork.includes_74HC.all;/' $(DESTDIR)pulses_gene_numeric.vhdl
	sed -r -i '/SIGNAL CLK_IN :/d;/SIGNAL threshold_input :/d;/SIGNAL pulse_A :/d;/SIGNAL pulse_B :/d' $(DESTDIR)pulses_gene_numeric.vhdl 


simul : $(DESTDIR)pulses_gene_numeric.vhdl
	touch $(DESTDIR)simul
	$(GHDL_PROG) -a $(SCRDIR)Models_74HC.vhdl
	$(GHDL_PROG) -a $(DESTDIR)pulses_gene_numeric.vhdl
	$(GHDL_PROG) -a $(SCRDIR)pulses_gene_numeric_test.vhdl
	$(GHDL_PROG) -e Pulses_gene_test
	$(GHDL_PROG) -r Pulses_gene_test --vcd=$(DESTDIR)pulses_gene.wav 2>&1 | tee $(DESTDIR)pulses_gene.out.txt
	echo "The wav file is NOT an audio file, it can be opened, for instance, using gtk-wave" > $(DESTDIR)README.important

synth_ice40	: $(DESTDIR)pulses_gene_numeric.vhdl
	$(GHDL_PROG) -a $(SCRDIR)Models_74HC.vhdl
	$(GHDL_PROG) -a $(DESTDIR)pulses_gene_numeric.vhdl
	$(YOSYS_PROG) -m ghdl -p '$(GHDL_PROG) pulses_gene; synth_ice40 -json $(SYNTHDESTDIR)pulses_gene.ice40.json' 2>&1 |tee $(SYNTHDESTDIR)pulses_gene.synth.out.txt
	$(NEXTPNR-ICE40_PROG) --lp384 --package qn32 --freq 5.00 --top Pulses_gene --asc $(SYNTHDESTDIR)pulses_gene.asc --json $(SYNTHDESTDIR)pulses_gene.ice40.json --placed-svg $(SYNTHDESTDIR)pulses_gene.placed.svg --routed-svg $(SYNTHDESTDIR)pulses_gene.routed.svg --report $(SYNTHDESTDIR)pulses_gene.report.json 2>&1 |tee $(SYNTHDESTDIR)pulses_gene.P_and_R.out.txt
	$(ICEPACK) $(SYNTHDESTDIR)pulses_gene.asc $(SYNTHDESTDIR)pulses_gene.bin 2>&1 |tee $(SYNTHDESTDIR)pulses_gene.pack.out.txt


$(DESTDIR)sch_build_date	: $(SCRDIR)pulses_gene_analog.sch $(SCRDIR)pulses_gene_analog_test.sch $(SCRDIR)pulses_gene_numeric.sch $(SCRDIR)HC4053.sch $(SCRDIR)AMP_OP.sch $(SCRDIR)AMP_OP_FAST.sch $(SCRDIR)Modulator.cir
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_analog.pdf $(SCRDIR)pulses_gene_analog.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_analog.ps $(SCRDIR)pulses_gene_analog.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_analog_test.pdf $(SCRDIR)pulses_gene_analog_test.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_analog_test.ps $(SCRDIR)pulses_gene_analog_test.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_numeric.ps $(SCRDIR)pulses_gene_numeric.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_numeric.pdf $(SCRDIR)pulses_gene_numeric.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_power.ps $(SCRDIR)pulses_gene_power.sch
	$(EXPORT_PROG) export -o $(DESTDIR)pulses_gene_power.pdf $(SCRDIR)pulses_gene_power.sch
	$(EXPORT_PROG) export -o $(DESTDIR)HC4053.pdf $(SCRDIR)HC4053.sch
	$(EXPORT_PROG) export -o $(DESTDIR)HC4053.ps $(SCRDIR)HC4053.sch
	$(EXPORT_PROG) export -o $(DESTDIR)AMP_OP.ps $(SCRDIR)AMP_OP.sch
	$(EXPORT_PROG) export -o $(DESTDIR)AMP_OP.pdf $(SCRDIR)AMP_OP.sch
	$(EXPORT_PROG) export -o $(DESTDIR)AMP_OP_FAST.ps $(SCRDIR)AMP_OP_FAST.sch
	$(EXPORT_PROG) export -o $(DESTDIR)AMP_OP_FAST.pdf $(SCRDIR)AMP_OP_FAST.sch
ifneq ($(SCRDIR), $(DESTDIR))
	cp -f $(SCRDIR)Modulator.cir $(DESTDIR)Modulator.cir
endif


clean	:
	rm -f $(DESTDIR)pulses_gene.partslist_by_refdes.txt $(DESTDIR)pulses_gene.partslist_by_value.txt
	rm -f $(BUILDDIR)HC4053.cir $(BUILDDIR)AMP_OP.cir $(BUILDDIR)AMP_OP_FAST.cir
	rm -f $(DESTDIR)pulses_gene.net $(BUILDDIR)pulses_gene.cir $(BUILDDIR)pulses_gene_spice.cir
	rm -f $(DESTDIR)*.ps $(DESTDIR)*.pdf
