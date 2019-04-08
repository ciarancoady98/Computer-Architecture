---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Logic_Circuit_Bitslice
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Logic_Circuit_Bitslice is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Z : out STD_LOGIC);
end Logic_Circuit_Bitslice;

architecture Behavioral of Logic_Circuit_Bitslice is

COMPONENT Multiplexer_4to1
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           In3 : in STD_LOGIC;
           Z : out STD_LOGIC
           );
END COMPONENT;

signal A_and_B_signal : STD_LOGIC;
signal A_or_B_signal : STD_LOGIC;
signal A_xor_B_signal : STD_LOGIC;
signal not_A_signal : STD_LOGIC;


begin

A_and_B_signal <= A and B;
A_or_B_signal <= A or B;
A_xor_B_signal <= A xor B;
not_A_signal <= not A;

mux: Multiplexer_4to1 PORT MAP(
        S0 => S0,
        S1 => S1,
        In0 => A_and_B_signal,
        In1 => A_or_B_signal,
        In2 => A_xor_B_signal,
        In3 => not_A_signal,
        Z => Z
        );

end Behavioral;
