library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- NOT gate block

entity NOT_gate is
    Port ( a : in STD_LOGIC;
           f : out STD_LOGIC);
end NOT_gate;

architecture Behavioral of NOT_gate is
begin
    f <= not a;
end Behavioral;
