----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Sign_Extend_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sign_Extend_tb is
end Sign_Extend_tb;

architecture Behavioral of Sign_Extend_tb is

component Sign_Extend
    Port ( Input : in  STD_LOGIC_VECTOR (5 downto 0);
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

--Inputs
signal Input_signal : STD_LOGIC_VECTOR (5 downto 0);
--Outputs
signal Output_signal : STD_LOGIC_VECTOR (15 downto 0);

--Clock
  constant Clk_period : time := 60 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
        uut: Sign_Extend PORT MAP (
            Input => Input_signal,
            Output => Output_signal
            );
    
    stim_proc: process
    begin
    --test number with most sig bit = 0
    Input_signal <= "011100";
    --should be 0000000000011100
    
    wait for Clk_period;
    
    --test number with most sig bit = 0
    Input_signal <= "111100";
    --should be 1111111111011100
    
    wait for Clk_period;
        
         
    end process;


END;
