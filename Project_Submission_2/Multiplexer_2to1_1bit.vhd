----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2019 11:44:28
-- Design Name: 
-- Module Name: Multiplexer_2to1_1bit - Behavioral
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

entity Multiplexer_2to1_1bit is
    Port ( In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Z : out STD_LOGIC);
end Multiplexer_2to1_1bit;

architecture Behavioral of Multiplexer_2to1_1bit is

begin

Z <= In0 after 5 ns when S = '0' else 
     In1 after 5 ns when S = '1' else
     '0' after 5 ns;

end Behavioral;
