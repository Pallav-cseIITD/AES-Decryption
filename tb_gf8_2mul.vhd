library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_gf8_2mul is
end tb_gf8_2mul;

architecture Behavioral of tb_gf8_2mul is
    component gf8_2mul
        Port (
            input_byte  : in  STD_LOGIC_VECTOR(7 downto 0);
            select_mult : in  STD_LOGIC_VECTOR(7 downto 0);
            result_byte : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Test signals
    signal input_byte  : STD_LOGIC_VECTOR(7 downto 0);
    signal select_mult : STD_LOGIC_VECTOR(7 downto 0);
    signal result_byte : STD_LOGIC_VECTOR(7 downto 0);

begin
    uut: gf8_2mul
        Port map (
            input_byte => input_byte,
            select_mult => select_mult,
            result_byte => result_byte
        );

    process
    begin
        input_byte <= "11111111";
        select_mult <= "00001011";
        wait;
    end process;
end Behavioral;