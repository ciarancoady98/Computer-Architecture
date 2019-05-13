----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Microprogrammed_Control
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Microprogrammed_Control is
    Port (
    PC : out STD_LOGIC_VECTOR (15 downto 0);
    Opcode_in : in STD_LOGIC_VECTOR (15 downto 0);
    V : in STD_LOGIC;
    C : in STD_LOGIC;
    N : in STD_LOGIC;
    Z : in STD_LOGIC;
    DR : out STD_LOGIC_VECTOR (2 downto 0);
    SA : out STD_LOGIC_VECTOR (2 downto 0);
    SB : out STD_LOGIC_VECTOR (2 downto 0)
    );
end Microprogrammed_Control;

architecture Behavioral of Microprogrammed_Control is

component Multiplexer_8to1_1bit
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           In3 : in STD_LOGIC;
           In4 : in STD_LOGIC;
           In5 : in STD_LOGIC;
           In6 : in STD_LOGIC;
           In7 : in STD_LOGIC;
           Z : out STD_LOGIC);
end component;

component Control_Memory
Port (
		MW : out std_logic;
		MM : out std_logic;
		RW : out std_logic;
		MD : out std_logic;
		FS : out std_logic_vector(4 downto 0);
		MB : out std_logic;
		TB : out std_logic;
		TA : out std_logic;
		TD : out std_logic;
		PL : out std_logic;
		PI : out std_logic;
		IL : out std_logic;
		MC : out std_logic;
		MS : out std_logic_vector(2 downto 0);
		NA : out std_logic_vector(7 downto 0);
		IN_CAR : in std_logic_vector(7 downto 0));
end component;

component Instruction_Register
    Port ( 
           Data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           IL : in  STD_LOGIC;
		   Clk : in STD_LOGIC;
           Opcode : out  STD_LOGIC_VECTOR (6 downto 0);
           DR : out  STD_LOGIC_VECTOR (2 downto 0);
           SA : out  STD_LOGIC_VECTOR (2 downto 0);
           SB : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component Control_Address_Register is
    Port ( Data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Control : in  STD_LOGIC;
		   Clk : in STD_LOGIC;
		   Reset : in STD_LOGIC;
           Data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Program_Counter 
    Port (
           Input : in  STD_LOGIC_VECTOR (15 downto 0);
		   Reset : in STD_LOGIC;
           PL : in  STD_LOGIC;
           PI : in  STD_LOGIC;
           Clk : in STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component Sign_Extend
    Port (
           Input : in  STD_LOGIC_VECTOR (5 downto 0);
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component Multiplexer_2to1_8bit
    Port ( S : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (7 downto 0);
           In1 : in STD_LOGIC_VECTOR (7 downto 0);
           Z : out STD_LOGIC_VECTOR (7 downto 0));
end component;



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
