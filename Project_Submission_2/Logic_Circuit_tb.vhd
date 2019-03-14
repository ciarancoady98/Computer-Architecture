-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Logic_Circuit_tb IS
END Logic_Circuit_tb;
 
ARCHITECTURE behavior OF Logic_Circuit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component Logic_Circuit
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           G : out STD_LOGIC_VECTOR (15 downto 0));
end component;
    

   --Inputs
   signal A_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal B_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal S0_signal : STD_LOGIC;
   signal S1_signal : STD_LOGIC;

 	--Outpzuts
   signal G_signal : STD_LOGIC_VECTOR (15 downto 0);
   
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Logic_Circuit PORT MAP (
          A => A_signal,
          B => B_signal,
          S0 => S0_signal,
          S1 => S1_signal,
          G => G_signal
        );

   stim_proc: process
   begin	
        
      wait for 20 ns;
   
      A_signal <= "0000000000000000";
      B_signal <= "1111111111111111";
      
      S0_signal <= '0';
      S1_signal <= '0';
      
      wait for 30 ns;
      
      S0_signal <= '1';
      S1_signal <= '0';
      
      wait for 30 ns;
      
      S0_signal <= '0';
      S1_signal <= '1';
      
      wait for 30 ns;
      
      S0_signal <= '1';
      S1_signal <= '1';
      
      wait for 20 ns;

      
     
 --     wait;
   end process;

END;