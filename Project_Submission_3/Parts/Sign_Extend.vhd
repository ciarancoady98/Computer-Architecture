----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Sign_Extend
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sign_Extend is
    Port (
           Input : in  STD_LOGIC_VECTOR (5 downto 0);
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
end Sign_Extend;

architecture Behavioral of Sign_Extend is

begin
  Output(15 downto 6) <= "0000000000" when (Input(5)='0') else "1111111111";
  Output(5 downto 0) <= Input;
end Behavioral;
