library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
            sum : out STD_LOGIC_VECTOR (7 downto 0);
            overflow : out STD_LOGIC);
end adder;

architecture Behavioral of adder is

    component full_adder is
        Port ( a, b, c_in : in STD_LOGIC;
             f, c_out : out STD_LOGIC);
    end component;
    
    signal carry : STD_LOGIC_VECTOR (8 downto 0);

begin
    gen: for i in 0 to 7 generate
        uut: full_adder Port Map ( a => a(i), b => b(i), c_in => carry(i), f => sum(i), c_out => carry(i + 1) );
    end generate;
    overflow <= carry(8);
end Behavioral;
