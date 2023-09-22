library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- OR gate block

entity OR_gate is
    Port ( a, b : in STD_LOGIC;
              f : out STD_LOGIC);
end OR_gate;

architecture Behavioral of OR_gate is
begin
    f <= a or b;
end Behavioral;
