-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY Decoder_4to16_tb IS
END Decoder_4to16_tb;

ARCHITECTURE behavior OF Decoder_4to16_tb is

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT Decoder_4to16
        Port ( A0 : in  STD_LOGIC;
               A1 : in  STD_LOGIC;
               A2 : in  STD_LOGIC;
               A3 : in STD_LOGIC;
               Q0 : out STD_LOGIC;
               Q1 : out STD_LOGIC;
               Q2 : out STD_LOGIC;
               Q3 : out STD_LOGIC;
               Q4 : out STD_LOGIC;
               Q5 : out STD_LOGIC;
               Q6 : out STD_LOGIC;
               Q7 : out STD_LOGIC);
               Q8 : out STD_LOGIC);
               Q9 : out STD_LOGIC);
               Q10 : out STD_LOGIC);
               Q11 : out STD_LOGIC);
               Q12 : out STD_LOGIC);
               Q13 : out STD_LOGIC);
               Q14 : out STD_LOGIC);
               Q15 : out STD_LOGIC);
    END COMPONENT;


   --Inputs
   signal A0_signal : std_logic;
   signal A1_signal : std_logic;
   signal A2_signal : std_logic;
   signal A3_signal : std_logic;

 	--Outputs
   signal Q0_signal : std_logic;
   signal Q1_signal : std_logic;
   signal Q2_signal : std_logic;
   signal Q3_signal : std_logic;
   signal Q4_signal : std_logic;
   signal Q5_signal : std_logic;
   signal Q6_signal : std_logic;
   signal Q7_signal : std_logic;
   signal Q8_signal : std_logic;
   signal Q9_signal : std_logic;
   signal Q10_signal : std_logic;
   signal Q11_signal : std_logic;
   signal Q12_signal : std_logic;
   signal Q13_signal : std_logic;
   signal Q14_signal : std_logic;
   signal Q15_signal : std_logic;
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name

--   constant Clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder_4to16 PORT MAP (
          A0 => A0_Signal,
          A1 => A1_Signal,
          A2 => A2_Signal,
          A3 => A3_Signal,
          Q0 => Q0_Signal,
          Q1 => Q1_Signal,
          Q2 => Q2_Signal,
          Q3 => Q3_Signal,
          Q4 => Q4_Signal,
          Q5 => Q5_Signal,
          Q6 => Q6_Signal,
          Q7 => Q7_Signal,
          Q8 => Q8_Signal,
          Q9 => Q9_Signal,
          Q10 => Q10_Signal,
          Q11 => Q11_Signal,
          Q12 => Q12_Signal,
          Q13 => Q13_Signal,
          Q14 => Q14_Signal,
          Q15 => Q15_Signal
        );

   stim_proc: process
   begin

      wait for 10 ns;
      A3_signal <= '1';
      A2_signal <= '0';
      A1_signal <= '0';
      A0_signal <= '0';

      wait for 10 ns;
      A3_signal <= '0';
      A2_signal <= '1';
      A1_signal <= '0';
      A0_signal <= '0';

      wait for 10 ns;
      A3_signal <= '1';
      A2_signal <= '1';
      A1_signal <= '0';
      A0_signal <= '0';

      wait for 10 ns;
      A3_signal <= '0';
      A2_signal <= '0';
      A1_signal <= '1';
      A0_signal <= '0';

      wait for 10 ns;
      A3_signal <= '1';
      A2_signal <= '0';
      A1_signal <= '1';
      A0_signal <= '0';

      wait for 10 ns;
      A3_signal <= '0';
      A2_signal <= '1';
      A1_signal <= '1';
      A0_signal <= '0';

      wait for 10 ns;
      A3_signal <= '1';
      A2_signal <= '1';
      A1_signal <= '1';
      A0_signal <= '0';

      wait for 10 ns;
      A3_signal <= '0';
      A2_signal <= '0';
      A1_signal <= '0';
      A0_signal <= '1';

      wait for 10 ns;
      A3_signal <= '1';
      A2_signal <= '0';
      A1_signal <= '0';
      A0_signal <= '1';

      wait for 10 ns;
      A3_signal <= '0';
      A2_signal <= '1';
      A1_signal <= '0';
      A0_signal <= '1';

      wait for 10 ns;
      A3_signal <= '1';
      A2_signal <= '1';
      A1_signal <= '0';
      A0_signal <= '1';

      wait for 10 ns;
      A3_signal <= '0';
      A2_signal <= '0';
      A1_signal <= '1';
      A0_signal <= '1';

      wait for 10 ns;
      A3_signal <= '1';
      A2_signal <= '0';
      A1_signal <= '1';
      A0_signal <= '1';

      wait for 10 ns;
      A3_signal <= '0';
      A2_signal <= '1';
      A1_signal <= '1';
      A0_signal <= '1';

      wait for 10 ns;
      A3_signal <= '1';
      A2_signal <= '1';
      A1_signal <= '1';
      A0_signal <= '1';

      wait for 10 ns;


 --     wait;
   end process;

END;
