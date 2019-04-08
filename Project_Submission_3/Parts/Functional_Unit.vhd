---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Functional_Unit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Functional_Unit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC;
           F : out STD_LOGIC_VECTOR (15 downto 0));
end Functional_Unit;

architecture Behavioral of Functional_Unit is

component Multiplexer_2to1 
    Port ( S : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Arithmetic_Logic_Unit
    Port ( C_in : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0);
           C_out : out STD_LOGIC;
           V_out : out STD_LOGIC);
end component;

component Zero_Detect_16bit
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC);
end component;

component Shifter_16bit
    Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           Ir : in STD_LOGIC;
           Il : in STD_LOGIC;
           H : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal ALU_output_signal : std_logic_vector(15 downto 0); 
signal Shifter_output_signal : std_logic_vector(15 downto 0); 

begin

ALU : Arithmetic_Logic_Unit
        PORT MAP(
            C_In => FS(4),
            A => A,
            B => B,
            S0 => FS(1),
            S1 => FS(2),
            S2 => FS(3),
            G => ALU_output_signal,
            C_Out => C,
            V_Out => V
         ); 

Shifter : Shifter_16bit
        PORT MAP(
            B => B,
            S(0) => FS(1),
            S(1) => FS(2),
            Ir => '0',
            Il => '0',
            H => Shifter_output_signal
         ); 
         
ZeroDetect : Zero_Detect_16bit
         PORT MAP(
            A => ALU_output_signal,
            Z => Z
          );
          
Mux : Multiplexer_2to1
        PORT MAP(
            S => FS(0),
            In0 => ALU_output_signal,
            In1 => Shifter_output_signal,
            Z => F
        );
        
N <= ALU_output_signal(15);

end Behavioral;
