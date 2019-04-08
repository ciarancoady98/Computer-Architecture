---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_3to1_1bit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Multiplexer_4to1_tb IS
END Multiplexer_4to1_tb;
 
ARCHITECTURE behavior OF Multiplexer_4to1_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    component Multiplexer_4to1
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           In3 : in STD_LOGIC;
           Z : out STD_LOGIC
           );
    end component;
    

   --Inputs
   signal S0_signal : STD_LOGIC;
   signal S1_signal : STD_LOGIC;
   signal In0_signal : STD_LOGIC;
   signal In1_signal : STD_LOGIC;
   signal In2_signal : STD_LOGIC;
   signal In3_signal : STD_LOGIC;
   

 	--Outputs
   signal Z_signal : STD_LOGIC;
  
   --Clock
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_4to1 PORT MAP (
          S0 => S0_signal,
          S1 => S1_signal,
          In0 => In0_signal,
          In1 => In1_signal,
          In2 => In2_signal,
          In3 => In3_signal,
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
      In3_signal <= '1';
      
      wait for Clk_period;
      
      --Select line 0 for output
      
      wait for Clk_period;	
      
      --Select line 1 for output
      S0_signal <= '1';
      
      wait for Clk_period;	
      --Select line 2 for output
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period;	
      --Select line 3 for output
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for Clk_period;	

   end process;

END;