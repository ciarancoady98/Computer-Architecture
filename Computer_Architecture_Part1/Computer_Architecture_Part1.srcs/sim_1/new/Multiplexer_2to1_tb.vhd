----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.02.2019 15:13:18
-- Design Name: 
-- Module Name: Multiplexer_2to1_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplexer_2to1_tb is
end Multiplexer_2to1_tb;

architecture Behavioral of Multiplexer_2to1_tb is

    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexer_2to1
    PORT(
         S : in STD_LOGIC;
         In0 : in STD_LOGIC_VECTOR (15 downto 0);
         In1 : in STD_LOGIC_VECTOR (15 downto 0);
         Z : out STD_LOGIC_VECTOR (15 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal S : std_logic;
   signal In0 : std_logic_vector(15 downto 0) := (others => '0');
   signal In1 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;

BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
    uut: Multiplexer_2to1 port map (
        S => S,
        In0 => In0,
        In1 => In1,
        Z => Z
    );
    
    stim_proc: process
   begin		
      In0 <= "0000000000000000";
	  In1 <= "1111111111111111";
      wait for 10 ns;	
      S <= '0';
      wait for 10 ns;	
	  S <= '1';


 --     wait;
   end process;

    


END;