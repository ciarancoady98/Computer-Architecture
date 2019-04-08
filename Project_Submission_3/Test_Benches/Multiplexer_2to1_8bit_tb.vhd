---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_2to1_8bit_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Multiplexer_2to1_8bit_tb IS
END Multiplexer_2to1_8bit_tb;

ARCHITECTURE behavior OF Multiplexer_2to1_8bit_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Multiplexer_2to1_8bit
        Port ( S : in STD_LOGIC;
               In0 : in STD_LOGIC_VECTOR (7 downto 0);
               In1 : in STD_LOGIC_VECTOR (7 downto 0);
               Z : out STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;


   --Inputs
   signal S_signal : STD_LOGIC;
   signal In0_signal : STD_LOGIC_VECTOR (7 downto 0);
   signal In1_signal : STD_LOGIC_VECTOR (7 downto 0);


 	--Outputs
   signal Z_signal : STD_LOGIC_VECTOR (7 downto 0);

   --Clock
   constant Clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_2to1_8bit PORT MAP (
          S => S_signal,
          In0 => In0_signal,
          In1 => In1_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin

      wait for Clk_period;
      S_signal <= '0';
      In0_signal <= "00000000";
      In1_signal <= "11111111";

      wait for Clk_period;

      --select output to line 0

      wait for Clk_period;

      --select output to line 1
      S_signal <= '1';

      wait for Clk_period;

      --select output to line 0
      S_signal <= '0';

      wait for Clk_period;

      --select output to line 1
      S_signal <= '1';

      wait for Clk_period;

   end process;

END;
