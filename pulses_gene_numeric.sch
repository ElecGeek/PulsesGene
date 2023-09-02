v 20201216 2
C 38900 40400 0 0 0 title-bordered-A3.sym
C 41800 44000 1 0 1 io-1.sym
{
T 42100 44300 5 10 1 1 0 6 1
net=threshold_input:1
T 41600 44600 5 10 0 0 0 6 1
device=none
T 40900 44100 5 10 0 1 0 7 1
value=IO
}
C 53600 46400 1 0 0 io-1.sym
{
T 53600 46700 5 10 1 1 0 0 1
net=pulse_B:1
T 53800 47000 5 10 0 0 0 0 1
device=none
T 54500 46500 5 10 0 1 0 1 1
value=IO
}
C 53600 48700 1 0 0 io-1.sym
{
T 53700 49300 5 10 1 1 0 0 1
net=pulse_A:1
T 53800 49300 5 10 0 0 0 0 1
device=none
T 54500 48800 5 10 0 1 0 1 1
value=IO
}
C 49500 48000 1 0 0 7473-1.sym
{
T 51600 49740 5 10 0 0 0 0 1
device=7473
T 51600 49540 5 10 0 0 0 0 1
footprint=SOIC14
T 51200 49800 5 10 1 1 0 6 1
refdes=X6
T 49500 48000 5 10 0 0 0 0 1
slot=1
T 49500 48000 5 10 1 1 0 0 1
value=74HC73
}
C 41800 46600 1 0 0 7473-1.sym
{
T 43900 48340 5 10 0 0 0 0 1
device=7473
T 43900 48140 5 10 0 0 0 0 1
footprint=SOIC14
T 43500 48400 5 10 1 1 0 6 1
refdes=X6
T 41800 46600 5 10 0 0 0 0 1
slot=2
T 41800 46600 5 10 1 1 0 0 1
value=74HC73
}
C 52300 48300 1 0 0 7402-1.sym
{
T 52900 49200 5 10 0 0 0 0 1
device=7402
T 52600 49200 5 10 1 1 0 0 1
refdes=U7
T 52900 50600 5 10 0 0 0 0 1
footprint=SOIC14
T 52300 48300 5 10 0 0 0 0 1
slot=4
T 52300 48300 5 10 1 1 0 0 1
value=74HC02
}
C 52300 46000 1 0 0 7402-1.sym
{
T 52900 46900 5 10 0 0 0 0 1
device=7402
T 52600 46900 5 10 1 1 0 0 1
refdes=U7
T 52900 48300 5 10 0 0 0 0 1
footprint=SOIC14
T 52300 46000 5 10 0 0 0 0 1
slot=1
T 52300 46000 5 10 1 1 0 0 1
value=74HC02
}
N 51500 49000 52300 49000 4
N 52100 46700 52300 46700 4
C 45200 46600 1 0 0 74163-1.sym
{
T 45500 50740 5 10 0 0 0 0 1
device=74163
T 45500 50540 5 10 0 0 0 0 1
footprint=SOIC16
T 46900 50400 5 10 1 1 0 6 1
refdes=U14
T 45200 46600 5 10 1 1 0 0 1
value=74HC163
}
N 51900 49000 51900 46300 4
C 45200 41800 1 0 0 74163-1.sym
{
T 45500 45940 5 10 0 0 0 0 1
device=74163
T 45500 45740 5 10 0 0 0 0 1
footprint=SOIC16
T 46900 45600 5 10 1 1 0 6 1
refdes=U13
T 45200 41800 5 10 1 1 0 0 1
value=74HC163
}
C 51500 49300 1 0 0 nc-right-1.sym
{
T 51600 49800 5 10 0 0 0 0 1
value=NoConnection
T 51600 50000 5 10 0 0 0 0 1
device=DRC_Directive
}
C 49000 48600 1 0 0 vcc-1.sym
N 49200 48600 49500 48600 4
N 47200 43600 48100 43600 4
N 48100 43600 48100 45900 4
N 48900 45900 44800 45900 4
N 45200 48000 44800 48000 4
N 44800 48000 44800 45900 4
N 45000 46400 48700 46400 4
N 49500 48200 48700 48200 4
N 48700 45600 48700 48200 4
N 45200 47200 45000 47200 4
N 45000 42400 45000 47200 4
N 45000 42400 45200 42400 4
N 49500 49000 48900 49000 4
C 48000 48900 1 0 0 7402-1.sym
{
T 48600 49800 5 10 0 0 0 0 1
device=7402
T 48300 49800 5 10 1 1 0 0 1
refdes=U7
T 48600 51200 5 10 0 0 0 0 1
footprint=SOIC14
T 48000 48900 5 10 0 0 0 0 1
slot=3
T 48000 48900 5 10 1 1 0 0 1
value=74HC02
}
C 52300 47200 1 0 0 7402-1.sym
{
T 52900 48100 5 10 0 0 0 0 1
device=7402
T 52600 48100 5 10 1 1 0 0 1
refdes=U7
T 52900 49500 5 10 0 0 0 0 1
footprint=SOIC14
T 52300 47200 5 10 0 0 0 0 1
slot=2
T 52300 47200 5 10 1 1 0 0 1
value=74HC02
}
N 48900 49000 48900 45900 4
N 47200 49600 48000 49600 4
N 47200 49200 48000 49200 4
N 49300 49400 49500 49400 4
N 47200 50000 52100 50000 4
N 52100 47500 52100 50000 4
N 52300 48600 52100 48600 4
C 48000 50100 1 0 0 7400-1.sym
{
T 48500 51000 5 10 0 0 0 0 1
device=7400
T 48300 51000 5 10 1 1 0 0 1
refdes=U15
T 48500 52350 5 10 0 0 0 0 1
footprint=SOIC14
T 48000 50100 5 10 0 0 0 0 1
slot=1
T 48000 50100 5 10 1 1 0 0 1
value=74HC00
}
N 47800 50800 47800 49600 4
N 48000 50400 47600 50400 4
N 47600 50400 47600 49200 4
N 47800 50800 48000 50800 4
C 44600 43200 1 0 0 vcc-1.sym
N 44800 43200 45200 43200 4
N 45200 43600 44600 43600 4
N 44600 43600 44600 51200 4
N 41800 51200 49500 51200 4
N 49500 51200 49500 50600 4
N 49500 50600 49300 50600 4
N 45200 50000 45200 48800 4
N 45200 45200 45200 44000 4
C 47200 43900 1 0 0 nc-right-1.sym
{
T 47300 44400 5 10 0 0 0 0 1
value=NoConnection
T 47300 44600 5 10 0 0 0 0 1
device=DRC_Directive
}
C 47200 44300 1 0 0 nc-right-1.sym
{
T 47300 44800 5 10 0 0 0 0 1
value=NoConnection
T 47300 45000 5 10 0 0 0 0 1
device=DRC_Directive
}
C 47200 44700 1 0 0 nc-right-1.sym
{
T 47300 45200 5 10 0 0 0 0 1
value=NoConnection
T 47300 45400 5 10 0 0 0 0 1
device=DRC_Directive
}
C 47200 45100 1 0 0 nc-right-1.sym
{
T 47300 45600 5 10 0 0 0 0 1
value=NoConnection
T 47300 45800 5 10 0 0 0 0 1
device=DRC_Directive
}
N 45200 48400 44600 48400 4
C 47200 48300 1 0 0 nc-right-1.sym
{
T 47300 48800 5 10 0 0 0 0 1
value=NoConnection
T 47300 49000 5 10 0 0 0 0 1
device=DRC_Directive
}
C 47200 48700 1 0 0 nc-right-1.sym
{
T 47300 49200 5 10 0 0 0 0 1
value=NoConnection
T 47300 49400 5 10 0 0 0 0 1
device=DRC_Directive
}
N 52100 47500 52300 47500 4
N 52300 47900 52100 47900 4
N 53600 47700 53900 47700 4
N 53900 47700 53900 47100 4
N 53900 47100 52100 47100 4
N 52100 47100 52100 46700 4
N 51900 46300 52300 46300 4
C 41400 47300 1 0 0 gnd-1.sym
N 41500 47600 41800 47600 4
N 45000 46400 41600 46400 4
N 41600 46400 41600 46800 4
N 41600 46800 41800 46800 4
C 44800 48900 1 0 0 gnd-1.sym
C 44700 44100 1 0 0 gnd-1.sym
N 44800 44400 45200 44400 4
N 44600 42000 45200 42000 4
N 44900 49200 45200 49200 4
C 43800 47900 1 0 0 nc-right-1.sym
{
T 43900 48400 5 10 0 0 0 0 1
value=NoConnection
T 43900 48600 5 10 0 0 0 0 1
device=DRC_Directive
}
N 45200 47600 43800 47600 4
N 44400 42800 44400 47600 4
N 44400 42800 45200 42800 4
C 42200 50000 1 0 0 7400-1.sym
{
T 42700 50900 5 10 0 0 0 0 1
device=7400
T 42500 50900 5 10 1 1 0 0 1
refdes=U15
T 42700 52250 5 10 0 0 0 0 1
footprint=SOIC14
T 42200 50000 5 10 0 0 0 0 1
slot=2
T 42200 50000 5 10 1 1 0 0 1
value=74HC00
}
N 43500 50500 43500 49800 4
N 41200 49800 43500 49800 4
N 41200 49800 41200 47200 4
N 41200 47200 41800 47200 4
N 41800 51200 41800 50300 4
N 41800 50300 42200 50300 4
N 41800 50700 42200 50700 4
C 43900 46800 1 0 0 vcc-1.sym
C 44400 42000 1 0 0 vcc-1.sym
N 44100 46800 45200 46800 4
C 48700 47300 1 180 0 io-1.sym
{
T 47800 47100 5 10 1 1 180 0 1
net=CLK:1
T 48500 46700 5 10 0 0 180 0 1
device=none
T 47800 47200 5 10 0 1 180 1 1
value=IO
}
C 41800 43900 1 0 0 7473-1.sym
{
T 43900 45640 5 10 0 0 0 0 1
device=7473
T 43900 45440 5 10 0 0 0 0 1
footprint=SOIC14
T 43500 45700 5 10 1 1 0 6 1
refdes=U16
T 41800 43900 5 10 0 0 0 0 1
slot=1
T 41800 43900 5 10 1 1 0 0 1
value=74HC73
}
C 41800 41800 1 0 0 7473-1.sym
{
T 43900 43540 5 10 0 0 0 0 1
device=7473
T 43900 43340 5 10 0 0 0 0 1
footprint=SOIC14
T 43500 43600 5 10 1 1 0 6 1
refdes=U16
T 41800 41800 5 10 0 0 0 0 1
slot=2
T 41800 41800 5 10 1 1 0 0 1
value=74HC73
}
N 44400 46200 41200 46200 4
N 41200 46200 41200 44500 4
N 41200 44500 41800 44500 4
N 41800 48000 41000 48000 4
N 41000 48000 41000 46000 4
N 41000 46000 44200 46000 4
N 44200 46000 44200 45300 4
N 44200 45300 43800 45300 4
C 43800 44800 1 0 0 nc-right-1.sym
{
T 43900 45300 5 10 0 0 0 0 1
value=NoConnection
T 43900 45500 5 10 0 0 0 0 1
device=DRC_Directive
}
C 41300 45300 1 0 0 vcc-1.sym
C 41400 44600 1 0 0 gnd-1.sym
N 41500 44900 41800 44900 4
N 41500 45300 41800 45300 4
C 41700 41700 1 0 0 gnd-1.sym
N 41800 43200 41800 42000 4
C 43800 43100 1 0 0 nc-right-1.sym
{
T 43900 43600 5 10 0 0 0 0 1
value=NoConnection
T 43900 43800 5 10 0 0 0 0 1
device=DRC_Directive
}
C 43800 42700 1 0 0 nc-right-1.sym
{
T 43900 43200 5 10 0 0 0 0 1
value=NoConnection
T 43900 43400 5 10 0 0 0 0 1
device=DRC_Directive
}
C 49600 44200 1 0 0 7400-1.sym
{
T 50100 45100 5 10 0 0 0 0 1
device=7400
T 49900 45100 5 10 1 1 0 0 1
refdes=U15
T 50100 46450 5 10 0 0 0 0 1
footprint=SOIC14
T 49600 44200 5 10 0 0 0 0 1
slot=4
T 49600 44200 5 10 1 1 0 0 1
value=74HC00
}
C 52500 44200 1 0 0 7400-1.sym
{
T 53000 45100 5 10 0 0 0 0 1
device=7400
T 52800 45100 5 10 1 1 0 0 1
refdes=U15
T 53000 46450 5 10 0 0 0 0 1
footprint=SOIC14
T 52500 44200 5 10 0 0 0 0 1
slot=3
T 52500 44200 5 10 1 1 0 0 1
value=74HC00
}
N 52500 44900 52500 44500 4
N 50900 44700 52500 44700 4
N 49600 44900 49600 42600 4
N 49600 42600 49800 42600 4
C 51100 43500 1 90 0 resistor-2.sym
{
T 50750 43900 5 10 0 0 90 0 1
device=RESISTOR
T 50800 43700 5 10 1 1 90 0 1
refdes=R41
}
C 49800 42500 1 0 0 resistor-2.sym
{
T 50200 42850 5 10 0 0 0 0 1
device=RESISTOR
T 50400 42800 5 10 1 1 0 0 1
refdes=R40
}
C 52300 42400 1 0 0 capacitor-1.sym
{
T 52500 43100 5 10 0 0 0 0 1
device=CAPACITOR
T 52500 42900 5 10 1 1 0 0 1
refdes=C4
T 52500 43300 5 10 0 0 0 0 1
symversion=0.1
T 52300 42400 5 10 0 0 0 0 1
tolerance=20%
T 52300 42400 5 10 1 1 0 0 1
value=681pF
}
C 51700 43300 1 0 0 connector2-2.sym
{
T 52400 44600 5 10 1 1 0 6 1
refdes=CONN3
T 52000 44550 5 10 0 0 0 0 1
device=CONNECTOR_2
T 52000 44750 5 10 0 0 0 0 1
footprint=SIP2N
}
C 51600 42600 1 90 0 resistor-2.sym
{
T 51250 43000 5 10 0 0 90 0 1
device=RESISTOR
T 51300 42800 5 10 1 1 90 0 1
refdes=R42
}
N 51000 44400 51000 44700 4
N 51500 43500 51500 44100 4
N 51000 43500 51000 42600 4
N 50700 42600 52300 42600 4
N 53800 42600 53800 45600 4
N 53800 42600 53200 42600 4
N 48700 45600 53800 45600 4
N 51700 44100 51500 44100 4
N 51300 44700 51300 43700 4
N 51300 43700 51700 43700 4
