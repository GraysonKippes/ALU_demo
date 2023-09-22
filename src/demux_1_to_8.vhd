library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 1-to-8 demultiplexor.

-- When control = 000, input is driven to o0.
-- When control = 001, input is driven to o1.
-- When control = 010, input is driven to o2.
-- When control = 011, input is driven to o3.
-- When control = 100, input is driven to o4.
-- When control = 101, input is driven to o5.
-- When control = 110, input is driven to o6.
-- When control = 111, input is driven to o7.

entity demux_1_to_8 is
    Port ( input : in STD_LOGIC;
           control : in STD_LOGIC_VECTOR (2 downto 0);
           o0, o1, o2, o3, o4, o5, o6, o7 : out STD_LOGIC);
end demux_1_to_8;

architecture Behavioral of demux_1_to_8 is

component demux_1_to_2 is
    Port ( input : in STD_LOGIC;
           c : in STD_LOGIC;
           o0, o1 : out STD_LOGIC);
end component;

-- Output signals for intermediate demultiplexors.
signal dm0_o0, dm0_o1 : STD_LOGIC;  -- Demux 0
signal dm1_o0, dm1_o1 : STD_LOGIC;  -- Demux 1
signal dm2_o0, dm2_o1 : STD_LOGIC;  -- Demux 2

begin

DEMUX_0: demux_1_to_2 Port Map ( input, control(2), dm0_o0, dm0_o1 );

DEMUX_1: demux_1_to_2 Port Map ( dm0_o0, control(1), dm1_o0, dm1_o1 );
DEMUX_2: demux_1_to_2 Port Map ( dm0_o1, control(1), dm2_o0, dm2_o1 );

DEMUX_3: demux_1_to_2 Port Map ( dm1_o0, control(0), o0, o1 );
DEMUX_4: demux_1_to_2 Port Map ( dm1_o1, control(0), o2, o3 );
DEMUX_5: demux_1_to_2 Port Map ( dm2_o0, control(0), o4, o5 );
DEMUX_6: demux_1_to_2 Port Map ( dm2_o1, control(0), o6, o7 );

end Behavioral;
