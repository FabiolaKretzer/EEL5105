library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux4to1 is
port (ZEROS: in std_logic_vector(19 downto 0);
      IN_PASSES: in std_logic_vector(19 downto 0);
		AGENDA: in std_logic_vector(19 downto 0);
		CONTA_ASC: in std_logic_vector(19 downto 0);
		SEL_DISP: in std_logic_vector(1 downto 0);
		REG: out std_logic_vector(19 downto 0)
     );
end mux4to1;

architecture mux4to1_estr of mux4to1 is
begin 
   REG <= ZEROS when SEL_DISP = "00" else 
			IN_PASSES when SEL_DISP = "01" else
			AGENDA when SEL_DISP = "10" else
			CONTA_ASC;
end mux4to1_estr;