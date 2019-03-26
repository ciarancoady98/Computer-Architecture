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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Zero_Fill is
    Port (
        SB : in  STD_LOGIC_VECTOR (2 downto 0);
        Z : out STD_LOGIC_VECTOR (15 downto 0));
end Zero_Fill;

architecture Behavioral of Zero_Fill is

begin
    Z(2 downto 0) <= SB;
    Z(15 downto 3) <= "0000000000000";
end Behavioral;
