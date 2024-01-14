library IEEE;
use IEEE.Std_Logic_1164.all;
-- Entity declaration


--! Synchronise the request with the clock of the run

--! The input trigs asap,
--! means on the next clock cycle which the run is ready for a new command.\n
--! It is a one command only memory. The additional are lost.
--! However, a new command can come at any time after 2 CLK cycles
--! it is going to be kept in memory.\n
--! That means the frequency of the commands should be lower than the CLK frequency
ENTITY PG_clock_domain_sync IS
port (
  --! The main clock against the run should be in sync
	CLK :  in std_logic;
    --! The requests to start a run asap, rising edge
	request_input :  in std_logic;
	run_out : out std_logic;
	run_completed : in std_logic
);
END ENTITY PG_clock_domain_sync;


-- Secondary unit
ARCHITECTURE rtl OF PG_clock_domain_sync IS
  -- There is a need to use 4 latches
  -- * L1 "digitalizes" the input
  -- * L2 is the input at T - 1, L1 & L2 generates the input rising edge
  -- * L3 is the memorized request
  -- * L4 is the run of the circuit
  -- * L5 is the run at T - 1,  L1 & L2 generates the run rising edge
  -- If some restrictions would have been accepted,
  -- such as the request input length shorted than the run,
  -- less latches could have been possible
  signal L1_out : std_logic;
  signal L2_out : std_logic;
  signal L3_out : std_logic;
  signal L4_out : std_logic;
  signal L5_out : std_logic;
begin
  run_out <= L4_out;

  main_proc :   process( CLK )
    variable input_rising_edge : boolean;
    variable run_rising_edge : boolean;
  begin
    CLK_IF : if rising_edge( CLK ) then
      L1_out <= request_input;
      L2_out <= L1_out;
      if L2_out = '0' and L1_out = '1' then
        input_rising_edge := true;
      else
        input_rising_edge := false;
      end if;

      L5_out <= L4_out;
      if L5_out = '0' and L4_out = '1' then
        run_rising_edge := true;
      else
        run_rising_edge := false;
      end if;

      if L4_out /= '0' then
        if run_completed /= '0' then
          L4_out <= '0';
        end if;
      else
        if L3_out /= '0' then
          L4_out <= '0';
        end if;
      end if;

      if run_rising_edge then
        L3_out <= '0';
      elsif input_rising_edge then
        L3_out <= '1';
      end if;
      
    end if CLK_IF;
  end process main_proc;

end architecture rtl;
    
library IEEE;
use IEEE.Std_Logic_1164.all,
  ieee.numeric_std.all;

ENTITY pulses_gene_fpga IS
port (
	CLK_IN :  in std_logic;
	threshold_input :  in std_logic;
	pulse_A : out std_logic;
	pulse_B : out std_logic
);
END ENTITY pulses_gene_fpga;

architecture rtl of pulses_gene_fpga is
  component PG_clock_domain_sync IS
    port (
	CLK :  in std_logic;
	request_input :  in std_logic;
	run_out : out std_logic;
	run_completed : in std_logic
    );
  end component PG_clock_domain_sync;
  signal run_s : std_logic;
  signal run_completed : std_logic;
  signal unit_counter : std_logic_vector( 3 downto 0 );
  signal global_counter : std_logic_vector( 3 downto 0 );
begin


  main_proc : process( CLK_IN )
    variable global_counter_v : std_logic_vector( global_counter'range );
  begin
    CLK_IF : if rising_edge( CLK_IN ) then
      if run_s = '1' then
        if signed( unit_counter ) = to_signed( -1, unit_counter'length ) then 
          unit_counter <= ( others => '0' );
          global_counter_v := std_logic_vector( unsigned( global_counter ) + 1 );
          case global_counter_v is
            when "0000" =>
              pulse_A <= '0';
              pulse_B <= '0';
            when "0001" =>
              pulse_A <= '1';
            when "0010" =>
              pulse_A <= '0';
            when "0011" =>
              pulse_B <= '1';
            when "0100" =>
              pulse_B <= '0';
            when "1001" =>
              run_completed <= '1';
            when others =>
              null;
            end case;  
          global_counter <= global_counter_v;
        else
          unit_counter <= std_logic_vector( unsigned( unit_counter ) + 1 );
        end if;  
      else
        pulse_A <= '0';
        pulse_B <= '0';
        run_completed <= '0';
        unit_counter <= ( others => '1' );
        global_counter <= ( others => '1' );
      end if;
    end if CLK_IF;
  end process main_proc;
end architecture rtl;
