library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

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
