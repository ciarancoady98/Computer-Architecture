-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY Multiplexer_8to1_1bit_tb IS
END Multiplexer_8to1_1bit_tb;

ARCHITECTURE behavior OF Multiplexer_8to1_1bit_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Multiplexer_8to1_1bit is
        Port ( S0 : in STD_LOGIC;
               S1 : in STD_LOGIC;
               S2 : in STD_LOGIC;
               In0 : in STD_LOGIC;
               In1 : in STD_LOGIC;
               In2 : in STD_LOGIC;
               In3 : in STD_LOGIC;
               In4 : in STD_LOGIC;
               In5 : in STD_LOGIC;
               In6 : in STD_LOGIC;
               In7 : in STD_LOGIC;
               Z : out STD_LOGIC);
    END COMPONENT;

   --Inputs
   signal S0_signal : std_logic;
   signal S1_signal : std_logic;
   signal S2_signal : std_logic;
   signal In0_signal : std_logic;
   signal In1_signal : std_logic;
   signal In2_signal : std_logic;
   signal In3_signal : std_logic;
   signal In4_signal : std_logic;
   signal In5_signal : std_logic;
   signal In6_signal : std_logic;
   signal In7_signal : std_logic;

 	--Outputs
   signal Z_signal : std_logic;
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name

--   constant Clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_8to1_1bit PORT MAP (
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
      In0_signal <= '1';
  		In1_signal <= '1';
  		In2_signal <= '1';
  		In3_signal <= '1';
  		In4_signal <= '0';
  		In5_signal <= '0';
  		In6_signal <= '0';
  		In7_signal <= '0';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '0';
      S2_signal <= '0';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '0';
      S2_signal <= '0';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '1';
      S2_signal <= '0';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '1';
      S2_signal <= '0';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '0';
      S2_signal <= '1';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '0';
      S2_signal <= '1';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '1';
      S2_signal <= '1';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '1';
      S2_signal <= '1';

 --     wait;
   end process;

END;
