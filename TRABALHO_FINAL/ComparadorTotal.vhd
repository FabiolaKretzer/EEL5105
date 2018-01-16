library ieee;
use ieee.std_logic_1164.all;

entity ComparadorTotal is
port ( SEQ_0, SEQ_1, SEQ_2, SEQ_3: IN STD_LOGIC_VECTOR(4 downto 0);
		CONTA_DES: IN std_logic_vector(9 downto 0);
		Teste_Pass: IN STD_LOGIC;
		Pass_Certo, Saldo: OUT STD_LOGIC
);
end ComparadorTotal;

architecture Comparador_stru of ComparadorTotal is

component ComparadorPass
port (SEQ_0, SEQ_1, SEQ_2, SEQ_3: IN STD_LOGIC_VECTOR(4 downto 0);
		Teste_Pass: IN STD_LOGIC;
		Pass_Certo: OUT STD_LOGIC
		);
end component;

component ComparadorSaldo
port (Conta_Des: IN STD_LOGIC_VECTOR(9 downto 0);
		Saldo: OUT STD_LOGIC
		);
end component;

begin
L1: ComparadorPass port map (SEQ_0, SEQ_1, SEQ_2, SEQ_3, Teste_Pass, Pass_Certo);
L2: ComparadorSaldo port map (CONTA_DES, Saldo);

end Comparador_stru;
-- END da architecture