v 20201216 2
C 40000 40000 0 0 0 title-bordered-A3.sym
C 41900 45200 1 0 0 gnd-1.sym
C 41400 46700 1 0 0 generic-power.sym
{
T 41600 46950 5 10 1 1 0 3 1
net=Vcc:1
}
C 41800 44300 1 180 0 generic-power.sym
{
T 41500 44050 5 10 1 1 180 3 1
net=Vdd:1
}
C 41300 45500 1 0 0 vdc-1.sym
{
T 42000 46150 5 10 1 1 0 0 1
refdes=V1
T 42000 46350 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 42000 46550 5 10 0 0 0 0 1
footprint=none
T 42000 45950 5 10 1 1 0 0 1
value=DC 4.5V
}
C 41300 44300 1 0 0 vdc-1.sym
{
T 42000 44950 5 10 1 1 0 0 1
refdes=V2
T 42000 45150 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 42000 45350 5 10 0 0 0 0 1
footprint=none
T 41900 44450 5 10 1 1 0 0 1
value=DC 4.5V
}
N 42000 45500 41600 45500 4
C 43200 44300 1 0 0 vsin-1.sym
{
T 43900 44950 5 10 1 1 0 0 1
refdes=V3
T 43900 45150 5 10 0 0 0 0 1
device=vsin
T 43900 45350 5 10 0 0 0 0 1
footprint=none
T 43900 44750 5 10 1 1 0 0 1
value=dc 0 sin 0 0.1 600
}
C 45200 44300 1 0 0 vsin-1.sym
{
T 45900 44950 5 10 1 1 0 0 1
refdes=V4
T 45900 45150 5 10 0 0 0 0 1
device=vsin
T 45900 45350 5 10 0 0 0 0 1
footprint=none
T 45900 44750 5 10 1 1 0 0 1
value=dc 0 sin 0 1 5
}
C 43400 44000 1 0 0 gnd-1.sym
C 45400 44000 1 0 0 gnd-1.sym
C 41000 42700 1 0 0 spice-model-1.sym
{
T 41100 43400 5 10 0 1 0 0 1
device=model
T 41100 43300 5 10 1 1 0 0 1
refdes=A1
T 42300 43000 5 10 1 1 0 0 1
model-name=D1N4148
T 41500 42800 5 10 1 1 0 0 1
model=IS=4.352E-9 N=1.906 BV=110 IBV=0.0001 RS=0.6458 CJO=7.048E-13 VJ=0.869 M=0.03 FC=0.5 TT=3.48E-9 
T 41000 42700 5 10 0 1 0 0 1
type=D
}
C 41000 40700 1 0 0 spice-model-1.sym
{
T 41100 41400 5 10 0 1 0 0 1
device=model
T 41100 41300 5 10 1 1 0 0 1
refdes=A3
T 42300 41000 5 10 1 1 0 0 1
model-name=LED
T 41000 40700 5 10 0 1 0 0 1
type=D
T 41500 40800 5 10 1 1 0 0 1
model=IS=2.5939E-13 N=4.0113 RS=0.24229 IKF=0 EG=3 XTI=25
}
C 46500 46400 1 0 0 opamp_gen_dil8_ci.sym
{
T 47125 47350 5 8 0 0 0 0 1
device=LM741
T 46700 47300 5 10 1 1 0 0 1
refdes=X50
T 46500 46400 5 10 0 0 0 0 1
file=Modulator.cir
T 46500 46400 5 10 0 0 0 0 1
model-name=modulator
}
N 46500 47000 45500 47000 4
N 43500 46600 43500 45500 4
N 45500 47000 45500 45500 4
N 43500 46600 46500 46600 4
C 47500 46700 1 0 0 output-2.sym
{
T 48400 47000 5 10 1 0 0 0 1
net=INPUT_SIGNAL:1
T 47700 47400 5 10 0 0 0 0 1
device=none
T 48400 46800 5 10 1 1 0 1 1
value=OUTPUT
}
C 51900 42800 1 0 0 spice-model-1.sym
{
T 52000 43500 5 10 0 1 0 0 1
device=model
T 52000 43400 5 10 1 1 0 0 1
refdes=A4
T 53200 43100 5 10 1 1 0 0 1
model-name=AMP_OP
T 52400 42900 5 10 1 1 0 0 1
file=AMP_OP.cir
}
C 51900 41900 1 0 0 spice-model-1.sym
{
T 52000 42600 5 10 0 1 0 0 1
device=model
T 52000 42500 5 10 1 1 0 0 1
refdes=A5
T 53200 42200 5 10 1 1 0 0 1
model-name=HC4066
T 52400 42000 5 10 1 1 0 0 1
file=HC4066.cir
}
C 47100 44300 1 0 0 vpulse-1.sym
{
T 47800 44950 5 10 1 1 0 0 1
refdes=V10
T 47800 45150 5 10 0 0 0 0 1
device=vpulse
T 47800 45350 5 10 0 0 0 0 1
footprint=none
T 47800 44750 5 10 1 1 0 0 1
value=DC 0 PULSE 0 4 0 10uS 10uS 200uS 1.666mS
}
C 50900 44300 1 0 0 vpulse-1.sym
{
T 51600 44950 5 10 1 1 0 0 1
refdes=V11
T 51600 45150 5 10 0 0 0 0 1
device=vpulse
T 51600 45350 5 10 0 0 0 0 1
footprint=none
T 51600 44750 5 10 1 1 0 0 1
value=DC 0 PULSE 0 4 300uS 10uS 10uS 200uS 1.666mS 
}
C 47300 44000 1 0 0 gnd-1.sym
C 51100 44000 1 0 0 gnd-1.sym
C 47400 45400 1 0 0 output-2.sym
{
T 47400 45700 5 10 1 0 0 0 1
net=pulse_A:1
T 47600 46100 5 10 0 0 0 0 1
device=none
T 48300 45500 5 10 0 1 0 1 1
value=OUTPUT
}
C 51200 45400 1 0 0 output-2.sym
{
T 51100 45700 5 10 1 0 0 0 1
net=pulse_B:1
T 51400 46100 5 10 0 0 0 0 1
device=none
T 52100 45500 5 10 0 1 0 1 1
value=OUTPUT
}
C 41300 49800 1 0 0 spice-options-1.sym
{
T 41400 50100 5 10 0 1 0 0 1
device=options
T 41400 50200 5 10 1 1 0 0 1
refdes=A6
T 41500 49900 5 10 1 1 0 0 1
value=*tran 30uS 0.2S
}
C 41300 48900 1 0 0 spice-options-1.sym
{
T 41400 49200 5 10 0 1 0 0 1
device=options
T 41400 49300 5 10 1 1 0 0 1
refdes=A7
T 41400 49000 5 10 1 1 0 0 1
value=plot V(INPUT_SIGNAL), V(rectified), V(detected_fast), 3+V(threshold_input)/5
}
C 41300 47900 1 0 0 spice-options-1.sym
{
T 41400 48200 5 10 0 1 0 0 1
device=options
T 41400 48300 5 10 1 1 0 0 1
refdes=A8
T 41400 48000 5 10 1 1 0 0 1
value=plot V(rectified), V(detected_slow), 3+V(display_low)/5, 3+V(display_high)/5
}
C 47800 49800 1 0 0 spice-options-1.sym
{
T 47900 50100 5 10 0 1 0 0 1
device=options
T 47900 50200 5 10 1 1 0 0 1
refdes=A9
T 47900 49900 5 10 1 1 0 0 1
value=plot V(detected_fast), 5+V(pulse_A)/10, 5+V(pulse_B)/10, V(output_pulses)
}
C 41000 41700 1 0 0 spice-model-1.sym
{
T 41100 42400 5 10 0 1 0 0 1
device=model
T 41100 42300 5 10 1 1 0 0 1
refdes=A2
T 42300 42000 5 10 1 1 0 0 1
model-name=DBAT85
T 41000 41700 5 10 0 1 0 0 1
type=D
T 41500 41800 5 10 1 1 0 0 1
model=IS = 2.076E-7 N = 1.023 BV = 33 IBV = 10E-6 RS = 2.326 CJO = 1.21E-11 VJ = 0.1319 M = 0.2904 EG = 0.69 XTI = 2 
}
