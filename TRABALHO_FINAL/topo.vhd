library ieee;
use ieee.std_logic_1164.all;

entity topo is
port ( SW : in std_logic_vector(9 downto 0);
		HEX0: out std_logic_vector(6 downto 0);
		HEX1: out std_logic_vector(6 downto 0);
		HEX2: out std_logic_vector(6 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
		HEX4: out std_logic_vector(6 downto 0);
		HEX5: out std_logic_vector(6 downto 0);
		LEDR : out std_logic_vector (9 downto 0);
		KEY: in std_logic_vector (3 downto 0);
		clock_50: in std_logic
);
end topo;

architecture topo_stru of topo is
	signal BTN: std_logic_vector(3 downto 0);
	signal sSALDO, sPASS_CERTO: std_logic;
	signal sESTADOS: std_logic_vector(4 downto 0);
	signal sSEL_DISP: std_logic_vector(1 downto 0);
	signal sTESTE_PASS, sC0, sC1, sC2, sC3, sSEL_LED: std_logic;
	signal sSEQ_0, sSEQ_1, sSEQ_2, sSEQ_3: std_logic_vector(4 downto 0);
	signal sREG, sCONTA_ASC, sAGENDA: std_logic_vector(19 downto 0);
	signal sCONTA_DES: std_logic_vector(9 downto 0);
	signal sTENTATIVAS: std_logic_vector(1 downto 0);

component ButtonSync
	port
	(	key0, key1, key2, key3, clk: in  std_logic;
		btn0, btn1, btn2, btn3: out std_logic
	);
end component;
	
component FSMctrl
port ( Clk, Rst, Enter, Saldo, Pass_Certo: IN STD_LOGIC;
		Estados: OUT STD_LOGIC_VECTOR(4 downto 0);
		Sel_Disp, Tentativas: OUT STD_LOGIC_VECTOR(1 downto 0);
		Teste_Pass, C0, C1, C2, C3, Sel_LED: OUT STD_LOGIC
	  );
end component;

component ComparadorTotal
port (SEQ_0, SEQ_1, SEQ_2, SEQ_3: IN STD_LOGIC_VECTOR(4 downto 0);
		CONTA_DES: IN std_logic_vector(9 downto 0);
		Teste_Pass: IN STD_LOGIC;
		Pass_Certo, Saldo: OUT STD_LOGIC
);
end component;

component Registradores
port (BTN0, C0, C1, C2, C3 : IN std_logic;
		REG: IN std_logic_vector (19 downto 0);
		CLOCK_50: in std_logic;
		SEQ_3: out std_logic_vector(4 downto 0);		-- Saida de dados
		SEQ_2: out std_logic_vector(4 downto 0);		-- Saida de dados
		SEQ_1: out std_logic_vector(4 downto 0);		-- Saida de dados
		SEQ_0: out std_logic_vector(4 downto 0)			-- Saida de dados
);
end component;

component Contadores
port (BTN0, SEL_LED, CLOCK_50: in std_logic;
		SEL_DISP: in std_logic_vector (1 downto 0);
		
		CONTA_ASC: out std_logic_vector(19 downto 0);		-- Saida de dados
		CONTA_DES: out std_logic_vector(9 downto 0)			-- Saida de dados
);
end component;

component ROM1
port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(19 downto 0)
);
end component;

component Selectores
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
end component;

component decod7seg
port ( ENTRADA: in std_logic_vector(4 downto 0);
		SAIDA: out std_logic_vector(6 downto 0)
);
end component;

begin
	
	L0: ButtonSync port map (KEY(0), KEY(1), KEY(2), KEY(3), clock_50, BTN(0), BTN(1), BTN(2), BTN(3) );
	L1: FSMctrl port map ( clock_50, BTN(0), BTN(3), sSALDO, sPASS_CERTO, sESTADOS, sSEL_DISP, sTENTATIVAS, sTESTE_PASS, sC0, sC1, sC2, sC3, sSEL_LED );
	L2: ComparadorTotal port map ( sSEQ_0, sSEQ_1, sSEQ_2, sSEQ_3, sCONTA_DES, sTESTE_PASS, sPASS_CERTO, sSALDO );
	L3: Registradores port map ( BTN(0), sC0, sC1, sC2, sC3, sREG, clock_50, sSEQ_3, sSEQ_2, sSEQ_1, sSEQ_0 );
	L4: Contadores port map ( BTN(0), sSEL_LED, clock_50, sSEL_DISP, sCONTA_ASC, sCONTA_DES);
	L5: ROM1 port map ( SW(3 downto 0), sAGENDA);
	L6: Selectores port map ( SW, sAGENDA, sCONTA_ASC, sCONTA_DES, sSEL_DISP, sSEL_LED, sTENTATIVAS, LEDR, sREG);
	L7: decod7seg port map (sESTADOS, HEX4);
	L8: decod7seg port map (sSEQ_3, HEX3);
	L9: decod7seg port map (sSEQ_2, HEX2);
	L10: decod7seg port map (sSEQ_1, HEX1);
	L11: decod7seg port map (sSEQ_0, HEX0);
	
	HEX5 <= "0000110";
	
end topo_stru;