library ieee ;
use ieee.std_logic_1164.all;

entity FlipFlop5 is
	port ( Clk, Rst, Enable: in std_logic;			-- entradas de controle
			D : in std_logic_vector(4 downto 0);		-- entrada de dado
			Q : out std_logic_vector(4 downto 0)		-- saida de dado
		 );
end FlipFlop5 ;

architecture FF_bhv of FlipFlop5 is

begin
	process (Clk, Rst, Enable)							-- Process que depende das entradas de clock, Reset e enable
	begin
		if Rst = '0' then							-- se o reset for pressionado
			Q <= (others => '0');					-- o FlipFlop e zerado
		elsif Rising_Edge(Clk) then				-- se o clock mudar (ativo) 
			if Enable = '1' then							-- e se o enable estiver em 1
				Q <= D;										-- entao a saida Q recebe o valor da entrada D
			end if;
		end if;
	end process;
end FF_bhv;