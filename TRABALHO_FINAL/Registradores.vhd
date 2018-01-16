library ieee;
use ieee.std_logic_1164.all;

entity Registradores is
port (BTN0, C0, C1, C2, C3 : IN std_logic;
		REG: IN std_logic_vector (19 downto 0);
		CLOCK_50: in std_logic;
		
		SEQ_3: out std_logic_vector(4 downto 0);		-- Saida de dados
		SEQ_2: out std_logic_vector(4 downto 0);		-- Saida de dados
		SEQ_1: out std_logic_vector(4 downto 0);		-- Saida de dados
		SEQ_0: out std_logic_vector(4 downto 0)			-- Saida de dados
	);
end Registradores;

architecture Regist_stru of Registradores is
	
component FlipFlop5 
port (Clk, Rst, Enable: IN STD_LOGIC;				-- entradas de controle
		D: IN STD_LOGIC_VECTOR (4 DOWNTO 0);		-- entrada de dado
		Q: OUT STD_LOGIC_VECTOR (4 DOWNTO 0)		-- saida de dado
);
end component;

begin
	
	reg19_15: FlipFlop5 port map (CLOCK_50, BTN0, C3, REG(19 downto 15), SEQ_3);
	reg14_10: FlipFlop5 port map (CLOCK_50, BTN0, C2, REG(14 downto 10), SEQ_2);
	reg9_5:	 FlipFlop5 port map (CLOCK_50, BTN0, C1, REG(9 downto 5), SEQ_1);
	reg4_0:	 FlipFlop5 port map (CLOCK_50, BTN0, C0, REG(4 downto 0), SEQ_0);

end Regist_stru;