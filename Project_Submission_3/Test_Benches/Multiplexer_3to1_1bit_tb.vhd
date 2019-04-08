---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_3to1_1bit_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Multiplexer_3to1_1bit_tb IS
END Multiplexer_3to1_1bit_tb;
 
ARCHITECTURE behavior OF Multiplexer_3to1_1bit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    component Multiplexer_3to1_1bit
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           Z : out STD_LOGIC);
    end component;
    

   --Inputs
   signal S0_signal : STD_LOGIC;
   signal S1_signal : STD_LOGIC;
   signal In0_signal : STD_LOGIC;
   signal In1_signal : STD_LOGIC;
   signal In2_signal : STD_LOGIC;

 	--Outputs
   signal Z_signal : STD_LOGIC;
   
   --Clock
   constant Clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_3to1_1bit PORT MAP (
          S0 => S0_signal,
          S1 => S1_signal,
          In0 => In0_signal,
          In1 => In1_signal,
          In2 => In2_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin	
        
      wait for Clk_period;
      S0_signal <= '0';
      S1_signal <= '0';
      In0_signal <= '0';
      In1_signal <= '1';
      In2_signal <= '0';
      
      wait for Clk_period;
      
      --set output to line 0
      
      wait for Clk_period;
      
      --set output to line 1	
      S0_signal <= '1';
      
      wait for Clk_period;	
      
      --set output to line 2
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period;	
      
      --set output to line 3
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for Clk_period;	
     
   end process;

END;