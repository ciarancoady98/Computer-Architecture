-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Arithmetic_Circuit_tb IS
END Arithmetic_Circuit_tb;
 
ARCHITECTURE behavior OF Arithmetic_Circuit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component Arithmetic_Circuit
    Port ( C_In : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           G : out STD_LOGIC_VECTOR (15 downto 0);
           C_Out : out STD_LOGIC;
           V_out : out STD_LOGIC);
end component;
    

   --Inputs
   signal A_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal B_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal C_in_signal : STD_LOGIC;
   signal S0_signal : STD_LOGIC;
   signal S1_signal : STD_LOGIC;

 	--Outpzuts
   signal G_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal C_out_signal : STD_LOGIC;
   signal V_out_signal : STD_LOGIC;
   
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clk_period : time := 80 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Arithmetic_Circuit PORT MAP (
          A => A_signal,
          B => B_signal,
          S0 => S0_signal,
          S1 => S1_signal,
          C_in => C_in_signal,
          G => G_signal,
          C_out => C_out_signal,
          V_out => V_out_signal
        );

   stim_proc: process
   begin	
        
      wait for Clk_period;
      A_signal <= "0000000000000000";
      B_signal <= "1111111111111111";
      
      C_in_signal <= '0';
      
      wait for Clk_period;
      
      --set B to all 0's
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      --B
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      --not B
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period;
      
      --set B to all 1's
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for Clk_period;
      
      
      --Change carry
      C_in_signal <= '1';
      
      wait for Clk_period;
      
      --set B to all 0's
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      --B
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for Clk_period;
      
      --Not B
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for Clk_period;
      
      --Set B to all 1's
      S0_signal <= '1';
      S1_signal <= '1';

   end process;

END;