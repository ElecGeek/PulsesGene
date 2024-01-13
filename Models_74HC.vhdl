library IEEE;
use IEEE.Std_Logic_1164.all;


package Includes_74HC is
  component HC7402
    port (
      P1  : out std_logic;
      P2  :  in std_logic;
      P3  :  in std_logic;
      P4  : out std_logic;
      P5  :  in std_logic;
      P6  :  in std_logic;
      P10 : out std_logic;
      P8  :  in std_logic;
      P9  :  in std_logic;
      P13 : out std_logic;
      P11 :  in std_logic;
      P12 :  in std_logic;
      P7  : inout std_logic;
      P14 : inout std_logic
      );
  end component HC7402;
  component HC7400
    port (
      P1  :  in std_logic;
      P2  :  in std_logic;
      P3  : out std_logic;
      P4  :  in std_logic;
      P5  :  in std_logic;
      P6  : out std_logic;
      P10 :  in std_logic;
      P8  : out std_logic;
      P9  :  in std_logic;
      P13 :  in std_logic;
      P11 : out std_logic;
      P12 :  in std_logic;
      P7  : inout std_logic;
      P14 : inout std_logic
      );
  end component HC7400;
  component HC7473
    port (
      P1  :  in std_logic;
      P2  :  in std_logic;
      P3  :  in std_logic;
      P5  :  in std_logic;
      P6  :  in std_logic;
      P7  :  in std_logic;
      P8  : out std_logic;
      P9  : out std_logic;
      P10 :  in std_logic;
      P12 : out std_logic;
      P13 : out std_logic;
      P14 :  in std_logic;
      P11 : inout std_logic;
      P4  : inout std_logic
      );
  end component HC7473;
  component HC74163
    port (
      P1  :  in std_logic;
      P2  :  in std_logic;
      P3  :  in std_logic;
      P4  :  in std_logic;
      P5  :  in std_logic;
      P6  :  in std_logic;
      P7  :  in std_logic;
      P9  :  in std_logic;
      P10 :  in std_logic;
      P11 : out std_logic;
      P12 : out std_logic;
      P13 : out std_logic;
      P14 : out std_logic;
      P15 : out std_logic;
      P8  : inout std_logic;
      P16 : inout std_logic
      );
  end component HC74163;

end package Includes_74HC;

library IEEE;
use IEEE.Std_Logic_1164.all;
entity HC7402 is
    port (
      P1  : out std_logic;
      P2  :  in std_logic;
      P3  :  in std_logic;
      P4  : out std_logic;
      P5  :  in std_logic;
      P6  :  in std_logic;
      P10 : out std_logic;
      P8  :  in std_logic;
      P9  :  in std_logic;
      P13 : out std_logic;
      P11 :  in std_logic;
      P12 :  in std_logic;
      P7  : inout std_logic;
      P14 : inout std_logic
      );
end entity HC7402;

architecture arch of HC7402 is
begin
  P7 <= 'L';
  P14 <= 'H';
  main_proc : process( P2, P3, P5, P6, P8, P9, P11, P12 )
    begin
      P1 <= not ( P2 or P3 );
      P4 <= not ( P5 or P6 );
      P10 <= not ( P8 or P9 );
      P13 <= not ( P11 or P12 );
    end process main_proc;

end architecture arch;

      
library IEEE;
use IEEE.Std_Logic_1164.all;
entity HC7400 is
    port (
      P1  :  in std_logic;
      P2  :  in std_logic;
      P3  : out std_logic;
      P4  :  in std_logic;
      P5  :  in std_logic;
      P6  : out std_logic;
      P9  :  in std_logic;
      P10 :  in std_logic;
      P8  : out std_logic;
      P12 :  in std_logic;
      P13 :  in std_logic;
      P11 : out std_logic;
      P7  : inout std_logic;
      P14 : inout std_logic
      );
end entity HC7400;

architecture arch of HC7400 is
begin
  P7 <= 'L';
  P14 <= 'H';
  main_proc : process( P1, P2, P4, P5, P9, P10, P12, P13 )
    begin
      P3 <= not ( P1 and P2 );
      P6 <= not ( P4 and P5 );
      P8 <= not ( P9 and P10 );
      P11 <= not ( P12 and P13 );
    end process main_proc;

end architecture arch;

