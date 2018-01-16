library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity conta_ascend is
	port (CONTA_ASC: out std_logic_vector(19 downto 0);
	clock: in std_logic;
	reset: in std_logic);
end;

architecture bhv of conta_ascend is
	signal contador: std_logic_vector(19 downto 0); -- registra valor da contagem
	
begin
	P1: process(clock, reset)
	begin
		if reset= '0' then
			contador <= x"00000";
		elsif rising_edge(clock) then
			contador(4 downto 0) <= contador(4 downto 0) + 1;
			if contador(4 downto 0) = "01001" then
				contador(4 downto 0) <= "00000";
				contador(9 downto 5) <= contador(9 downto 5) + 1;
				if contador(9 downto 5) = "00101" then
					contador(9 downto 5) <= "00000";
					contador(14 downto 10) <= contador(14 downto 10) + 1;
					if contador(14 downto 10) = "01001" then
						contador(14 downto 10) <= "00000";
						contador(19 downto 15) <= contador(19 downto 15) + 1;
						if contador(19 downto 15) = "00101" then
							contador <= x"00000";
						end if;
					end if;
				end if;
			end if;
			CONTA_ASC <= contador;
		end if;
	end process;
end bhv;