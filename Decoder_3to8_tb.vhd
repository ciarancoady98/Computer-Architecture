--------------------------------------------------------------------------------
-- Company: Trinity College
-- Engineer: Dr. Michael Manzke
--
-- Create Date:   11:50:59 02/23/2012
-- Design Name:   
-- Module Name:   C:/Xilinx/12.4/ISE_DS/ISE/ISEexamples/MichaelsMultiplexer/multiplexer_tb.vhd
-- Project Name:  MichaelsMultiplexer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplexer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Decoder_3to8_tb IS
END Decoder_3to8_tb;
 
ARCHITECTURE behavior OF Decoder_3to8_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    COMPONENT Decoder_3to8
    PORT ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal A0_signal : std_logic;
   signal A1_signal : std_logic;
   signal A2_signal : std_logic;

 	--Outputs
   signal Q0_signal : std_logic;
   signal Q1_signal : std_logic;
   signal Q2_signal : std_logic;
   signal Q3_signal : std_logic;
   signal Q4_signal : std_logic;
   signal Q5_signal : std_logic;
   signal Q6_signal : std_logic;
   signal Q7_signal : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder_3to8 PORT MAP (
          A0 => A0_Signal,
          A1 => A1_Signal,
          A2 => A2_Signal,
          Q0 => Q0_Signal,
          Q1 => Q1_Signal,
          Q2 => Q2_Signal,
          Q3 => Q3_Signal,
          Q4 => Q4_Signal,
          Q5 => Q5_Signal,
          Q6 => Q6_Signal,
          Q7 => Q7_Signal
        );

   stim_proc: process
   begin	
        
        wait for 10 ns;	
      A2_signal <= '0';
      A1_signal <= '0';
      A0_signal <= '0';

      wait for 10 ns;	
      A2_signal <= '1';
      A1_signal <= '0';
      A0_signal <= '0';
      
      wait for 10 ns;	
      A2_signal <= '0';
      A1_signal <= '1';
      A0_signal <= '0';
      
      wait for 10 ns;	
      A2_signal <= '1';
      A1_signal <= '1';
      A0_signal <= '0';
      
      wait for 10 ns;	
      A2_signal <= '0';
      A1_signal <= '0';
      A0_signal <= '1';
      
      wait for 10 ns;	
      A2_signal <= '1';
      A1_signal <= '0';
      A0_signal <= '1';
      
      wait for 10 ns;	
      A2_signal <= '0';
      A1_signal <= '1';
      A0_signal <= '1';
      
      wait for 10 ns;	
      A2_signal <= '1';
      A1_signal <= '1';
      A0_signal <= '1';
        	
        
     
 --     wait;
   end process;

END;
