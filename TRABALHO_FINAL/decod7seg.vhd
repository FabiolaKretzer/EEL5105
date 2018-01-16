library IEEE;
use IEEE.Std_Logic_1164.all;

entity decod7seg is
port (ENTRADA: in std_logic_vector(4 downto 0);
		SAIDA: out std_logic_vector(6 downto 0)
);
end decod7seg;

architecture decod7_bhv of decod7seg is

begin
	SAIDA <= "1000000" when ENTRADA = "00000" else --- 0
				"1111001" when ENTRADA = "00001" else --- 1 e i
				"0100100" when ENTRADA = "00010" else --- 2 e Z
				"0110000" when ENTRADA = "00011" else --- 3
				"0011001" when ENTRADA = "00100" else --- 4
				"0010010" when ENTRADA = "00101" else --- 5 e S
				"0000010" when ENTRADA = "00110" else --- 6
				"1111000" when ENTRADA = "00111" else --- 7
				"0000000" when ENTRADA = "01000" else --- 8
				"0011000" when ENTRADA = "01001" else --- 9 e G
				"0001000" when ENTRADA = "01010" else --- A
				"0000011" when ENTRADA = "01011" else --- B
				"1000110" when ENTRADA = "01100" else --- C
				"0100001" when ENTRADA = "01101" else --- D
				"0000110" when ENTRADA = "01110" else --- E
				"0001110" when ENTRADA = "01111" else --- F
				"0001001" when ENTRADA = "10000" else --- H e X 
				"1100001" when ENTRADA = "10001" else --- J
				"0000101" when ENTRADA = "10010" else --- k
				"1000111" when ENTRADA = "10011" else --- L
				"0101011" when ENTRADA = "10100" else --- M
				"1001000" when ENTRADA = "10101" else --- N
				"1000000" when ENTRADA = "10110" else --- O
				"0001100" when ENTRADA = "10111" else --- P
				"0011000" when ENTRADA = "11000" else --- Q
				"0101111" when ENTRADA = "11001" else --- r
				"0000111" when ENTRADA = "11010" else --- t
				"1000001" when ENTRADA = "11011" else --- U e V
				"1100011" when ENTRADA = "11100" else --- W
				"0010001" when ENTRADA = "11101" else --- Y         
				"1111111";--------" " 
end decod7_bhv;