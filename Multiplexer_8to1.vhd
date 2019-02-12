----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.02.2019 14:55:30
-- Design Name: 
-- Module Name: Multiplexer_8to1 - Behavioral
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

entity Multiplexer_8to1 is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           In2 : in STD_LOGIC_VECTOR (15 downto 0);
           In3 : in STD_LOGIC_VECTOR (15 downto 0);
           In4 : in STD_LOGIC_VECTOR (15 downto 0);
           In5 : in STD_LOGIC_VECTOR (15 downto 0);
           In6 : in STD_LOGIC_VECTOR (15 downto 0);
           In7 : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end Multiplexer_8to1;

architecture Behavioral of Multiplexer_8to1 is

begin

Z <= In0 after 5 ns when (S2 = '0' and S1 = '0' and S0 = '0') else 
     In1 after 5 ns when (S2 = '0' and S1 = '0' and S0 = '1') else 
     In2 after 5 ns when (S2 = '0' and S1 = '1' and S0 = '0') else 
     In3 after 5 ns when (S2 = '0' and S1 = '1' and S0 = '1') else 
     In4 after 5 ns when (S2 = '1' and S1 = '0' and S0 = '0') else 
     In5 after 5 ns when (S2 = '1' and S1 = '0' and S0 = '1') else 
     In6 after 5 ns when (S2 = '1' and S1 = '1' and S0 = '0') else 
     In7 after 5 ns when (S2 = '1' and S1 = '1' and S0 = '1') else 
     "0000000000000000" after 5 ns;

end Behavioral;
