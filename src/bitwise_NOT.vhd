library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_NOT is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           f : out STD_LOGIC_VECTOR (7 downto 0));
end bitwise_NOT;

architecture Behavioral of bitwise_NOT is

component NOT_gate is
    Port ( a : in STD_LOGIC;
           f : out STD_LOGIC);
end component;

begin
    gen: for i in 0 to 7 generate
        NOT1: NOT_gate Port Map ( a(i), f(i) );
    end generate;
end Behavioral;
