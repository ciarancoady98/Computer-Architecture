---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Full_Adder
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           Sum : out STD_LOGIC;
           C_out : out STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is
signal S1, S2, S3 : STD_LOGIC;

constant gate_delay: Time:= 5ns;

begin
s1 <= (In1 xor In2) after gate_delay;
s2 <= (c_in and S1) after gate_delay;
s3 <= (In1 and In2) after gate_delay;
sum <= (S1 xor C_in) after gate_delay;
c_out <= (S2 or S3) after gate_delay;


end Behavioral;
