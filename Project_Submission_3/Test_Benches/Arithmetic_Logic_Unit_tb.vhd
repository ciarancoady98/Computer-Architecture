---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Arithmetic_Logic_Unit_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Arithmetic_Logic_Unit_tb IS
END Arithmetic_Logic_Unit_tb;
 
ARCHITECTURE behavior OF Arithmetic_Logic_Unit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    component Arithmetic_Logic_Unit
    Port ( C_in : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0);
           C_out : out STD_LOGIC;
           V_out : out STD_LOGIC);
    end component;
    

   --Inputs
   signal A_signal : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
   signal B_signal : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
   signal C_in_signal : STD_LOGIC := '0';
   signal S0_signal : STD_LOGIC := '0';
   signal S1_signal : STD_LOGIC := '0';
   signal S2_signal : STD_LOGIC := '0';

 	--Outputs
   signal G_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal C_out_signal : STD_LOGIC;
   signal V_out_signal : STD_LOGIC;
   
    --Clock
    constant Clk_period : time := 80 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Arithmetic_Logic_Unit PORT MAP (
          A => A_signal,
          B => B_signal,
          S0 => S0_signal,
          S1 => S1_signal,
          S2 => S2_signal,
          C_in => C_in_signal,
          G => G_signal,
          C_out => C_out_signal,
          V_out => V_out_signal
        );

   stim_proc: process
   begin	
      
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
      
      wait for Clk_period;
      
      
      --Change carry
      C_in_signal <= not C_in_signal;
      S2_signal <= not S2_signal;
      
      wait for Clk_period;
     
 --     wait;
   end process;

END;