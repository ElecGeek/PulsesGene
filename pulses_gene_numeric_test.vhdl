library IEEE;
use IEEE.Std_Logic_1164.all,
  IEEE.numeric_std.all;

entity Pulses_gene_test is
end entity Pulses_gene_test;

architecture arch of Pulses_gene_test is
  signal CLK : std_logic := '0';
  signal the_input : std_logic := '0';
  signal simul_count : unsigned( 14 downto 0 ) := ( others => '0' );
  component Pulses_gene IS
    port (
      CLK_IN          :  in std_logic;
      threshold_input :  in Std_Logic;
      pulse_A         : out Std_Logic;
      pulse_B         : out Std_Logic
      );
  end component Pulses_gene;
  signal pulse_A, pulse_B : std_logic;
  -- This signal is not a part of the simulation
  -- It gives an idea of what the analogue part (with the digital) issue
  -- All wave viewers have an analogue mode.
  -- Some WV does not have a signed analogue mode.
  -- Then the hig bit is toggled here.
  signal pulse_final : signed( 1 downto 0 );
  signal last_pulse_state : bit_vector( 1 downto 0 ) := "00";
  signal last_pulse_val : bit;
  signal pulses_toggled, pulses_not_toggled : natural := 0;
  signal pulses_overlap, pulses_error : natural := 0;
  signal pulse_duration_curr : natural := 1;
  signal pulses_duration_min : integer := integer'high;
  signal pulses_duration_max : integer := integer'low;
begin
  pulse_final( 1 ) <= not pulse_B;
  pulse_final( 0 ) <= pulse_B or pulse_A;
  CLK_proc : process
    variable next_pulse_state : bit_vector( last_pulse_state'range );
    begin
      if simul_count( simul_count'high ) = '0' then
        simul_count <= simul_count + 1;
        if CLK = '1' then
          if pulse_A = '1' then
            next_pulse_state( next_pulse_state'low ) := '1';
          else
            next_pulse_state( next_pulse_state'low ) := '0';
          end if;
          if pulse_B = '1' then
            next_pulse_state( next_pulse_state'high ) := '1';
          else
            next_pulse_state( next_pulse_state'high ) := '0';
          end if;
          pulses_state_change : if last_pulse_state /= next_pulse_state then 
            case next_pulse_state is
              when "01" | "10" =>
                if last_pulse_state = "00" then
                  if ( last_pulse_val xor next_pulse_state( next_pulse_state'low )) = '1' then
                    pulses_toggled <= pulses_toggled + 1;
                  else
                    pulses_not_toggled <= pulses_not_toggled + 1;
                  end if;
                  last_pulse_val <= next_pulse_state( next_pulse_state'low );
                else
                  pulses_overlap <= pulses_overlap + 1;
                end if;
              when "11" =>
                pulses_error <= pulses_error + 1;
              when "00" =>
                if pulses_duration_max < pulse_duration_curr then
                  pulses_duration_max <= pulse_duration_curr;
                end if;
                if pulses_duration_min > pulse_duration_curr then
                  pulses_duration_min <= pulse_duration_curr;
                end if;
                pulse_duration_curr <= 1;
              when others => null;
            end case;
          else
            if next_pulse_state = "01" or next_pulse_state = "10" then
              pulse_duration_curr <= pulse_duration_curr + 1;
            end if;
          end if pulses_state_change; 
          last_pulse_state <= next_pulse_state;
        end if;
        CLK <= not CLK;
        wait for 5 uS;
      else
        report "Simulation is over" severity note;
        report "------------------" severity note;
        report "Please note an error counter not to 0 may generate wrong reports" severity note;
        report "Pulse toggled (A follow B or B follow A): " & natural'image( pulses_toggled ) &
          ", pulses not toggled (2 consecutive A or B): " & natural'image( pulses_not_toggled )
          severity note;
        report "Pulse overlap (no both A and B low in between): " & natural'image( pulses_overlap ) &
          ", pulses error (both A and B high): " & natural'image( pulses_error )
          severity note;
        report "all pulses duration are between " & integer'image( pulses_duration_min ) &
          " and " & integer'image( pulses_duration_max ) & " clock cycles"
          severity note;
        
        wait;
      end if;
    end process CLK_proc;
    input_proc : process
      variable count_light : bit_vector( 2 downto 0 );
    begin
      if simul_count( simul_count'high ) = '0' then
        the_input <= not the_input;
        case simul_count( simul_count'high - 1 downto simul_count'high - 3 ) is
          when "000" => wait for 10.25 uS;
          when "001" => wait for 20.5 uS;
          when "010" => wait for 41 uS;
          when "011" => wait for 82 uS;
          when "100" => wait for 164 uS;
          when "101" => wait for 328 uS;
          when "110" => wait for 656 uS;
          when "111" => wait for 1312 uS;
                        when others => null;
        end case;
      else
        wait;
      end if;
    end process input_proc;

    pulse_gene_instanc : Pulses_gene port map (
      CLK_IN => CLK,
      threshold_input => the_input,
      pulse_A => pulse_A,
      pulse_B => pulse_B );
        
  end architecture arch;
