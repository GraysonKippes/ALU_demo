library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 1-to-2 demultiplexor

-- When c = 0, then the input is driven to o0.
-- When c = 1, then the input is driven to o1.

entity demux_1_to_2 is
    Port ( input : in STD_LOGIC;
           c : in STD_LOGIC;
           o0, o1 : out STD_LOGIC);
end demux_1_to_2;

-- o0 = input.c'
-- o1 = input.c

architecture Behavioral of demux_1_to_2 is

component NOT_gate is
    Port ( a : in STD_LOGIC;
           f : out STD_LOGIC);
end component;

component AND_gate is
    Port ( a, b : in STD_LOGIC;
              f : out STD_LOGIC);
end component;

-- Used in (partial) decoding of control signal.
-- The decoded signal is equalivalent to the bit-vector { c, not_c }.
-- When c is 0, then the decoded signal is 01, and the input is driven to o0.
-- When c is 1, then the decoded signal is 10, and the input is driven to o1.
signal not_c : STD_LOGIC;

begin
NOT_0: NOT_gate Port Map ( c, not_c );
AND_0: AND_gate Port Map ( input, not_c, o0 );
AND_1: AND_gate Port Map ( input, c, o1 );
end Behavioral;
