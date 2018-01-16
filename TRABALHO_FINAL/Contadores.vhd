library ieee;
use ieee.std_logic_1164.all;

entity Contadores is
port (BTN0, SEL_LED, CLOCK_50: in std_logic;
		SEL_DISP: in std_logic_vector (1 downto 0);
		
		CONTA_ASC: out std_logic_vector(19 downto 0);		-- Saida de dados
		CONTA_DES: out std_logic_vector(9 downto 0)		-- Saida de dados
	);
end Contadores;

architecture Cont_stru of Contadores is
	signal sCLK1, sCLK2: std_logic;
	signal sRST_CONT: std_logic;
	
component FSM_clock 
port (clock: in std_logic;
		reset: in std_logic;
		CLK1, CLK2: out std_logic
);
end component;

component conta_ascend
port (CONTA_ASC: out std_logic_vector(19 downto 0);
		clock: in std_logic;
		reset: in std_logic
);
end component;

component conta_descend
port (CONTA_DES: out std_logic_vector(9 downto 0);
		SEL_LED: in std_logic;
		clock: in std_logic;
		reset: in std_logic
);
end component;

begin
	
	sRST_CONT <= '0' when (BTN0 = '0' or SEL_DISP /= "11") else
					 '1';
	
	L0: FSM_clock port map (CLOCK_50, BTN0, sCLK1, sCLK2);
	L1: conta_ascend port map (CONTA_ASC, sCLK1, sRST_CONT);
	L2: conta_descend port map (CONTA_DES, SEL_LED, sCLK2, BTN0);	

end Cont_stru;