library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 8-to-1 multiplexor.

-- When control = 000, i0 is driven to output.
-- When control = 001, i1 is driven to output.
-- When control = 010, i2 is driven to output.
-- When control = 011, i3 is driven to output.
-- When control = 100, i4 is driven to output.
-- When control = 101, i5 is driven to output.
-- When control = 110, i6 is driven to output.
-- When control = 111, i7 is driven to output.

entity mux_8_to_1 is
    Port ( i0, i1, i2, i3, i4, i5, i6, i7 : in STD_LOGIC;
           control : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC);
end mux_8_to_1;

architecture Behavioral of mux_8_to_1 is

component mux_2_to_1 is
    Port ( i0, i1 : in STD_LOGIC;
           c : in STD_LOGIC;
           output : out STD_LOGIC);
end component;

-- Output signal of each intermediate multiplexor.
signal m0, m1, m2, m3, m4, m5 : STD_LOGIC;

begin

MUX_0: mux_2_to_1 Port Map ( i0, i4, control(2), m0 );
MUX_1: mux_2_to_1 Port Map ( i2, i6, control(2), m1 );
MUX_2: mux_2_to_1 Port Map ( i1, i5, control(2), m2 );
MUX_3: mux_2_to_1 Port Map ( i3, i7, control(2), m3 );

MUX_4: mux_2_to_1 Port Map ( m0, m1, control(1), m4 );
MUX_5: mux_2_to_1 Port Map ( m2, m3, control(1), m5 );

MUX_6: mux_2_to_1 Port Map ( m4, m5, control(0), output );

end Behavioral;
