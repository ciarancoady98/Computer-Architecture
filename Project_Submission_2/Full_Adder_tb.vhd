-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Full_Adder_tb IS
END Full_Adder_tb;
 
ARCHITECTURE behavior OF Full_Adder_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component Full_Adder
    Port ( In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           Sum : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;
    

   --Inputs
   signal In1_signal : STD_LOGIC;
   signal In2_signal : STD_LOGIC;
   signal C_in_signal : STD_LOGIC;

 	--Outpzuts
   signal Sum_signal : STD_LOGIC;
   signal C_out_signal : STD_LOGIC;
   
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          In1 => In1_signal,
          In2 => In2_signal,
          C_in => C_in_signal,
          Sum => Sum_signal,
          C_out => C_out_signal
        );

   stim_proc: process
   begin	
        
      wait for 10 ns;
      In1_signal <= '0';
      In2_signal <= '0';
      C_in_signal <= '0';
      
      wait for 20 ns;
      
      In1_signal <= '1';
      In2_signal <= '0';
      C_in_signal <= '0';
      
      wait for 20 ns;	
      
      In1_signal <= '1';
      In2_signal <= '1';
      C_in_signal <= '0';
      
      wait for 20 ns;
      	
      In1_signal <= '0';
      In2_signal <= '0';
      C_in_signal <= '1';
      
      wait for 20 ns;	
      
      In1_signal <= '0';
      In2_signal <= '1';
      C_in_signal <= '1';
      
      wait for 20 ns;
      
      In1_signal <= '1';
      In2_signal <= '1';
      C_in_signal <= '1';
     
      wait for 10 ns;
     
 --     wait;
   end process;

END;