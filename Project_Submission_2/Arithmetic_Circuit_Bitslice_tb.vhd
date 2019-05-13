-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Arithmetic_Circuit_Bitslice_tb IS
END Arithmetic_Circuit_Bitslice_tb;
 
ARCHITECTURE behavior OF Arithmetic_Circuit_Bitslice_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component Arithmetic_Circuit_Bitslice
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           G : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;
    

   --Inputs
   signal A_signal : STD_LOGIC;
   signal B_signal : STD_LOGIC;
   signal C_in_signal : STD_LOGIC;
   signal S0_signal : STD_LOGIC;
   signal S1_signal : STD_LOGIC;

 	--Outpzuts
   signal G_signal : STD_LOGIC;
   signal C_out_signal : STD_LOGIC;
   
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Arithmetic_Circuit_Bitslice PORT MAP (
          A => A_signal,
          B => B_signal,
          S0 => S0_signal,
          S1 => S1_signal,
          C_in => C_in_signal,
          G => G_signal,
          C_out => C_out_signal
        );

   stim_proc: process
   begin	
        
      wait for Clk_period;
      A_signal <= '0';
      B_signal <= '1';
      
      C_in_signal <= '0';
      
      wait for Clk_period;
      
      -- B is all 0's
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      --B
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      -- not B
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period;
      
      -- B is all 1's
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for Clk_period;
      
      
      --Change carry
      C_in_signal <= '1';
      
      wait for Clk_period;
      
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period;
      
      S0_signal <= '1';
      S1_signal <= '1';

   end process;

END;