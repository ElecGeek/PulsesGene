v 20201216 2
C 40000 40000 0 0 0 title-bordered-A4.sym
C 47300 42800 1 0 0 spice-subcircuit-IO-1.sym
{
T 48200 43200 5 10 0 1 0 0 1
device=spice-IO
T 48150 43050 5 10 1 1 0 0 1
refdes=P2
}
C 47300 43400 1 0 0 spice-subcircuit-IO-1.sym
{
T 48200 43800 5 10 0 1 0 0 1
device=spice-IO
T 48150 43650 5 10 1 1 0 0 1
refdes=P1
}
C 46200 40800 1 0 0 spice-subcircuit-LL-1.sym
{
T 46300 41100 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 46300 41200 5 10 1 1 0 0 1
refdes=A1
T 46300 40900 5 10 1 1 0 0 1
model-name=74HC4066
}
C 40800 43100 1 0 0 spice-model-1.sym
{
T 40900 43800 5 10 0 1 0 0 1
device=model
T 40900 43700 5 10 1 1 0 0 1
refdes=A2
T 42100 43400 5 10 1 1 0 0 1
model-name=SHC4066
T 40900 42700 5 10 1 1 0 0 1
model=VT=2 VH=0.1 RON=10 ROFF=10meg 
T 40900 43000 5 10 1 0 0 0 1
type=SW
}
C 45800 42700 1 0 0 spice-vc-switch-1.sym
{
T 47400 43400 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 46700 43900 5 12 1 1 0 0 1
refdes=S1
T 46500 42850 5 8 1 1 0 0 1
model-name=SHC4066
}
C 46200 44000 1 180 0 spice-subcircuit-IO-1.sym
{
T 45300 43600 5 10 0 1 180 0 1
device=spice-IO
T 45350 43750 5 10 1 1 180 0 1
refdes=P3
}
C 45900 42800 1 0 0 gnd-1.sym
