---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Zero_Detect_16bit_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Zero_Detect_16bit_tb IS
END Zero_Detect_16bit_tb;
 
ARCHITECTURE behavior OF Zero_Detect_16bit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Zero_Detect_16bit
    PORT ( A : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal A_signal : STD_LOGIC_VECTOR (15 downto 0);

 	--Outputs
   signal Z_signal : STD_LOGIC;
   
  --Clock
  constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Zero_Detect_16bit PORT MAP (
          A => A_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin	
        
        wait for Clk_period;
        
        --test ffff	
      A_signal <= "1111111111111111";

      wait for Clk_period;	
      
      --test fffe
      A_signal <= "1111111111111110";
      
      wait for Clk_period;	
      
      --test 0
      A_signal <= "0000000000000000";
 
   end process;

END;