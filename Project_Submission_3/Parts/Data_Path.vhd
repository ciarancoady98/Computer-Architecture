----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Data_Path
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Data_Path is
    Port ( RW : in STD_LOGIC;
           PC : in STD_LOGIC_VECTOR (15 downto 0);
           A_Address : in STD_LOGIC_VECTOR (3 downto 0);
           B_Address : in STD_LOGIC_VECTOR (3 downto 0);
           D_Address : in STD_LOGIC_VECTOR (3 downto 0);
           MB_select : in STD_LOGIC;
           MD_select : in STD_LOGIC;
           MM_select : in STD_LOGIC;
           SB : in STD_LOGIC_VECTOR (2 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           Data_in : in STD_LOGIC_VECTOR (15 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC;
           Clk : in STD_LOGIC;
           Address_out : out STD_LOGIC_VECTOR (15 downto 0);
           Data_out : out STD_LOGIC_VECTOR (15 downto 0));
end Data_Path;

architecture Behavioral of Data_Path is

component RegisterFile is
    Port ( A_Address : in STD_LOGIC_VECTOR (3 downto 0);
           B_Address : in STD_LOGIC_VECTOR (3 downto 0);
           D_Address : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RW : in STD_LOGIC;
           D_Data : in STD_LOGIC_VECTOR (15 downto 0);
           A_Data : out STD_LOGIC_VECTOR (15 downto 0);
           B_Data : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component;

component Zero_Fill is
    Port (
        SB : in  STD_LOGIC_VECTOR (2 downto 0);
        Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Functional_Unit is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC;
           F : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Multiplexer_2to1 is
    Port ( S : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;


signal zerofill_signal : std_logic_vector(15 downto 0);
signal BusA : std_logic_vector(15 downto 0);
signal BusBBeforeMux : std_logic_vector(15 downto 0);
signal BusB : std_logic_vector(15 downto 0);
signal FUoutBeforeMuxSignal : std_logic_vector(15 downto 0);
signal DdataSignal : std_logic_vector(15 downto 0);

begin

    --Register File
    Register_File: RegisterFile
    PORT MAP(
           Clk => Clk,
           D_Data => Ddatasignal,
           RW => RW,
           A_Address => A_Address,
           B_Address => B_Address,
           D_Address => D_Address,
           A_Data => BusA,
           B_Data => BusBBeforeMux
            );
            
     --Mux B
     MuxB: Multiplexer_2to1
     PORT MAP(
            S => MB_select,
            In0 => BusBBeforeMux,
            In1 => zerofill_signal,
            Z => BusB
            );
         
     --Zero fill   
     ZeroFill: Zero_Fill
     PORT MAP(
            SB => SB,
            Z => zerofill_signal
     );
            
     --Functional Unit
     FunctionalUnit: Functional_Unit
     PORT MAP(
            A => BusA,
            B => BusB,
            FS => FS,
            V => V,
            C => C,
            N => N,
            Z => Z,
            F => FUoutBeforeMuxSignal
            );
            
            
     --Mux D
     MuxD: Multiplexer_2to1
     PORT MAP(
            S => MD_select,
            In0 => FUoutBeforeMuxSignal,
            In1 => Data_in,
            Z => DdataSignal
            );
            
            
     --Mux M
     MuxM: Multiplexer_2to1
     PORT MAP(
            S => MM_select,
            In0 => BusA,
            In1 => PC,
            Z => Address_out
            );

     Data_out <= BusB;

end Behavioral;
