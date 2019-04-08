---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_3to1_1bit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_4to1 is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           In3 : in STD_LOGIC;
           Z : out STD_LOGIC
           );
end Multiplexer_4to1;

architecture Behavioral of Multiplexer_4to1 is

begin

Z <= In0 after 5 ns when (S1 = '0' and S0 = '0') else 
     In1 after 5 ns when ( S1 = '0' and S0 = '1') else 
     In2 after 5 ns when (S1 = '1' and S0 = '0') else 
     In3 after 5 ns when (S1 = '1' and S0 = '1') else  
     '0' after 5 ns;

end Behavioral;
