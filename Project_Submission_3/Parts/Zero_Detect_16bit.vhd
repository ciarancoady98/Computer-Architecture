----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2019 11:52:16
-- Design Name: 
-- Module Name: Zero_Detect_16bit - Behavioral
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

entity Zero_Detect_16bit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC);
end Zero_Detect_16bit;

architecture Behavioral of Zero_Detect_16bit is

begin

Z <= '1' after 5 ns when A = "0000000000000000" else
     '0' after 5ns;

end Behavioral;
