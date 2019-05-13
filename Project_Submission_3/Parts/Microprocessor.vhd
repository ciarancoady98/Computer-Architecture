----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Microprocessor
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprocessor is
    Port ( C_In : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           G : out STD_LOGIC_VECTOR (15 downto 0);
           C_Out : out STD_LOGIC;
           V_out : out STD_LOGIC);
end Microprocessor;

architecture Behavioral of Microprocessor is


signal C_0 : std_logic;
signal C_1 : std_logic;
signal C_2 : std_logic;
signal C_3 : std_logic;
signal C_4 : std_logic;
signal C_5 : std_logic;
signal C_6 : std_logic;
signal C_7 : std_logic;
signal C_8 : std_logic;
signal C_9 : std_logic;
signal C_10 : std_logic;
signal C_11 : std_logic;
signal C_12 : std_logic;
signal C_13 : std_logic;
signal C_14 : std_logic;
signal C_Out_Signal : std_logic;

begin

    

end Behavioral;
