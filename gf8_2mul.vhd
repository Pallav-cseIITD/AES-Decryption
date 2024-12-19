library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity gf8_2mul is
    Port (
        input_byte  : in  STD_LOGIC_VECTOR(7 downto 0); 
        select_mult : in  STD_LOGIC_VECTOR(7 downto 0); 
        result_byte : out STD_LOGIC_VECTOR(7 downto 0)  
    );
end gf8_2mul;

architecture Behavioral of gf8_2mul is
    signal temp1, temp2, temp3 : STD_LOGIC_VECTOR(7 downto 0); 
    constant poly_reduction : STD_LOGIC_VECTOR(7 downto 0) := "00011011"; 
begin

    temp1 <= input_byte(6 downto 0) & '0' when input_byte(7) = '0' else 
             (input_byte(6 downto 0) & '0') xor poly_reduction;
    
    temp2 <= temp1(6 downto 0) & '0' when temp1(7) = '0' else 
             (temp1(6 downto 0) & '0') xor poly_reduction;
    
    temp3 <= temp2(6 downto 0) & '0' when temp2(7) = '0' else 
             (temp2(6 downto 0) & '0') xor poly_reduction;

    result_byte <= 
        (temp3 xor temp2 xor temp1) when select_mult = x"0E" else
        (temp3 xor temp1 xor input_byte) when select_mult = x"0B" else
        (temp3 xor temp2 xor input_byte) when select_mult = x"0D" else
        (temp3 xor input_byte);
end Behavioral;
