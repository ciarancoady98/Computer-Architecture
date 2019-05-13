-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Shifter_16bit_tb IS
END Shifter_16bit_tb;
 
ARCHITECTURE behavior OF Shifter_16bit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component Shifter_16bit
    Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           Ir : in STD_LOGIC;
           Il : in STD_LOGIC;
           H : out STD_LOGIC_VECTOR (15 downto 0));
end component;
    

   --Inputs
   signal B_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal S_signal : STD_LOGIC_VECTOR (1 downto 0);
   signal Ir_signal : STD_LOGIC;
   signal Il_signal : STD_LOGIC;

 	--Outpzuts
   signal H_signal : STD_LOGIC_VECTOR (15 downto 0);
   
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Shifter_16bit PORT MAP (
          B => B_signal,
          S => S_signal,
          Ir => Ir_signal,
          Il => Il_signal,
          H => H_signal
        );

   stim_proc: process
   begin	
        
      wait for Clk_period;
      
      --Initialise B signal and what gets shifted in
      B_signal <= "0000000000000001";
      Ir_signal <= '0';
      Il_signal <= '0';
      
      wait for Clk_period;
      
      S_signal <= "00";
      
      wait for Clk_period;	
      
      S_signal <= "01";
      
      wait for Clk_period;
      	
      S_signal <= "10";
      
      wait for Clk_period;	
      
      S_signal <= "11";
      
      wait for Clk_period;
     
   end process;

END;