----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2019 11:52:20
-- Design Name: 
-- Module Name: Ripple_Adder_16bit - Behavioral
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

entity Ripple_Adder_16bit is
    Port ( X : in STD_LOGIC_VECTOR (15 downto 0);
           Y : in STD_LOGIC_VECTOR (15 downto 0);
           C_in : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0);
           C_out : out STD_LOGIC);
end Ripple_Adder_16bit;

architecture Behavioral of Ripple_Adder_16bit is

COMPONENT Full_Adder
    Port ( In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           Sum : out STD_LOGIC;
           C_out : out STD_LOGIC);
END COMPONENT;

signal C_0 : std_logic;
signal C_1 : std_logic;
signal C_2 : std_logic;
signal C_3 : std_logic;
signal C_4 : std_logic;
signal C_5 : std_logic;
signal C_6 : std_logic;
signal C_7 : std_logic;
signal C_8 : std_logic;
signal C_9 : std_logic;
signal C_10 : std_logic;
signal C_11 : std_logic;
signal C_12 : std_logic;
signal C_13 : std_logic;
signal C_14 : std_logic;

begin
    Bit0 : Full_Adder 
        PORT MAP (
            In1 => X(0),
            In2 => Y(0),
            C_in => C_in, 
            Sum => Z(0), 
            C_out => C_0);
        
    Bit1 : Full_Adder 
        PORT MAP (
            In1 => X(1),
            In2 => Y(1),
            C_in => C_0, 
            Sum => Z(1), 
            C_out => C_1);
        
    Bit2 : Full_Adder 
        PORT MAP (
            In1 => X(2),
            In2 => Y(2),
            C_in => C_1, 
            Sum => Z(2), 
            C_out => C_2);
        
    Bit3 : Full_Adder 
        PORT MAP (
            In1 => X(3),
            In2 => Y(3),
            C_in => C_2, 
            Sum => Z(3), 
            C_out => C_3);
        
    Bit4 : Full_Adder 
        PORT MAP (
            In1 => X(4),
            In2 => Y(4),
            C_in => C_3, 
            Sum => Z(4), 
            C_out => C_4);
    
    Bit5 : Full_Adder 
        PORT MAP (
            In1 => X(5),
            In2 => Y(5),
            C_in => C_4, 
            Sum => Z(5), 
            C_out => C_5);
     
    Bit6 : Full_Adder 
        PORT MAP (
            In1 => X(6),
            In2 => Y(6),
            C_in => C_5, 
            Sum => Z(6), 
            C_out => C_6);
    
    Bit7 : Full_Adder 
        PORT MAP (
            In1 => X(7),
            In2 => Y(7),
            C_in => C_6, 
            Sum => Z(7), 
            C_out => C_7);
        
    Bit8 : Full_Adder 
        PORT MAP (
            In1 => X(8),
            In2 => Y(8),
            C_in => C_7, 
            Sum => Z(8), 
            C_out => C_8);
        
    Bit9 : Full_Adder 
        PORT MAP (
            In1 => X(9),
            In2 => Y(9),
            C_in => C_8, 
            Sum => Z(9), 
            C_out => C_9);
        
    Bit10 : Full_Adder 
        PORT MAP (
            In1 => X(10),
            In2 => Y(10),
            C_in => C_9, 
            Sum => Z(10), 
            C_out => C_10);
        
    Bit11 : Full_Adder 
        PORT MAP (
            In1 => X(11),
            In2 => Y(11),
            C_in => C_10, 
            Sum => Z(11), 
            C_out => C_11);
        
    Bit12 : Full_Adder 
        PORT MAP (
            In1 => X(12),
            In2 => Y(12),
            C_in => C_11, 
            Sum => Z(12), 
            C_out => C_12);
    
    Bit13 : Full_Adder 
        PORT MAP (
            In1 => X(13),
            In2 => Y(13),
            C_in => C_12, 
            Sum => Z(13), 
            C_out => C_13);
     
    Bit14 : Full_Adder 
        PORT MAP (
            In1 => X(14),
            In2 => Y(14),
            C_in => C_13, 
            Sum => Z(14), 
            C_out => C_14);
    
    Bit15 : Full_Adder 
        PORT MAP (
            In1 => X(15),
            In2 => Y(15),
            C_in => C_14, 
            Sum => Z(15), 
            C_out => C_Out);


end Behavioral;
