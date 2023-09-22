library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_hex is
    Port (a, b, c, d : in STD_LOGIC;
             display : out STD_LOGIC_VECTOR (6 downto 0));
end display_hex;

architecture Behavioral of display_hex is

signal digit : STD_LOGIC_VECTOR (3 downto 0);

begin

digit(3) <= a;
digit(2) <= b;
digit(1) <= c;
digit(0) <= d;

process ( digit )
begin
case digit is
    when "0000" => display <= "0000001"; -- 0
    when "0001" => display <= "1001111"; -- 1
    when "0010" => display <= "0010010"; -- 2
    when "0011" => display <= "0000110"; -- 3
    when "0100" => display <= "1001100"; -- 4
    when "0101" => display <= "0100100"; -- 5
    when "0110" => display <= "0100000"; -- 6
    when "0111" => display <= "0001111"; -- 7
    when "1000" => display <= "0000000"; -- 8
    when "1001" => display <= "0000100"; -- 9
    when "1010" => display <= "0001000"; -- A
    when "1011" => display <= "1100000"; -- B
    when "1100" => display <= "1110010"; -- C
    when "1101" => display <= "1000010"; -- D
    when "1110" => display <= "0110000"; -- E
    when "1111" => display <= "0111000"; -- F
end case;
end process;
end Behavioral;
