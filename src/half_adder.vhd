library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Half-adder block
-- Sends the sum of two bits with carry-out signal.

entity half_adder is
    Port ( a, b : in STD_LOGIC;
       f, c_out : out STD_LOGIC);
end half_adder;

-- f = ab' + a'b = a XOR b
-- c_out = ab

-- Truth table:
--
-- a b | f | c_out
-- 0 0 | 0 | 0
-- 0 1 | 1 | 0
-- 1 0 | 1 | 0
-- 1 1 | 0 | 1
--

architecture Behavioral of half_adder is

    component XOR_gate is
        Port ( a, b : in STD_LOGIC;
                  f : out STD_LOGIC);
    end component;

    component AND_gate is
        Port ( a, b : in STD_LOGIC;
                  f : out STD_LOGIC);
    end component;

begin
    XOR_1: XOR_gate Port Map ( a, b, f );
    AND_1: AND_gate Port Map ( a, b, c_out );
end Behavioral;
