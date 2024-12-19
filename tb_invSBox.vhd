library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_invSBox is
end tb_invSBox;

architecture Behavioral of tb_invSBox is
    signal clka     : std_logic := '0';
    signal ena      : std_logic := '1'; 
    signal input    : std_logic_vector(7 downto 0) := (others => '0');
    signal douta    : std_logic_vector(7 downto 0);

    component invSBox
        Port (
            clka   : in  std_logic;
            ena    : in  std_logic;
            input  : in  std_logic_vector(7 downto 0);
            douta  : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    uut: invSBox
        port map (
            clka  => clka,
            ena   => ena,
            input => input,
            douta => douta
        );

    -- Clock generation
    clk_process : process
    begin
        clka <= not clka after 10 ns; 
        wait for 10 ns;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        for i in 1 to 256 loop
            input <= std_logic_vector(to_unsigned(i, 8)); 
            wait for 20 ns;
        end loop;
        wait;
    end process;

end Behavioral;
