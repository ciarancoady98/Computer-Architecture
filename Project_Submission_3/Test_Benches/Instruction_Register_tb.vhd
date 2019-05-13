----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Instruction_Register_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Instruction_Register_tb IS
END Instruction_Register_tb;

ARCHITECTURE behavior OF Instruction_Register_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    component Instruction_Register
    Port (
           Data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           IL : in  STD_LOGIC;
           Clk : in STD_LOGIC;
           Opcode : out  STD_LOGIC_VECTOR (6 downto 0);
           DR : out  STD_LOGIC_VECTOR (2 downto 0);
           SA : out  STD_LOGIC_VECTOR (2 downto 0);
           SB : out  STD_LOGIC_VECTOR (2 downto 0));
    end component;


   --Inputs
   signal Data_in_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal IL_signal : STD_LOGIC;
   signal Clk_signal : STD_LOGIC;

   --Outputs
   signal Opcode_signal : STD_LOGIC_VECTOR (6 downto 0);
   signal DR_signal :  STD_LOGIC_VECTOR (2 downto 0);
   signal SA_signal :  STD_LOGIC_VECTOR (2 downto 0);
   signal SB_signal :  STD_LOGIC_VECTOR (2 downto 0);

   --Clocks
   constant Clk_period : time := 60 ns;

BEGIN

   -- Instantiate the Unit Under Test (UUT)
   uut: Instruction_Register
   PORT MAP (
          Data_in => Data_in_signal,
          IL => IL_signal,
          Clk => Clk_signal,
          Opcode => Opcode_signal,
          DR => DR_signal,
          SA => SA_signal,
          SB => SB_signal
   );


   -- Process to change the clock signal
   Clk_process :process
   begin
     Clk_signal <= '0';
     wait for 10 ns;
     Clk_signal <= '1';
     wait for 10 ns;
   end process;


   stim_proc: process
   begin
      --Load the following into the register
      -- Opcode = 0000100, DR = 100, SA = 111, SB = 001.
      Data_in_signal <= "0000100100111001";
      IL_signal <= '1';
      
      wait for Clk_period;
      
      --Do nothing as IL is 0
      Data_in_signal <= "0101010101010101";
      IL_signal <= '0';
      
      wait for Clk_period;
      
      --Load the following into the register
      -- Opcode = 000q100, DR = 101, SA = 111, SB = 001.
      Data_in_signal <= "0001100101111001";
      IL_signal <= '1';
      
      wait for Clk_period;

   end process;

END;
