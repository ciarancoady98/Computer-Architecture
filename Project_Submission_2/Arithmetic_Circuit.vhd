----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2019 12:47:34
-- Design Name: 
-- Module Name: Arithmetic_Circuit - Behavioral
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

entity Arithmetic_Circuit is
    Port ( C_In : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           G : out STD_LOGIC_VECTOR (15 downto 0);
           C_Out : out STD_LOGIC);
end Arithmetic_Circuit;

architecture Behavioral of Arithmetic_Circuit is

component Ripple_Adder_16bit
    Port ( X : in STD_LOGIC_VECTOR (15 downto 0);
           Y : in STD_LOGIC_VECTOR (15 downto 0);
           C_in : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0);
           C_out : out STD_LOGIC);
end component;

begin


end Behavioral;
