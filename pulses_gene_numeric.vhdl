-- Structural VHDL generated by gnetlist
-- Context clause
library IEEE;
use IEEE.Std_Logic_1164.all,
  work.Includes_74HC.all;
-- Entity declaration

ENTITY Pulses_gene IS
END Pulses_gene;


-- Secondary unit
ARCHITECTURE netlist OF Pulses_gene IS

  
    SIGNAL unnamed_net22 : Std_Logic;
    SIGNAL unnamed_net21 : Std_Logic;
    SIGNAL unnamed_net20 : Std_Logic;
    SIGNAL unnamed_net19 : Std_Logic;
    SIGNAL unnamed_net18 : Std_Logic;
    SIGNAL unnamed_net17 : Std_Logic;
    SIGNAL unnamed_net16 : Std_Logic;
    SIGNAL unnamed_net15 : Std_Logic;
    SIGNAL unnamed_net14 : Std_Logic;
    SIGNAL unnamed_net13 : Std_Logic;
    SIGNAL unnamed_net12 : Std_Logic;
    SIGNAL unnamed_net11 : Std_Logic;
    SIGNAL unnamed_net10 : Std_Logic;
    SIGNAL unnamed_net9 : Std_Logic;
    SIGNAL unnamed_net8 : Std_Logic;
    SIGNAL unnamed_net7 : Std_Logic;
    SIGNAL unnamed_net6 : Std_Logic;
    SIGNAL unnamed_net5 : Std_Logic;
    SIGNAL GND : Std_Logic;
    SIGNAL CLK : Std_Logic;
    SIGNAL Vcc : Std_Logic;
    SIGNAL unnamed_net4 : Std_Logic;
    SIGNAL unnamed_net3 : Std_Logic;
    SIGNAL unnamed_net2 : Std_Logic;
    SIGNAL unnamed_net1 : Std_Logic;
    SIGNAL pulse_A : Std_Logic;
    SIGNAL pulse_B : Std_Logic;
    SIGNAL threshold_input : Std_Logic;
BEGIN
-- Architecture statement part
    U16 : HC7473
    PORT MAP (
        P14 => Vcc,
        P12 => unnamed_net5,
        P3 => GND,
        P13 => unnamed_net20,
        P2 => unnamed_net7,
        P1 => threshold_input,
        P4 => Vcc,
        P11 => GND,
        P7 => GND,
        P9 => unnamed_net21,
        P10 => GND,
        P8 => unnamed_net22,
        P6 => GND,
        P5 => GND);

    U15 : HC7400
    PORT MAP (
        P3 => unnamed_net14,
        P2 => unnamed_net11,
        P1 => unnamed_net12,
        P14 => Vcc,
        P7 => GND,
        P6 => unnamed_net8,
        P5 => unnamed_net14,
        P4 => unnamed_net14,
        P8 => open,
        P9 => 'L',
        P10 => 'L',
        P11 => open,
        P12 => 'L',
        P13 => 'L'
        );
    U13 : HC74163
    PORT MAP (
        P3 => GND,
        P14 => unnamed_net16,
        P4 => GND,
        P13 => unnamed_net17,
        P5 => GND,
        P12 => unnamed_net18,
        P6 => GND,
        P11 => unnamed_net19,
        P7 => unnamed_net14,
        P15 => unnamed_net3,
        P10 => Vcc,
        P2 => CLK,
        P1 => Vcc,
        P9 => unnamed_net7,
        P16 => Vcc,
        P8 => GND);

    U14 : HC74163
    PORT MAP (
        P3 => GND,
        P14 => unnamed_net9,
        P4 => GND,
        P13 => unnamed_net11,
        P5 => GND,
        P12 => unnamed_net12,
        P6 => GND,
        P11 => unnamed_net13,
        P7 => unnamed_net14,
        P15 => unnamed_net15,
        P10 => unnamed_net3,
        P2 => CLK,
        P1 => Vcc,
        P9 => unnamed_net7,
        P16 => Vcc,
        P8 => GND);

    U7 : HC7402
    PORT MAP (
        P3 => unnamed_net4,
        P2 => unnamed_net9,
        P1 => pulse_A,
        P14 => Vcc,
        P7 => GND,
        P6 => unnamed_net4,
        P5 => unnamed_net10,
        P4 => pulse_B,
        P9 => unnamed_net11,
        P8 => unnamed_net12,
        P10 => unnamed_net1,
        P12 => unnamed_net9,
        P11 => unnamed_net9,
        P13 => unnamed_net10);

    X6 : HC7473
    PORT MAP (
        P14 => unnamed_net1,
        P12 => unnamed_net2,
        P3 => unnamed_net3,
        P13 => unnamed_net4,
        P2 => Vcc,
        P1 => CLK,
        P4 => Vcc,
        P11 => GND,
        P7 => unnamed_net5,
        P9 => unnamed_net6,
        P10 => GND,
        P8 => unnamed_net7,
        P6 => unnamed_net8,
        P5 => CLK);

-- Signal assignment part
END netlist;