library IEEE;
use IEEE.Std_Logic_1164.all;
entity HC7473_half is
  port (
    CP  :  in std_logic;
    RST :  in std_logic;
    K   :  in std_logic;
    J   :  in std_logic;
    Q   : out std_logic;
    Qbr : out std_logic
    );
end entity HC7473_half;

architecture arch of HC7473_half is
  signal theOut : std_logic;
begin
  Q <= theOut;
  Qbr <= not theOut;
  main_proc : process( CP, RST )
    begin
      RST_if : if RST = '0' or RST = 'L' then
        theOut <= '0';
      else
        if falling_edge( CP ) then
          if ( J = '1' or J = 'H' ) and ( K = '1' or K = 'H' ) then
            theOut <= not theOut;
          elsif J = '1' or J = 'H' then
            theOut <= '1';
          elsif K = '1' or K = 'H' then
            theOut <= '0';
          end if;
        end if;
      end if RST_if;
    end process main_proc;
end architecture arch;

library IEEE;
use IEEE.Std_Logic_1164.all;
entity HC7473 is
    port (
      P1  :  in std_logic;
      P2  :  in std_logic;
      P3  :  in std_logic;
      P5  :  in std_logic;
      P6  :  in std_logic;
      P7  :  in std_logic;
      P8  : out std_logic;
      P9  : out std_logic;
      P10 :  in std_logic;
      P12 : out std_logic;
      P13 : out std_logic;
      P14 :  in std_logic;
      P11 : inout std_logic;
      P4  : inout std_logic
      );
end entity HC7473;

architecture arch of HC7473 is
  component HC7473_half is
    port (
      CP  :  in std_logic;
      RST :  in std_logic;
      K   :  in std_logic;
      J   :  in std_logic;
      Q   : out std_logic;
      Qbr : out std_logic
      );
  end component HC7473_half;
begin
  P11 <= 'L';
  P4 <= 'H';

  first_half : HC7473_half port map
    (
      CP  => P1,
      RST => P2,
      K   => P3,
      J   => P14,
      Q   => P12,
      Qbr => P13
      );
  second_half : HC7473_half port map
    (
      CP  => P5,
      RST => P6,
      K   => P10,
      J   => P7,
      Q   => P9,
      Qbr => P8
      );
  
end architecture arch;
      
library IEEE;
use IEEE.Std_Logic_1164.all,
  ieee.Numeric_std.all;
  
entity HC74163 is
    port (
      P1  :  in std_logic;
      P2  :  in std_logic;
      P3  :  in std_logic;
      P4  :  in std_logic;
      P5  :  in std_logic;
      P6  :  in std_logic;
      P7  :  in std_logic;
      P9  :  in std_logic;
      P10 :  in std_logic;
      P11 : out std_logic;
      P12 : out std_logic;
      P13 : out std_logic;
      P14 : out std_logic;
      P15 : out std_logic;
      P8  : inout std_logic;
      P16 : inout std_logic
      );
end entity HC74163;

architecture arch of HC74163 is
  signal theVal : std_logic_vector( 4 downto 0 );
begin
  P8 <= 'L';
  P16 <= 'H';
  
  P14 <= theVal( 0 );
  P13 <= theVal( 1 );
  P12 <= theVal( 2 );
  P11 <= theVal( 3 );
  P15 <= theVal( 4 );
  
  main_proc : process( P2 )
    variable count_f : std_logic_vector( 3 downto 0 );
    begin
      CLK_edge : if rising_edge( P2 ) then
        RST_if : if P1 = '1' or P1 = 'H' then
          LOAD_if : if P9 = '1' or P9 = 'H' then
            if ( P7 = '1' or P7 = 'H' ) and ( P10 = '1' or P10 = 'H' ) then
              count_f := std_logic_vector( unsigned( theVal( theVal'low + 3 downto theVal'low )) + 1 );
              theVal( theVal'high - 1 downto theVal'low ) <= count_f; 
              theVal( theVal'high ) <= count_f( 3 ) and count_f( 2 ) and count_f( 1 ) and count_f( 0 ); 
            end if;
          else
            theVal( 3 ) <= P6;
            theVal( 2 ) <= P5;
            theVal( 1 ) <= P4;
            theVal( 0 ) <= P3;
            theVal( 4 ) <= P3 and P4 and P5 and P6;
          end if LOAD_if;
        else
          theVal <= ( others => '0' );
        end if RST_if;
      end if CLK_edge;
    end process main_proc;
end architecture arch;
