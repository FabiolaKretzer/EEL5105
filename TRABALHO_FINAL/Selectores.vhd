library ieee;
use ieee.std_logic_1164.all;

entity Selectores is
port ( SW : in std_logic_vector (9 downto 0);
		Agenda: in std_logic_vector(19 downto 0);
		Conta_Asc: in std_logic_vector(19 downto 0);
		Conta_Des: in std_logic_vector(9 downto 0);
		Sel_Disp: in std_logic_vector(1 downto 0);
		Sel_LED: in std_logic;
		Tentativas: in std_logic_vector(1 downto 0);
		LED_Out: out std_logic_vector(9 downto 0);
		Reg: out std_logic_vector(19 downto 0)
);
end Selectores;

architecture Select_stru of Selectores is
signal sIN_PASS5B: std_logic_vector (4 downto 0);
signal sTENTATIVAS10B: std_logic_vector (9 downto 0);
signal sIN_PASSES20B: std_logic_vector (19 downto 0);

component decod10to5
port (SW: in std_logic_vector(9 downto 0);
		IN_PASS: out std_logic_vector(4 downto 0));
end component;

component mux2to1
port (CONTA_DES: in std_logic_vector (9 downto 0);
      TENTATIVAS10B: in std_logic_vector (9 downto 0); 
   	SEL_LED: in std_logic;
		LED_OUT: out std_logic_vector (9 downto 0));
end component;

component mux4to1
port (ZEROS: in std_logic_vector(19 downto 0);
      IN_PASSES: in std_logic_vector(19 downto 0);
		AGENDA: in std_logic_vector(19 downto 0);
		CONTA_ASC: in std_logic_vector(19 downto 0);
		SEL_DISP: in std_logic_vector(1 downto 0);
		REG: out std_logic_vector(19 downto 0)
);
end component;

begin
	sTENTATIVAS10B <= "00000000" & Tentativas;
	sIN_PASSES20B <= sIN_PASS5B & sIN_PASS5B & sIN_PASS5B & sIN_PASS5B;
	
	L1: decod10to5 port map ( SW, sIN_PASS5B );
	L2: mux2to1 port map ( Conta_Des, sTENTATIVAS10B, Sel_LED, LED_Out );
	L3: mux4to1 port map ( "00000000000000000000", sIN_PASSES20B, Agenda, Conta_Asc, Sel_Disp, Reg);
end Select_stru;