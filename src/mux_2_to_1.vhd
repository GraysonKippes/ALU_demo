library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2-to-1 multiplexor.

-- When c = 0, i0 is driven to output.
-- When c = 1, i1 is driven to output.

entity mux_2_to_1 is
    Port ( i0, i1 : in STD_LOGIC;
           c : in STD_LOGIC;
           output : out STD_LOGIC);
end mux_2_to_1;

-- output = c'.i0 + c.i1

architecture Behavioral of mux_2_to_1 is

component NOT_gate is
    Port ( a : in STD_LOGIC;
           f : out STD_LOGIC);
end component;

component OR_gate is
    Port ( a, b : in STD_LOGIC;
              f : out STD_LOGIC);
end component;

component AND_gate is
    Port ( a, b : in STD_LOGIC;
              f : out STD_LOGIC);
end component;

signal not_c, i0_and_not_c, i1_and_c : STD_LOGIC;

begin
NOT_0: NOT_gate Port Map ( c, not_c );
AND_0: AND_gate Port Map ( i0, not_c, i0_and_not_c );
AND_1: AND_gate Port Map ( i1, c, i1_and_c );
OR_0: OR_gate Port Map ( i0_and_not_c, i1_and_c, output );
end Behavioral;
