library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtractor is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
           difference : out STD_LOGIC_VECTOR (7 downto 0));
end subtractor;

architecture Behavioral of subtractor is

component sign_flip is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           f : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component adder is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
            sum : out STD_LOGIC_VECTOR (7 downto 0);
            overflow : out STD_LOGIC);
end component;

signal subtractor : STD_LOGIC_VECTOR (7 downto 0);
signal ignored : STD_LOGIC;
    
begin
    FLIP: sign_flip Port Map ( b, subtractor );
    SUBTRACT: adder Port Map ( a, subtractor, difference, ignored );
end Behavioral;
