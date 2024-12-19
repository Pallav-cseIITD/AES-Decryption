library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_bram_access is
end tb_bram_access;

architecture Behavioral of tb_bram_access is
    signal clk     : std_logic := '0';
    signal rst     : std_logic := '1';
    signal ena     : std_logic := '0'; 
    signal we      : std_logic_vector(0 downto 0) := (others => '0'); 
    signal addr    : std_logic_vector(3 downto 0) := (others => '0');
    signal din     : std_logic_vector(15 downto 0) := (others => '0');
    signal dout    : std_logic_vector(15 downto 0);
    
   
    component bram_access
        Port ( clk      : in  std_logic;
               rst      : in  std_logic;
               ena      : in  std_logic;
               we       : in  std_logic_vector(0 downto 0);
               addr     : in  std_logic_vector(3 downto 0);
               din      : in  std_logic_vector(15 downto 0);
               dout     : out std_logic_vector(15 downto 0)
             );
    end component;
    
begin
    uut: bram_access
        port map (
            clk  => clk,
            rst  => rst,
            ena  => ena,  
            we   => we,
            addr => addr,
            din  => din,
            dout => dout
        );
    
    clk_process : process
    begin
        clk <= not clk after 10 ns;
        wait for 10 ns;
    end process;

    stimulus : process
    begin
        rst <= '1';
        ena <= '0'; 
        wait for 50 ns;
        rst <= '0';
        
        ena <= '1'; 
        we <= "0";  
        
        addr <= "0000"; 
        wait for 20 ns;
        
        addr <= "0001";
        wait for 20 ns;
        
        addr <= "0010"; 
        wait for 20 ns;
        
        addr <= "0011"; 
        wait for 20 ns;
        
        addr <= "0100"; 
        wait for 20 ns;
        
        addr <= "0101"; 
        wait for 20 ns;
        
        addr <= "0110"; 
        wait for 20 ns;
        
        addr <= "0111"; 
        wait for 20 ns;
        
        addr <= "1000"; 
        wait for 20 ns;
        
        addr <= "1000"; 
        wait for 20 ns;
        
        addr <= "1001"; 
        wait for 20 ns;
        
        addr <= "1010"; 
        wait for 20 ns;
        
        addr <= "1011"; 
        wait for 20 ns;
        
        addr <= "1101"; 
        wait for 20 ns;
        
        addr <= "1110"; 
        wait for 20 ns;
        
        addr <= "1111"; 
        wait for 20 ns;

        
        wait; 
    end process;

end Behavioral;
