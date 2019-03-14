----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2019 11:41:54
-- Design Name: 
-- Module Name: Arithmetic_Circuit_Bitslice - Behavioral
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

entity Arithmetic_Circuit_Bitslice is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC;
           C_out : out STD_LOGIC);
end Arithmetic_Circuit_Bitslice;

architecture Behavioral of Arithmetic_Circuit_Bitslice is

component Multiplexer_2to1_1bit is
    Port ( In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Z : out STD_LOGIC);
end component;

component Full_Adder is
    Port ( In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           Sum : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal Y : std_logic;

begin

    mux: Multiplexer_2to1_1bit
    PORT MAP(
            In0 => S1,
            In1 => S0,
            S => B,
            Z => Y
            );
            
    fullAdder: Full_Adder
    PORT MAP(
            In1 => Y,
            In2 => A,
            C_in => C_in,
            Sum => G,
            C_out => C_out
            );
            
end Behavioral;
