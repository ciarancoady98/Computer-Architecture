----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Multiplexer_2to1_8bit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplexer_2to1_8bit is
    Port ( S : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (7 downto 0);
           In1 : in STD_LOGIC_VECTOR (7 downto 0);
           Z : out STD_LOGIC_VECTOR (7 downto 0));
end Multiplexer_2to1_8bit;

architecture Behavioral of Multiplexer_2to1_8bit is

begin

Z <= In0 after 5 ns when S = '0' else
     In1 after 5 ns when S = '1' else
     "00000000" after 5 ns;

end Behavioral;
