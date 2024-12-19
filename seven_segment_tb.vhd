library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

entity seven_segment_tb is
end seven_segment_tb;

architecture Behavioral of seven_segment_tb is
    component seven_segment
        Port (
            ascii_input : in  STD_LOGIC_VECTOR(7 downto 0);
            A : out STD_LOGIC;
            B : out STD_LOGIC;
            C : out STD_LOGIC;
            D : out STD_LOGIC;
            E : out STD_LOGIC;
            F : out STD_LOGIC;
            G : out STD_LOGIC
        );
    end component;
    
    signal ascii_input : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
    signal A, B, C, D, E, F, G : STD_LOGIC;
    
begin
    uut: seven_segment
        Port map (
            ascii_input => ascii_input,
            A => A,
            B => B,
            C => C,
            D => D,
            E => E,
            F => F,
            G => G
        );

    stim_proc: process
    begin
        for i in 48 to 57 loop
            ascii_input <= std_logic_vector(to_unsigned(i, 8));
            wait for 100 ns;
        end loop;
        
        for i in 65 to 70 loop
            ascii_input <= std_logic_vector(to_unsigned(i, 8));
            wait for 100 ns;
        end loop;
        
        for i in 97 to 102 loop
            ascii_input <= std_logic_vector(to_unsigned(i, 8));
            wait for 100 ns;
        end loop;

        ascii_input <= std_logic_vector(to_unsigned(35, 8));
        wait for 100 ns;
        
        ascii_input <= std_logic_vector(to_unsigned(126, 8));
        wait for 100 ns;

        wait;

    end process;
end Behavioral;