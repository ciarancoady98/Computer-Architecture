---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_2to1
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_2to1 is
    Port ( S : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end Multiplexer_2to1;

architecture Behavioral of Multiplexer_2to1 is

begin

Z <= In0 after 5 ns when S = '0' else 
     In1 after 5 ns when S = '1' else
     "0000000000000000" after 5 ns;

end Behavioral;
