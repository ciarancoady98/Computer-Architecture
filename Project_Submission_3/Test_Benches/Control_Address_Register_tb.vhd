----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Control_Address_Register_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Control_Address_Register_tb IS
END Control_Address_Register_tb;

ARCHITECTURE behavior OF Control_Address_Register_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Control_Address_Register
    Port ( Data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Control : in  STD_LOGIC;
		   Clk : in STD_LOGIC;
		   Reset : in STD_LOGIC;
           Data_out : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;

   --Inputs
   signal Data_in_signal : STD_LOGIC_VECTOR (7 downto 0);
   signal Control_signal : STD_LOGIC;
   signal Clk_signal : STD_LOGIC;
   signal Reset_signal : STD_LOGIC;

 	--Outputs
   signal Data_out_signal : STD_LOGIC_VECTOR (7 downto 0);

  --Clock
  constant Clk_period : time := 60 ns;

BEGIN


-- Instantiate the Unit Under Test (UUT)
   uut: Control_Address_Register PORT MAP (
           Data_in => Data_in_signal,
           Control => Control_signal,
           Clk => Clk_signal,
           Reset => Reset_signal,
           Data_out => Data_out_signal
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

       -- load 0 into the register
       Data_in_signal <= "00000000";
       Control_signal <= '0';
       wait for Clk_period;
       
       --increment the value
       Control_signal <= '1';
       wait for Clk_period;
       
       --load 8 into the register
       Data_in_signal <= "00001000";
       Control_signal <= '0';
       wait for Clk_period;
       
       --increment the value
       Control_signal <= '1';
       wait for Clk_period;
       
       --reset to start
       Reset_signal <= '1';
       wait for Clk_period;
       Reset_signal <= '0';
       wait for Clk_period;
       

   end process;

END;
