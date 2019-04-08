---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Zero_Fill_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Zero_Fill_tb IS
END Zero_Fill_tb;

ARCHITECTURE behavior OF Zero_Fill_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Zero_Fill is
        Port (
            SB : in  STD_LOGIC_VECTOR (2 downto 0);
            Z : out STD_LOGIC_VECTOR (15 downto 0));
    end COMPONENT;


   --Inputs
   signal SB_signal : STD_LOGIC_VECTOR (2 downto 0);

 	--Outputs
   signal Z_signal : STD_LOGIC_VECTOR (15 downto 0);

  --Clock
  constant Clk_period : time := 20 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Zero_Fill PORT MAP (
          SB => SB_signal,
          Z => Z_signal
        );

   stim_proc: process
   begin

        wait for Clk_period;

      --test 111
      SB_signal <= "111";

      wait for Clk_period;

      --test 000
      SB_signal <= "000";

      wait for Clk_period;

      --test 010
      SB_signal <= "010";

   end process;

END;
