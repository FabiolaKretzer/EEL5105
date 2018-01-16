library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is
  port ( address : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(19 downto 0)
		 );
end entity ROM1;

architecture ROM_bhv of ROM1 is
  type mem is array ( 0 to 2**4 - 1) of std_logic_vector(19 downto 0);
  constant my_Rom : mem := (
    0  => "01010010110101101010", -- ABBA
    1  => "10111010100000111111", -- PAI
    2  => "10100010100111011111", -- MAE
    3  => "01010101001011011001", -- AMOR
    4  => "11010010100000100101", -- TAIS
    5  => "10001101101000010101", -- JOHN
    6  => "00101010101100101010", -- SARA
    7  => "10011110110110000001", -- LUCI
    8  => "10011011101101000001", -- LETI
    9  => "10001110111001100001", -- JULI
    10 => "01001010100101100001", -- GABI
    11 => "01010100111001100001", -- ALLI
    12 => "01111010100101100001", -- FABI
    13 => "10100010101001111011", -- MALU
    14 => "01100010101101101010", -- CAUA
    15 => "01100010100010101010"); -- CASA
	 
begin
   process (address)
   begin
     case address is
       when "0000" => data <= my_rom(0);
       when "0001" => data <= my_rom(1);
       when "0010" => data <= my_rom(2);
       when "0011" => data <= my_rom(3);
       when "0100" => data <= my_rom(4);
       when "0101" => data <= my_rom(5);
       when "0110" => data <= my_rom(6);
       when "0111" => data <= my_rom(7);
       when "1000" => data <= my_rom(8);
       when "1001" => data <= my_rom(9);
       when "1010" => data <= my_rom(10);
       when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
       when "1101" => data <= my_rom(13);
       when "1110" => data <= my_rom(14);
       when "1111" => data <= my_rom(15);
       when others => data <= "00000000000000000000";
	 end case;
  end process;
end architecture ROM_bhv;