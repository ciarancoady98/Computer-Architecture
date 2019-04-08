---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Reg_16bit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_16bit is
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           Q : out STD_LOGIC_VECTOR (15 downto 0);
           Load : in STD_LOGIC;
           Clk : in STD_LOGIC);
end Reg_16bit;

architecture Behavioral of Reg_16bit is

begin
process(Clk)
    begin
    if(rising_edge(Clk)) then
        if load='1' then
        Q<=D after 5 ns;
        end if;
    end if;
end process;
end Behavioral;
