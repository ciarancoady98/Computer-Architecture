-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY Multiplexer_16to1_tb IS
END Multiplexer_16to1_tb;

ARCHITECTURE behavior OF Multiplexer_16to1_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Multiplexer_16to1
        Port ( S0 : in  STD_LOGIC;
               S1 : in  STD_LOGIC;
               S2 : in  STD_LOGIC;
               S3 : in  STD_LOGIC;
               In0 : in  STD_LOGIC_VECTOR (15 downto 0);
               In1 : in  STD_LOGIC_VECTOR (15 downto 0);
               In2 : in  STD_LOGIC_VECTOR (15 downto 0);
               In3 : in  STD_LOGIC_VECTOR (15 downto 0);
               In4 : in  STD_LOGIC_VECTOR (15 downto 0);
               In5 : in  STD_LOGIC_VECTOR (15 downto 0);
               In6 : in  STD_LOGIC_VECTOR (15 downto 0);
               In7 : in  STD_LOGIC_VECTOR (15 downto 0);
               In8 : in  STD_LOGIC_VECTOR (15 downto 0);
               In9 : in  STD_LOGIC_VECTOR (15 downto 0);
               In10 : in  STD_LOGIC_VECTOR (15 downto 0);
               In11 : in  STD_LOGIC_VECTOR (15 downto 0);
               In12 : in  STD_LOGIC_VECTOR (15 downto 0);
               In13 : in  STD_LOGIC_VECTOR (15 downto 0);
               In14 : in  STD_LOGIC_VECTOR (15 downto 0);
               In15 : in  STD_LOGIC_VECTOR (15 downto 0);
               Z : out STD_LOGIC_VECTOR (15 downto 0));
    end COMPONENT;

   --Inputs
   signal S0_signal : std_logic;
   signal S1_signal : std_logic;
   signal S2_signal : std_logic;
   signal S3_signal : std_logic;
   signal In0_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In1_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In2_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In3_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In4_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In5_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In6_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In7_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In8_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In9_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In10_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In11_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In12_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In13_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In14_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal In15_signal : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z_signal : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name

--   constant Clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexer_16to1 PORT MAP (
          S0 => S0_signal,
          S1 => S1_signal,
          S2 => S2_signal,
          S3 => S3_signal,
          In0 => In0_signal,
          In1 => In1_signal,
          In2 => In2_signal,
          In3 => In3_signal,
          In4 => In4_signal,
          In5 => In5_signal,
          In6 => In6_signal,
          In7 => In7_signal,
          In8 => In8_signal,
          In9 => In9_signal,
          In10 => In10_signal,
          In11 => In11_signal,
          In12 => In12_signal,
          In13 => In13_signal,
          In14 => In14_signal,
          In15 => In15_signal,
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
      In8_signal <= "0000000000001000";
      In9_signal <= "0000000000001001";
      In10_signal <= "0000000000001010";
      In11_signal <= "0000000000001011";
      In12_signal <= "0000000000001100";
      In13_signal <= "0000000000001101";
      In14_signal <= "0000000000001110";
      In15_signal <= "0000000000001111";

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '0';
      S2_signal <= '0';
      S3_signal <= '0';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '0';
      S2_signal <= '0';
      S3_signal <= '0';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '1';
      S2_signal <= '0';
      S3_signal <= '0';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '1';
      S2_signal <= '0';
      S3_signal <= '0';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '0';
      S2_signal <= '1';
      S3_signal <= '0';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '0';
      S2_signal <= '1';
      S3_signal <= '0';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '1';
      S2_signal <= '1';
      S3_signal <= '0';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '1';
      S2_signal <= '1';
      S3_signal <= '0';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '0';
      S2_signal <= '0';
      S3_signal <= '1';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '0';
      S2_signal <= '0';
      S3_signal <= '1';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '1';
      S2_signal <= '0';
      S3_signal <= '1';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '1';
      S2_signal <= '0';
      S3_signal <= '1';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '0';
      S2_signal <= '1';
      S3_signal <= '1';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '0';
      S2_signal <= '1';
      S3_signal <= '1';

      wait for 10 ns;
      S0_signal <= '0';
      S1_signal <= '1';
      S2_signal <= '1';
      S3_signal <= '1';

      wait for 10 ns;
      S0_signal <= '1';
      S1_signal <= '1';
      S2_signal <= '1';
      S3_signal <= '1';

 --     wait;
   end process;

END;
