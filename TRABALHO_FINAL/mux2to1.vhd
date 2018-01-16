library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux2to1 is
port (CONTA_DES: in std_logic_vector (9 downto 0);
      TENTATIVAS10B: in std_logic_vector (9 downto 0); 
   	SEL_LED: in std_logic;
		LED_OUT: out std_logic_vector (9 downto 0)
     );
end mux2to1;

architecture mux_estr of mux2to1 is
begin 
	LED_OUT <= CONTA_DES when SEL_LED = '1' else TENTATIVAS10B;
end mux_estr;