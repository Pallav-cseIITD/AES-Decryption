library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_invMixCol is
end tb_invMixCol;

architecture Behavioral of tb_invMixCol is

    signal input_byte1   : STD_LOGIC_VECTOR(7 downto 0);
    signal input_byte2   : STD_LOGIC_VECTOR(7 downto 0);
    signal input_byte3   : STD_LOGIC_VECTOR(7 downto 0);
    signal input_byte4   : STD_LOGIC_VECTOR(7 downto 0);
    signal select_mult   : STD_LOGIC_VECTOR(31 downto 0);
    signal result_output : STD_LOGIC_VECTOR(7 downto 0);

    component invMixCol is
        Port (
            input_byte1   : in  STD_LOGIC_VECTOR(7 downto 0);
            input_byte2   : in  STD_LOGIC_VECTOR(7 downto 0);
            input_byte3   : in  STD_LOGIC_VECTOR(7 downto 0);
            input_byte4   : in  STD_LOGIC_VECTOR(7 downto 0);
            select_mult   : in  STD_LOGIC_VECTOR(31 downto 0);
            result_output : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin

    uut: invMixCol Port map (
        input_byte1   => input_byte1,
        input_byte2   => input_byte2,
        input_byte3   => input_byte3,
        input_byte4   => input_byte4,
        select_mult   => select_mult,
        result_output => result_output
    );

    stimulus: process
    begin
        input_byte1 <= x"8b";  
        input_byte2 <= x"42";  
        input_byte3 <= x"6d";  
        input_byte4 <= x"d5";  
        select_mult <= x"0e" & x"0b" & x"0d" & x"09";
        
        wait for 20 ns;
        input_byte1 <= x"0c";
        input_byte2 <= x"70";
        input_byte3 <= x"30";
        input_byte4 <= x"1f";
        
        wait for 20 ns;
        input_byte1 <= x"68";
        input_byte2 <= x"43";
        input_byte3 <= x"00";
        input_byte4 <= x"8a";
        
        wait for 20 ns;
        input_byte1 <= x"da";
        input_byte2 <= x"4e";
        input_byte3 <= x"d7";
        input_byte4 <= x"ee";

        wait for 20 ns;
       input_byte1 <= x"8b";
        input_byte2 <= x"42";
        input_byte3 <= x"6d";
        input_byte4 <= x"d5";
        select_mult <= x"09" & x"0e" & x"0b" & x"0d";
        
        wait for 20 ns;
        input_byte1 <= x"0c";
        input_byte2 <= x"70";
        input_byte3 <= x"30";
        input_byte4 <= x"1f";
        
        wait for 20 ns;
        input_byte1 <= x"68";
        input_byte2 <= x"43";
        input_byte3 <= x"00";
        input_byte4 <= x"8a";
        
        wait for 20 ns;
        input_byte1 <= x"da";
        input_byte2 <= x"4e";
        input_byte3 <= x"d7";
        input_byte4 <= x"ee";

        wait for 20 ns;
        input_byte1 <= x"8b";
        input_byte2 <= x"42";
        input_byte3 <= x"6d";
        input_byte4 <= x"d5";
        select_mult <= x"0d" & x"09" & x"0e" & x"0b";
        
        wait for 20 ns;
        input_byte1 <= x"0c";
        input_byte2 <= x"70";
        input_byte3 <= x"30";
        input_byte4 <= x"1f";
        
        wait for 20 ns;
        input_byte1 <= x"68";
        input_byte2 <= x"43";
        input_byte3 <= x"00";
        input_byte4 <= x"8a";
        
        wait for 20 ns;
        input_byte1 <= x"da";
        input_byte2 <= x"4e";
        input_byte3 <= x"d7";
        input_byte4 <= x"ee";

        wait for 20 ns;
       input_byte1 <= x"8b";
        input_byte2 <= x"42";
        input_byte3 <= x"6d";
        input_byte4 <= x"d5";
        select_mult <= x"0b" & x"0d" & x"09" & x"0e";
        
        wait for 20 ns;
        input_byte1 <= x"0c";
        input_byte2 <= x"70";
        input_byte3 <= x"30";
        input_byte4 <= x"1f";
        select_mult <= x"0b" & x"0d" & x"09" & x"0e";
        
        wait for 20 ns;
        input_byte1 <= x"68";
        input_byte2 <= x"43";
        input_byte3 <= x"00";
        input_byte4 <= x"8a";
        select_mult <= x"0b" & x"0d" & x"09" & x"0e";
        
        wait for 20 ns;
        input_byte1 <= x"da";
        input_byte2 <= x"4e";
        input_byte3 <= x"d7";
        input_byte4 <= x"ee";
        select_mult <= x"0b" & x"0d" & x"09" & x"0e";
        wait;
    end process;

end Behavioral;