library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod10to5 is
port (SW: in std_logic_vector(9 downto 0);
		IN_PASS: out std_logic_vector(4 downto 0)
);
end decod10to5;

architecture decod_bhv of decod10to5 is

begin
	IN_PASS <=
		"00000" when SW = "0000000001"
	else --- 0
		"00001" when SW = "0000000010"
	else --- 1
		"00010" when SW = "0000000100"
	else --- 2
		"00011" when SW = "0000001000"
	else --- 3
		"00100" when SW = "0000010000"
	else --- 4
		"00101" when SW = "0000100000"
	else --- 5
		"00110" when SW = "0001000000"
	else --- 6
		"00111" when SW = "0010000000"
	else --- 7
		"01000" when SW = "0100000000"
	else --- 8
		"01001" when SW = "1000000000"
	else --- 9
		"11111";
end decod_bhv;