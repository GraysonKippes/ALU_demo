library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 8-to-1 multiplexor on 8-bit buses.

entity bus_mux is
    Port ( i0, i1, i2, i3, i4, i5, i6, i7 : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end bus_mux;

architecture Behavioral of bus_mux is

component mux_8_to_1 is
    Port ( i0, i1, i2, i3, i4, i5, i6, i7 : in STD_LOGIC;
           control : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC);
end component;

begin
    gen: for i in 0 to 7 generate
        MUX: mux_8_to_1 Port Map ( i0(i), i1(i), i2(i), i3(i), i4(i), i5(i), i6(i), i7(i), control, output(i) );
    end generate;
end Behavioral;
