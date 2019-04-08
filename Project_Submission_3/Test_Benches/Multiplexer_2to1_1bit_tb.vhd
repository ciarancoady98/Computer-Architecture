---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_2to1_1bit_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Multiplexer_2to1_1bit_tb IS
END Multiplexer_2to1_1bit_tb;
 
ARCHITECTURE behavior OF Multiplexer_2to1_1bit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component Multiplexer_2to1_1bit
    Port ( In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Z : out STD_LOGIC);
    end component;
    

   --Inputs
   signal S_signal : STD_LOGIC;
   signal In0_signal : STD_LOGIC;
   signal In1_signal : STD_LOGIC;

 	--Outputs
   signal Z_signal : STD_LOGIC;
 
   --Clock
   constant Clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_2to1_1bit PORT MAP (
          S => S_signal,
          In0 => In0_signal,
          In1 => In1_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin	
        
      wait for Clk_period;
      S_signal <= '0';
      In0_signal <= '0';
      In1_signal <= '1';
      
      wait for Clk_period;	
      S_signal <= '1';
      
      wait for Clk_period;
      S_signal <= '0';
      
      wait for Clk_period;	
     
   end process;

END;