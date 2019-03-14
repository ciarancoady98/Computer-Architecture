----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2019 14:36:53
-- Design Name: 
-- Module Name: Data_Path - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Data_Path is
    Port ( Write : in STD_LOGIC;
           A_Address : in STD_LOGIC_VECTOR (2 downto 0);
           B_Address : in STD_LOGIC_VECTOR (2 downto 0);
           D_Address : in STD_LOGIC_VECTOR (2 downto 0);
           Constant_In : in STD_LOGIC_VECTOR (15 downto 0);
           MB_select : in STD_LOGIC;
           MD_select : in STD_LOGIC;
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

component RegisterFile
    Port ( A_Src_s0 : in STD_LOGIC;
           A_Src_s1 : in STD_LOGIC;
           A_Src_s2 : in STD_LOGIC;
           B_Src_s0 : in STD_LOGIC;
           B_Src_s1 : in STD_LOGIC;
           B_Src_s2 : in STD_LOGIC;
           Des_A0 : in STD_LOGIC;
           Des_A1 : in STD_LOGIC;
           Des_A2 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Write : in STD_LOGIC;
           Data : in STD_LOGIC_VECTOR (15 downto 0);
           A_Data : out STD_LOGIC_VECTOR (15 downto 0);
           B_Data : out STD_LOGIC_VECTOR (15 downto 0)
           );
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

signal BusA : std_logic_vector(15 downto 0);
signal BusBBeforeMux : std_logic_vector(15 downto 0);
signal BusB : std_logic_vector(15 downto 0);
signal FUoutSignal : std_logic_vector(15 downto 0);
signal FUoutBeforeMuxSignal : std_logic_vector(15 downto 0);
signal DdataSignal : std_logic_vector(15 downto 0);

begin

    --Register File
    Register_File: RegisterFile
    PORT MAP(
           Clk => Clk,
           Data => Ddatasignal,
           Write => Write,
           A_Src_s0 => A_Address(0),
           A_Src_s1 => A_Address(1),
           A_Src_s2 => A_Address(2),
           B_Src_s0 => B_Address(0),
           B_Src_s1 => B_Address(1),
           B_Src_s2 => B_Address(2),
           Des_A0 => D_Address(0),
           Des_A1 => D_Address(1),
           Des_A2 => D_Address(2),
           A_Data => BusA,
           B_Data => BusBBeforeMux
            );
            
     --Mux B
     MuxB: Multiplexer_2to1
     PORT MAP(
            S => MB_select,
            In0 => BusBBeforeMux,
            In1 => Constant_In,
            Z => BusB
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

     Address_out <= BusA;
     Data_out <= BusB;

end Behavioral;
