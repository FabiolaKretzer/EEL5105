library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity FSMctrl is
port ( Clk, Rst, Enter, Saldo, Pass_Certo: IN STD_LOGIC;
		Estados: OUT STD_LOGIC_VECTOR(4 downto 0);
		Sel_Disp, Tentativas: OUT STD_LOGIC_VECTOR(1 downto 0);
		Teste_Pass, C0, C1, C2, C3, Sel_LED: OUT STD_LOGIC
		);
end FSMctrl;

architecture FSM_beh of FSMctrl is
	type states is (E0, E1, E2, E3, E4, E5, E6, E7, E8);
	signal EA, PE: states;
	signal sTentativaA, sTentativaP: std_logic_vector(1 downto 0);
	
begin

	Tentativas <= sTentativaA;

	P1: process (Clk, Rst)
	begin
		if Rst = '0' then
			EA <= E0;
		elsif Rising_Edge(Clk) then
			EA <= PE;
			sTentativaA <= sTentativaP;
		end if;
	end process;
	
	P2: process (EA, Enter, sTentativaA, Saldo, Pass_Certo)
	begin
		sTentativaP <= sTentativaA;
		case EA is
			when E0 => -- DESLIGADO
				Estados <= "00000";
				Teste_Pass <= '0';
				C0 <= '0';
				C1 <= '0';
				C2 <= '0';
				C3 <= '0';
				Sel_Disp <= "00";
				Sel_LED <= '0';
				sTentativaP <= "00";
				
				if Enter = '1' then
					PE <= E0;
				else
					PE <= E1;
				end if;
				
			when E1 => -- Intro PASS
				Estados <= "00001";
				Teste_Pass <= '0';
				C0 <= '0';
				C1 <= '0';
				C2 <= '0';
				C3 <= '0';
				Sel_Disp <= "01";
				Sel_LED <= '0';
				
				if Enter = '1' then
					PE <= E1;
				else
					PE <= E2;
				end if;
				
			when E2 => -- REG3
				Estados <= "00010";
				Teste_Pass <= '0';
				C0 <= '0';
				C1 <= '0';
				C2 <= '0';
				C3 <= '1';
				Sel_Disp <= "01";
				Sel_LED <= '0';

				if Enter = '1' then
					PE <= E2;
				else
					PE <= E3;
				end if;
				
			when E3 => -- REG2
				Estados <= "00011";
				Teste_Pass <= '0';
				C0 <= '0';
				C1 <= '0';
				C2 <= '1';
				C3 <= '0';
				Sel_Disp <= "01";
				Sel_LED <= '0';

				if Enter = '1' then
					PE <= E3;
				else
					PE <= E4;
				end if;
				
			when E4 => -- REG1
				Estados <= "00100";
				Teste_Pass <= '0';
				C0 <= '0';
				C1 <= '1';
				C2 <= '0';
				C3 <= '0';
				Sel_Disp <= "01";
				Sel_LED <= '0';

				if Enter = '1' then
					PE <= E4;
				else
					PE <= E5;
				end if;
				
			when E5 => -- REG0
				Estados <= "00101";
				Teste_Pass <= '0';
				C0 <= '1';
				C1 <= '0';
				C2 <= '0';
				C3 <= '0';
				Sel_Disp <= "01";
				Sel_LED <= '0';
				
				if Enter = '1' then
					PE <= E5;
				else
					PE <= E6;
				end if;
				
			when E6 => -- TESTE
				Estados <= "00110";
				Teste_Pass <= '1';
				C0 <= '0';
				C1 <= '0';
				C2 <= '0';
				C3 <= '0';
				Sel_Disp <= "01";
				Sel_LED <= '0';
				sTentativaP <= sTentativaA + 1;

				if sTentativaA = "11" and Pass_Certo = '0' then
					PE <= E0;
				elsif sTentativaA < "11" and Pass_Certo = '0' then
					PE <= E1;
				else
					PE <= E7;
				end if;
				
			when E7 => -- ON
				Estados <= "00111";
				Teste_Pass <= '0';
				C0 <= '1';
				C1 <= '1';
				C2 <= '1';
				C3 <= '1';
				Sel_Disp <= "10";
				Sel_LED <= '0';

				if Enter = '1' then
					PE <= E7;
				else
					PE <= E8;
				end if;
				
			when E8 => -- LIGA
				Estados <= "01000";
				Teste_Pass <= '0';
				C0 <= '1';
				C1 <= '1';
				C2 <= '1';
				C3 <= '1';
				Sel_Disp <= "11";
				Sel_LED <= '1';
				
				if Saldo = '0' then
					PE <= E0;
				elsif  Enter = '0' then
					PE <= E7;
				else
					PE <= E8;
				end if;

		end case;
	end process;
end FSM_beh;