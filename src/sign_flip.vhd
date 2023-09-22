library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Takes an 8-bit number and flips the sign according to 2's complement.

entity sign_flip is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           f : out STD_LOGIC_VECTOR (7 downto 0));
end sign_flip;

architecture Behavioral of sign_flip is

component bitwise_NOT is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           f : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component adder is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
        sum : out STD_LOGIC_VECTOR (7 downto 0);
        overflow : out STD_LOGIC);
end component;

signal inverted : STD_LOGIC_VECTOR (7 downto 0);
signal ignored : STD_LOGIC;

begin
    INVERT: bitwise_NOT Port Map ( a, inverted );
    ADD: adder Port Map ( inverted, "00000001", f, ignored );
end Behavioral;
