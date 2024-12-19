library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity tb_roundKey is
end tb_roundKey;

architecture Behavioral of tb_roundKey is
    signal cipher    : std_logic_vector(7 downto 0) := (others => '0');
    signal roundkey  : std_logic_vector(7 downto 0) := (others => '0');
    signal plain     : std_logic_vector(7 downto 0);
    constant TEST_CASES : integer := 16;

begin
    uut: entity work.roundKey
        port map (
            cipher => cipher,
            roundkey => roundkey,
            plain => plain
        );

    process
        variable i, j : integer := 0;
    begin
        for i in 0 to TEST_CASES - 1 loop
            for j in 0 to TEST_CASES - 1 loop
                cipher <= std_logic_vector(to_unsigned(i, 8)); 
                roundkey <= std_logic_vector(to_unsigned(j, 8)); 
                wait for 10 ns;
            end loop;
        end loop;
        wait;
    end process;

end Behavioral;
