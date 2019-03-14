-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Multiplexer_2to1_tb IS
END Multiplexer_2to1_tb;
 
ARCHITECTURE behavior OF Multiplexer_2to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    COMPONENT Multiplexer_2to1
    Port ( S : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;

   --Inputs
   signal S_signal : std_logic;
   signal In0_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In1_signal : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z_signal : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_2to1 PORT MAP (
          S => S_signal,
          In0 => In0_signal,
          In1 => In1_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin		
      In0_signal <= "0000000000000000";
		In1_signal <= "1111111111111111";
		
      wait for 10 ns;	
      S_signal <= '0';

      wait for 10 ns;	
	  S_signal <= '1';
     
 --     wait;
   end process;

END;
