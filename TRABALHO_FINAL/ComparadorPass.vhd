library ieee; use ieee.std_logic_1164.all;

entity ComparadorPass is
port ( SEQ_0, SEQ_1, SEQ_2, SEQ_3: IN STD_LOGIC_VECTOR(4 downto 0);
		Teste_Pass: IN STD_LOGIC;
		Pass_Certo: OUT STD_LOGIC
		);
end ComparadorPass;

architecture Comparador_beh of ComparadorPass is
	signal Password: std_logic_vector(19 downto 0);
	signal Resultado: std_logic; -- saida do primeiro comparador
	
begin


	P1: process (SEQ_0, SEQ_1, SEQ_2, SEQ_3, Teste_Pass, Resultado, Password)
	begin 
		Password <= "00000001110001000101"; -- 0725
		Resultado <= '1';
		Pass_Certo <= '0';
		if SEQ_0(4 downto 0) /= Password(4 downto 0) then
			Resultado <= '0';
		elsif SEQ_1(4 downto 0) /= Password(9 downto 5) then
			Resultado <= '0';
		elsif SEQ_2(4 downto 0) /= Password(14 downto 10) then
			Resultado <= '0';
		elsif SEQ_3(4 downto 0) /= Password(19 downto 15) then
			Resultado <= '0';
		end if;
		
		if Teste_Pass = '1' and Resultado = '1' then
			Pass_Certo <= '1';
		end if;
	end process;
	
end Comparador_beh;