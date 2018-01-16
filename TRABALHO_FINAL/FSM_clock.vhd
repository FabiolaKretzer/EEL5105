library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_clock is
	port (clock: in std_logic;
			reset: in std_logic;
			CLK1, CLK2: out std_logic
			);
end;

architecture bhv of FSM_clock is
	signal contador1: std_logic_vector(27 downto 0); -- CLK1 vai para 1 quando o valor da contagem for 49.999.999 (2FAF07F)
	signal contador2: std_logic_vector(27 downto 0); -- CLK2 vai para 1 quando o valor da contagem for 7.142.857 (6CFDC9)

begin
	P1: process(clock, reset)
	begin
		if reset= '0' then
			contador1 <= x"0000000";
			contador2 <= x"0000000";
		elsif clock'event and clock= '1' then
			contador1 <= contador1 + 1;
			contador2 <= contador2 + 1;
			if contador1 = x"2FAF07F" then
				contador1 <= x"0000000";
				CLK1 <= '1';
			else
				CLK1 <= '0';
			end if;
			
			if contador2 = x"6CFDC9" then
				contador2 <= x"0000000";
				CLK2 <= '1';
			else
				CLK2 <= '0';
			end if;
		end if;
	end process;
end bhv;