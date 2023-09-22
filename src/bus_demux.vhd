library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 1-to-8 demultiplexor on 8-bit buses.

entity bus_demux is
    Port ( input : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           o0, o1, o2, o3, o4, o5, o6, o7 : out STD_LOGIC_VECTOR (7 downto 0));
end bus_demux;

architecture Behavioral of bus_demux is

component demux_1_to_8 is
    Port ( input : in STD_LOGIC;
           control : in STD_LOGIC_VECTOR (2 downto 0);
           o0, o1, o2, o3, o4, o5, o6, o7 : out STD_LOGIC);
end component;

begin
    gen: for i in 0 to 7 generate
        DEMUX: demux_1_to_8 Port Map ( input(i), control, o0(i), o1(i), o2(i), o3(i), o4(i), o5(i), o6(i), o7(i) );
    end generate;
end Behavioral;
