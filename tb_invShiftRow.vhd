library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_invShiftRow is
end tb_invShiftRow;

architecture Behavioral of tb_invShiftRow is
    component invShiftRow
        port(
            inputRow : in std_logic_vector(31 downto 0);
            shiftBy : in std_logic_vector(1 downto 0);
            outputRow : out std_logic_vector(31 downto 0)
        );
    end component;

    signal inputRow_tb : std_logic_vector(31 downto 0) := (others => '0');
    signal shiftBy_tb : std_logic_vector(1 downto 0) := (others => '0');
    signal outputRow_tb : std_logic_vector(31 downto 0);

    constant NUM_TEST_CASES : integer := 10;

    type test_array is array (0 to NUM_TEST_CASES - 1) of std_logic_vector(31 downto 0);
    constant input_vectors : test_array := (
        x"00000000",  
        x"FFFFFFFF",
        x"0F0F0F0F",
        x"4C94A52A",
        x"55555555",
        x"71C71C71",
        x"01C71C71",
        x"F01C71FF",
        x"CCCCCCCC",
        x"AAAAAAAA"
    );

   type shift_array is array (0 to 3) of std_logic_vector(1 downto 0);
    constant shift_values : shift_array := (
        "00", "01", "10", "11"
    );
begin
    uut: invShiftRow
        port map(
            inputRow => inputRow_tb,
            shiftBy => shiftBy_tb,
            outputRow => outputRow_tb
        );

    process
    begin
        for i in 0 to NUM_TEST_CASES - 1 loop
            for j in 0 to 3 loop 
                inputRow_tb <= input_vectors(i);
                shiftBy_tb <= shift_values(j);
                wait for 20 ns;  
            end loop;
        end loop;
        wait;
    end process;
end Behavioral;