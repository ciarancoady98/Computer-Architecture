---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_3to1_1bit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_8to1_1bit is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           In3 : in STD_LOGIC;
           In4 : in STD_LOGIC;
           In5 : in STD_LOGIC;
           In6 : in STD_LOGIC;
           In7 : in STD_LOGIC;
           Z : out STD_LOGIC);
end Multiplexer_8to1_1bit;

architecture Behavioral of Multiplexer_8to1_1bit is

begin

Z <= In0 after 5 ns when (S2 = '0' and S1 = '0' and S0 = '0') else
     In1 after 5 ns when (S2 = '0' and S1 = '0' and S0 = '1') else
     In2 after 5 ns when (S2 = '0' and S1 = '1' and S0 = '0') else
     In3 after 5 ns when (S2 = '0' and S1 = '1' and S0 = '1') else
     In4 after 5 ns when (S2 = '1' and S1 = '0' and S0 = '0') else
     In5 after 5 ns when (S2 = '1' and S1 = '0' and S0 = '1') else
     In6 after 5 ns when (S2 = '1' and S1 = '1' and S0 = '0') else
     In7 after 5 ns when (S2 = '1' and S1 = '1' and S0 = '1') else
     '0' after 5 ns;

end Behavioral;
