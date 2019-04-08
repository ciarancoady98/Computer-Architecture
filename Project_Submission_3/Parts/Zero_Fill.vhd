---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Zero_Fill
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Zero_Fill is
    Port (
        SB : in  STD_LOGIC_VECTOR (2 downto 0);
        Z : out STD_LOGIC_VECTOR (15 downto 0));
end Zero_Fill;

architecture Behavioral of Zero_Fill is

begin
    Z(2 downto 0) <= SB;
    Z(15 downto 3) <= "0000000000000";
end Behavioral;
