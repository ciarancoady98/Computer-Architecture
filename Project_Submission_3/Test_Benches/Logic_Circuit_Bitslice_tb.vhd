-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Logic_Circuit_Bitslice_tb IS
END Logic_Circuit_Bitslice_tb;
 
ARCHITECTURE behavior OF Logic_Circuit_Bitslice_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component Logic_Circuit_Bitslice
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Z : out STD_LOGIC);
end component;
    

   --Inputs
   signal S0_signal : STD_LOGIC;
   signal S1_signal : STD_LOGIC;
   signal A_signal : STD_LOGIC;
   signal B_signal : STD_LOGIC;

 	--Outpzuts
   signal Z_signal : STD_LOGIC;
   
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Logic_Circuit_Bitslice PORT MAP (
          S0 => S0_signal,
          S1 => S1_signal,
          A => A_signal,
          B => B_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin	
        
      wait for Clk_period;
      
      --intialise signals
      A_signal <= '0';
      B_signal <= '1';
      
      --A and B
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      --A or B
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      --A XOR B
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period;
      
      --not A
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for Clk_period;

   end process;

END;