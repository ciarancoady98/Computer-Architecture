---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_2to1_1bit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_2to1_1bit is
    Port ( In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           S : in STD_LOGIC;
           Z : out STD_LOGIC);
end Multiplexer_2to1_1bit;

architecture Behavioral of Multiplexer_2to1_1bit is

begin

Z <= In0 after 5 ns when S = '0' else 
     In1 after 5 ns when S = '1' else
     '0' after 5 ns;

end Behavioral;
