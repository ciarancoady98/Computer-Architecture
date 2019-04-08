---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Arithmetic_Circuit_Bitslice
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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

component Multiplexer_2to1_1bit
    Port ( In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Z : out STD_LOGIC);
end component;

component Full_Adder
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
