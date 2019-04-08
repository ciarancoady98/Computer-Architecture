---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Arithmetic_Circuit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Arithmetic_Circuit is
    Port ( C_In : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           G : out STD_LOGIC_VECTOR (15 downto 0);
           C_Out : out STD_LOGIC;
           V_out : out STD_LOGIC);
end Arithmetic_Circuit;

architecture Behavioral of Arithmetic_Circuit is

COMPONENT Arithmetic_Circuit_Bitslice
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           G : out STD_LOGIC;
           C_out : out STD_LOGIC);
END COMPONENT;

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
    
    Bit0 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(0),
        B => B(0),
        C_in => C_in,
        G => G(0),
        C_out => C_0,
        S0 => S0,
        S1 => S1
        );
        
    Bit1 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(1),
        B => B(1),
        C_in => C_0,
        G => G(1),
        C_out => C_1,
        S0 => S0,
        S1 => S1
        );
        
        
     Bit2 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(2),
        B => B(2),
        C_in => C_1,
        G => G(2),
        C_out => C_2,
        S0 => S0,
        S1 => S1
        );
        
     Bit3 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(3),
        B => B(3),
        C_in => C_2,
        G => G(3),
        C_out => C_3,
        S0 => S0,
        S1 => S1
        );
               
     Bit4 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(4),
        B => B(4),
        C_in => C_3,
        G => G(4),
        C_out => C_4,
        S0 => S0,
        S1 => S1
        );
        
     Bit5 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(5),
        B => B(5),
        C_in => C_4,
        G => G(5),
        C_out => C_5,
        S0 => S0,
        S1 => S1
        );
        
     Bit6 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(6),
        B => B(6),
        C_in => C_5,
        G => G(6),
        C_out => C_6,
        S0 => S0,
        S1 => S1
        );
        
     Bit7 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(7),
        B => B(7),
        C_in => C_6,
        G => G(7),
        C_out => C_7,
        S0 => S0,
        S1 => S1
        );

     Bit8 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(8),
        B => B(8),
        C_in => C_7,
        G => G(8),
        C_out => C_8,
        S0 => S0,
        S1 => S1
        );
        
     Bit9 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(9),
        B => B(9),
        C_in => C_8,
        G => G(9),
        C_out => C_9,
        S0 => S0,
        S1 => S1
        );

     Bit10 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(10),
        B => B(10),
        C_in => C_9,
        G => G(10),
        C_out => C_10,
        S0 => S0,
        S1 => S1
        );
        
     Bit11 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(11),
        B => B(11),
        C_in => C_10,
        G => G(11),
        C_out => C_11,
        S0 => S0,
        S1 => S1
        );
        
     Bit12 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(12),
        B => B(12),
        C_in => C_11,
        G => G(12),
        C_out => C_12,
        S0 => S0,
        S1 => S1
        );
        
     Bit13 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(13),
        B => B(13),
        C_in => C_12,
        G => G(13),
        C_out => C_13,
        S0 => S0,
        S1 => S1
        );
        
     Bit14 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(14),
        B => B(14),
        C_in => C_13,
        G => G(14),
        C_out => C_14,
        S0 => S0,
        S1 => S1
        );

     Bit15 : Arithmetic_Circuit_Bitslice
       PORT MAP(
        A => A(15),
        B => B(15),
        C_in => C_14,
        G => G(15),
        C_out => C_Out_Signal,
        S0 => S0,
        S1 => S1
        );
        
      V_Out <= (C_Out_Signal XOR C_14);
      C_Out <= C_Out_Signal;

end Behavioral;
