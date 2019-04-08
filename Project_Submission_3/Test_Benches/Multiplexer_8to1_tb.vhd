---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_8to1_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Multiplexer_8to1_tb IS
END Multiplexer_8to1_tb;
 
ARCHITECTURE behavior OF Multiplexer_8to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Multiplexer_8to1
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           In2 : in STD_LOGIC_VECTOR (15 downto 0);
           In3 : in STD_LOGIC_VECTOR (15 downto 0);
           In4 : in STD_LOGIC_VECTOR (15 downto 0);
           In5 : in STD_LOGIC_VECTOR (15 downto 0);
           In6 : in STD_LOGIC_VECTOR (15 downto 0);
           In7 : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;

   --Inputs
   signal S0_signal : std_logic;
   signal S1_signal : std_logic;
   signal S2_signal : std_logic;
   signal In0_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In1_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In2_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In3_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In4_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In5_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In6_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In7_signal : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z_signal : std_logic_vector(15 downto 0);

   --Clock
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_8to1 PORT MAP (
          S0 => S0_signal,
          S1 => S1_signal,
          S2 => S2_signal,
          In0 => In0_signal,
          In1 => In1_signal,
          In2 => In2_signal,
          In3 => In3_signal,
          In4 => In4_signal,
          In5 => In5_signal,
          In6 => In6_signal,
          In7 => In7_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin		
      In0_signal <= "0000000000000000";
	   In1_signal <= "0000000000000001";
		In2_signal <= "0000000000000010";
		In3_signal <= "0000000000000011";
		In4_signal <= "0000000000000100";
		In5_signal <= "0000000000000101";
		In6_signal <= "0000000000000110";
		In7_signal <= "0000000000000111";
		
      wait for Clk_period;
      S0_signal <= '0';
      S1_signal <= '0';
      S2_signal <= '0';

      wait for Clk_period;
      S0_signal <= '1';
      S1_signal <= '0';
      S2_signal <= '0';
      
      wait for Clk_period;
      S0_signal <= '0';
      S1_signal <= '1';
      S2_signal <= '0';
      
      wait for Clk_period;
      S0_signal <= '1';
      S1_signal <= '1';
      S2_signal <= '0';
      
      wait for Clk_period;
      S0_signal <= '0';
      S1_signal <= '0';
      S2_signal <= '1';
      
      wait for Clk_period;
      S0_signal <= '1';
      S1_signal <= '0';
      S2_signal <= '1';
      
      wait for Clk_period;
      S0_signal <= '0';
      S1_signal <= '1';
      S2_signal <= '1';
      
      wait for Clk_period;
      S0_signal <= '1';
      S1_signal <= '1';
      S2_signal <= '1';
     
 --     wait;
   end process;

END;
