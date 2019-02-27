-- Ciaran Coady --


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decoder_3to8 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC);
end Decoder_3to8;

architecture Behavioral of Decoder_3to8 is

begin
Q0 <= ((not A0) and (not A1) and (not A2)) after 5 ns;
Q1 <= ((not A0) and (not A1) and A2) after 5 ns;
Q2 <= ((not A0) and A1 and (not A2)) after 5 ns;
Q3 <= ((not A0) and A1 and A2) after 5 ns;
Q4 <= (A0 and (not A1) and (not A2)) after 5 ns;
Q5 <= (A0 and (not A1) and A2) after 5 ns;
Q6 <= (A0 and A1 and (not A2)) after 5 ns;
Q7 <= (A0 and A1 and A2) after 5 ns;

end Behavioral;
