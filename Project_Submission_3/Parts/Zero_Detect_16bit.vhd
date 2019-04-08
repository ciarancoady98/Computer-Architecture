---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Zero_Detect_16bit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Zero_Detect_16bit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC);
end Zero_Detect_16bit;

architecture Behavioral of Zero_Detect_16bit is

begin

Z <= '1' after 5 ns when A = "0000000000000000" else
     '0' after 5ns;

end Behavioral;
