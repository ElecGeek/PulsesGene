v 20201216 2
C 40000 40000 0 0 0 title-bordered-A4.sym
C 48800 44200 1 0 0 spice-subcircuit-IO-1.sym
{
T 49700 44600 5 10 0 1 0 0 1
device=spice-IO
T 49650 44450 5 10 1 1 0 0 1
refdes=P1
}
C 48800 44800 1 0 0 spice-subcircuit-IO-1.sym
{
T 49700 45200 5 10 0 1 0 0 1
device=spice-IO
T 49650 45050 5 10 1 1 0 0 1
refdes=P4
}
C 46200 40800 1 0 0 spice-subcircuit-LL-1.sym
{
T 46300 41100 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 46300 41200 5 10 1 1 0 0 1
refdes=A1
T 46300 40900 5 10 1 1 0 0 1
model-name=74HC4053
}
C 41000 45100 1 0 0 spice-model-1.sym
{
T 41100 45800 5 10 0 1 0 0 1
device=model
T 41100 45700 5 10 1 1 0 0 1
refdes=A2
T 42300 45400 5 10 1 1 0 0 1
model-name=SHC4053
T 41100 44700 5 10 1 1 0 0 1
model=VT=2 VH=0.1 RON=10 ROFF=10meg 
T 41100 45000 5 10 1 0 0 0 1
type=SW
}
C 46800 44100 1 0 0 spice-vc-switch-1.sym
{
T 48400 44800 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47700 45300 5 12 1 1 0 0 1
refdes=S1
T 47500 44250 5 8 1 1 0 0 1
model-name=SHC4053
}
C 46600 45400 1 180 0 spice-subcircuit-IO-1.sym
{
T 45700 45000 5 10 0 1 180 0 1
device=spice-IO
T 45750 45150 5 10 1 1 180 0 1
refdes=P2
}
C 46900 44200 1 0 0 gnd-1.sym
C 46800 42600 1 0 0 spice-vc-switch-1.sym
{
T 48400 43300 5 8 0 0 0 0 1
device=SPICE-VC-switch
T 47700 43800 5 12 1 1 0 0 1
refdes=S2
T 47500 42750 5 8 1 1 0 0 1
model-name=SHC4053compl
}
N 49000 45100 48500 45100 4
N 49000 44500 48500 44500 4
N 48800 44500 48800 43000 4
N 48800 43000 48500 43000 4
C 48800 43300 1 0 0 spice-subcircuit-IO-1.sym
{
T 49700 43700 5 10 0 1 0 0 1
device=spice-IO
T 49650 43550 5 10 1 1 0 0 1
refdes=P3
}
N 48500 43600 49000 43600 4
N 46400 45100 47000 45100 4
C 46900 42700 1 0 0 gnd-1.sym
N 46600 45100 46600 43600 4
N 46600 43600 47000 43600 4
C 41000 43200 1 0 0 spice-model-1.sym
{
T 41100 43900 5 10 0 1 0 0 1
device=model
T 41100 43800 5 10 1 1 0 0 1
refdes=A3
T 42300 43500 5 10 1 1 0 0 1
model-name=SHC4053compl
T 41100 42800 5 10 1 1 0 0 1
model=VT=2 VH=0.1 RON=10meg ROFF=10 
T 41100 43100 5 10 1 0 0 0 1
type=SW
}
