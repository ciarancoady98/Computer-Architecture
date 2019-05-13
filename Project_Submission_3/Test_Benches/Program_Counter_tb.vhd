----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Program_Counter_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Program_Counter_tb IS
END Program_Counter_tb;

ARCHITECTURE behavior OF Program_Counter_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Program_Counter is
    Port (
           Input : in  STD_LOGIC_VECTOR (15 downto 0);
		   Reset : in STD_LOGIC;
           PL : in  STD_LOGIC;
           PI : in  STD_LOGIC;
           Clk : in STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
    end component;


   --Inputs
   signal Input_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal Reset_signal : STD_LOGIC;
   signal PL_signal : STD_LOGIC;
   signal PI_signal : STD_LOGIC;
   signal Clk_signal : STD_LOGIC;

 	--Outputs
   signal Output_signal : STD_LOGIC_VECTOR (15 downto 0);

  --Clock
  constant Clk_period : time := 60 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Program_Counter PORT MAP (
          Input => Input_signal,
          Reset => Reset_signal,
          PL => PL_signal,
          PI => PI_signal,
          Clk => Clk_signal,
          Output => Output_signal
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

       --reset the pc
       Reset_signal <= '1';
       wait for Clk_period;
       Reset_signal <= '0';
       wait for Clk_period;

      --load in 1
      Input_signal <= x"0001";
      PI_signal <= '1';
      --wait a bit and increment
      wait for Clk_period;
      PI_signal <= '0';
      
      --add an offset of 8
      Input_signal <= x"0008";
      PL_signal <= '1';
      wait for Clk_period;
      PL_signal <= '0';
      
       wait for Clk_period;

   end process;

END;
