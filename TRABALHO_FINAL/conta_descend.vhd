library ieee;
use ieee.std_logic_1164.all;
-- use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity conta_descend is
	port (CONTA_DES: out std_logic_vector(9 downto 0);
	SEL_LED: in std_logic;
	clock: in std_logic;
	reset: in std_logic);
end;

architecture bhv of conta_descend is
	signal contador: unsigned (9 downto 0);
begin
	P1: process(clock, reset, contador, SEL_LED)
	begin
		if reset= '0' then
			contador <= "1111110100";
		elsif rising_edge(clock) and SEL_LED='1' then
			if contador /= 0 then
				contador <= contador - 1;
			end if;
		end if;
		CONTA_DES <= std_logic_vector(contador);
	end process;
end bhv;