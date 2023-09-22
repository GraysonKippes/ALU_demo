library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Full-adder block
-- Sends the sum of two bits with carry-in and carry-out signals.

entity full_adder is
    Port ( a, b, c_in : in STD_LOGIC;
             f, c_out : out STD_LOGIC);
end full_adder;

-- Truth table:
--
-- c_in a b | f | c_out
-- 0    0 0 | 0 | 0
-- 0    0 1 | 1 | 0
-- 0    1 0 | 1 | 0
-- 0    1 1 | 0 | 1
-- 1    0 0 | 1 | 0
-- 1    0 1 | 0 | 1
-- 1    1 0 | 0 | 1
-- 1    1 1 | 1 | 1
--

architecture Behavioral of full_adder is

    signal half_sum, carry1, carry2 : STD_LOGIC;

    component half_adder is
        Port ( a, b : in STD_LOGIC;
           f, c_out : out STD_LOGIC);
    end component;
    
    component OR_gate is
        Port ( a, b : in STD_LOGIC;
                  f : out STD_LOGIC);
    end component;

begin
    HALF_ADD_1: half_adder Port Map ( a, b, half_sum, carry1 );
    HALF_ADD_2: half_adder Port Map ( half_sum, c_in, f, carry2 );
    OR_1: OR_gate Port Map ( carry1, carry2, c_out );
end Behavioral;
