library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_display is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
            CLK100MHZ : in STD_LOGIC;
            digit : out STD_LOGIC_VECTOR (6 downto 0);
            digit_select : out STD_LOGIC_VECTOR (7 downto 0);
            overflow : out STD_LOGIC);
end alu_display;

architecture Behavioral of alu_display is

signal f : STD_LOGIC_VECTOR (7 downto 0);

-- All eight digits that may be driven to the display.
signal da0, da1, db0, db1, ds0, ds1, ds2, ds3 : STD_LOGIC_VECTOR (6 downto 0);

component operation_selector is
    Port ( a, b : in STD_LOGIC_VECTOR (7 downto 0);
           control : in STD_LOGIC_VECTOR (2 downto 0);
           f : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component display_hex is
    Port (a, b, c, d : in STD_LOGIC;
             display : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal control_dummy : STD_LOGIC_VECTOR (2 downto 0);

begin

    control_dummy <= "001";
    
    OP_SEL: operation_selector Port Map ( a, b, control_dummy, f );
    
    DIGIT_A_1: display_hex Port Map ( a(7), a(6), a(5), a(4), da1 );
    DIGIT_A_0: display_hex Port Map ( a(3), a(2), a(1), a(0), da0 );
    
    DIGIT_B_1: display_hex Port Map ( b(7), b(6), b(5), b(4), db1 );
    DIGIT_B_0: display_hex Port Map ( b(3), b(2), b(1), b(0), db0 );
    
    DIGIT_S_3: display_hex Port Map ( '0', '0', '0', '0', ds3 );
    DIGIT_S_2: display_hex Port Map ( '0', '0', '0', '0', ds2 );
    DIGIT_S_1: display_hex Port Map ( f(7), f(6), f(5), f(4), ds1 );
    DIGIT_S_0: display_hex Port Map ( f(3), f(2), f(1), f(0), ds0 );
    
DISPLAY: Process ( CLK100MHZ )
    variable countdown : integer := 250000;
    variable prev_digit_select : STD_LOGIC_VECTOR (7 downto 0) := "01111111";
begin
    if rising_edge ( CLK100MHZ ) then
        countdown := countdown - 1;
        if countdown = 0 then
            case prev_digit_select is
                when "11111110" => 
                    prev_digit_select := "01111111";
                    digit_select <= prev_digit_select;
                    digit <= da1;
                when "01111111" => 
                    prev_digit_select := "10111111";
                    digit_select <= prev_digit_select;
                    digit <= da0;
                when "10111111" => 
                    prev_digit_select := "11011111";
                    digit_select <= prev_digit_select;
                    digit <= db1;
                when "11011111" => 
                    prev_digit_select := "11101111";
                    digit_select <= prev_digit_select;
                    digit <= db0;
                when "11101111" => 
                    prev_digit_select := "11110111";
                    digit_select <= prev_digit_select;
                    digit <= ds3;
                when "11110111" => 
                    prev_digit_select := "11111011";
                    digit_select <= prev_digit_select;
                    digit <= ds2;
                when "11111011" => 
                    prev_digit_select := "11111101";
                    digit_select <= prev_digit_select;
                    digit <= ds1;
                when "11111101" => 
                    prev_digit_select := "11111110";
                    digit_select <= prev_digit_select;
                    digit <= ds0;
                when others =>
                    prev_digit_select := "11111110";
                    digit_select <= prev_digit_select;
                    digit <= ds0;
            end case;
            countdown := 250000;
        end if;
    end if;
end Process;
    
end Behavioral;
