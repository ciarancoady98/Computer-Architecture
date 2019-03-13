----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2019 14:36:53
-- Design Name: 
-- Module Name: Data_Path - Behavioral
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

entity Data_Path is
    Port ( Write : in STD_LOGIC;
           A_Address : in STD_LOGIC_VECTOR (15 downto 0);
           B_Address : in STD_LOGIC_VECTOR (15 downto 0);
           D_Address : in STD_LOGIC_VECTOR (15 downto 0);
           Constant_In : in STD_LOGIC;
           MB_select : in STD_LOGIC;
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           Data_in : in STD_LOGIC_VECTOR (15 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC;
           Address_out : out STD_LOGIC_VECTOR (15 downto 0);
           Data_out : out STD_LOGIC_VECTOR (15 downto 0));
end Data_Path;

architecture Behavioral of Data_Path is

begin


end Behavioral;
