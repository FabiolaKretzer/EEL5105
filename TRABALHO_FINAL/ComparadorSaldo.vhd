library ieee; use ieee.std_logic_1164.all;

entity ComparadorSaldo is
port ( Conta_Des: IN STD_LOGIC_VECTOR(9 downto 0);
		 Saldo: OUT STD_LOGIC
		);
end ComparadorSaldo;

architecture Comparador_beh of ComparadorSaldo is
begin

	P1: process (Conta_Des)
	begin 
		if Conta_Des = "0000000000" then
			Saldo <= '0';
		else
			Saldo <= '1';
		end if;
	end process;
	
end Comparador_beh;