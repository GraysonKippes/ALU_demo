library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- XOR gate block

entity XOR_gate is
    Port ( a, b : in STD_LOGIC;
              f : out STD_LOGIC);
end XOR_gate;

architecture Behavioral of XOR_gate is
begin
    f <= (a and not b) or (not a and b);
end Behavioral;
