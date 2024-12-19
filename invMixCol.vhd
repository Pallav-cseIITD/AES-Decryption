library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity invMixCol is
    Port (
        input_byte1   : in  STD_LOGIC_VECTOR(7 downto 0); 
        input_byte2   : in  STD_LOGIC_VECTOR(7 downto 0);  
        input_byte3   : in  STD_LOGIC_VECTOR(7 downto 0); 
        input_byte4   : in  STD_LOGIC_VECTOR(7 downto 0); 
        select_mult   : in  STD_LOGIC_VECTOR(31 downto 0);  
        result_output : out STD_LOGIC_VECTOR(7 downto 0)    
    );
end invMixCol;

architecture Behavioral of invMixCol is

    component gf8_2mul is
        Port (
            input_byte  : in  STD_LOGIC_VECTOR(7 downto 0);
            select_mult : in  STD_LOGIC_VECTOR(7 downto 0);
            result_byte : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal result1, result2, result3, result4 : STD_LOGIC_VECTOR(7 downto 0);
    signal select_mult1, select_mult2, select_mult3, select_mult4 : STD_LOGIC_VECTOR(7 downto 0);

begin

    select_mult1 <= select_mult(31 downto 24);
    select_mult2 <= select_mult(23 downto 16);
    select_mult3 <= select_mult(15 downto 8);
    select_mult4 <= select_mult(7 downto 0);

    U1: gf8_2mul Port map (
        input_byte  => input_byte1,
        select_mult => select_mult1,
        result_byte => result1
    );

    U2: gf8_2mul Port map (
        input_byte  => input_byte2,
        select_mult => select_mult2,
        result_byte => result2
    );

    U3: gf8_2mul Port map (
        input_byte  => input_byte3,
        select_mult => select_mult3,
        result_byte => result3
    );

    U4: gf8_2mul Port map (
        input_byte  => input_byte4,
        select_mult => select_mult4,
        result_byte => result4
    );

    result_output <= result1 xor result2 xor result3 xor result4;

end Behavioral;
