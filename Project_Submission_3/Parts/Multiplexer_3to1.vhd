---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_3to1_1bit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_3to1_1bit is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           Z : out STD_LOGIC);
end Multiplexer_3to1_1bit;

architecture Behavioral of Multiplexer_3to1_1bit is

begin

Z <= In0 after 5 ns when (S1 = '0' and S0 = '0') else 
     In1 after 5 ns when (S1 = '0' and S0 = '1') else 
     In2 after 5 ns when (S1 = '1' and S0 = '0') else 
     'U' after 5 ns;

end Behavioral;
