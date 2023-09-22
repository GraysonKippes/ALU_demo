library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- AND gate block

entity AND_gate is
    Port ( a, b : in STD_LOGIC;
              f : out STD_LOGIC);
end AND_gate;

architecture Behavioral of AND_gate is
begin
    f <= a and b;
end Behavioral;
