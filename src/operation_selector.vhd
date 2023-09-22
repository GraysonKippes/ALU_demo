library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Drives operand input to one of many operations.

entity operation_selector is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           f : out STD_LOGIC_VECTOR (7 downto 0));
end operation_selector;

architecture Behavioral of operation_selector is

component bus_demux is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           o0, o1, o2, o3, o4, o5, o6, o7 : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component bus_mux is
    Port ( i0, i1, i2, i3, i4, i5, i6, i7 : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component adder is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
            sum : out STD_LOGIC_VECTOR (7 downto 0);
            overflow : out STD_LOGIC);
end component;

component subtractor is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
            difference : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal a0, b0, a1, b1, ignored : STD_LOGIC_VECTOR (7 downto 0);
signal f0, f1 : STD_LOGIC_VECTOR (7 downto 0);

begin

ignored <= "00000000";

DEMUX_A: bus_demux Port Map ( a, control, a0, a1, ignored, ignored, ignored, ignored, ignored, ignored );
DEMUX_B: bus_demux Port Map ( b, control, b0, b1, ignored, ignored, ignored, ignored, ignored, ignored );

OP_0: adder Port Map ( a0, b0, f0 );
OP_1: subtractor Port Map ( a1, b1, f1 );

MUX: bus_mux Port Map ( f0, f1, ignored, ignored, ignored, ignored, ignored, ignored, control, f );

end Behavioral;
