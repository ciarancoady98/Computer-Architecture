---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Data_Path_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Data_Path_tb IS
END Data_Path_tb;

ARCHITECTURE Behavioral OF Data_Path_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Data_Path
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
    end component;


    signal Write_signal : STD_LOGIC;
    signal A_Address_signal : STD_LOGIC_VECTOR (2 downto 0);
    signal B_Address_signal : STD_LOGIC_VECTOR (2 downto 0);
    signal D_Address_signal : STD_LOGIC_VECTOR (2 downto 0);
    signal Constant_In_signal : STD_LOGIC_VECTOR (15 downto 0);
    signal MB_select_signal : STD_LOGIC;
    signal MD_select_signal : STD_LOGIC;
    signal FS_signal : STD_LOGIC_VECTOR (4 downto 0);
    signal Data_in_signal : STD_LOGIC_VECTOR (15 downto 0);
    signal V_signal : STD_LOGIC;
    signal C_signal : STD_LOGIC;
    signal N_signal : STD_LOGIC;
    signal Z_signal : STD_LOGIC;
    signal Clk_signal : STD_LOGIC;
    signal Address_out_signal : STD_LOGIC_VECTOR (15 downto 0);
    signal Data_out_signal : STD_LOGIC_VECTOR (15 downto 0);

    constant Clk_period : time := 120 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Data_Path PORT MAP (
           Write => Write_signal,
           A_Address => A_Address_signal,
           B_Address => B_Address_signal,
           D_Address => D_Address_signal,
           Constant_In => Constant_In_signal,
           MB_select => MB_select_signal,
           MD_select => MD_select_signal,
           FS => FS_signal,
           Data_in => Data_in_signal,
           V => V_signal,
           C => C_signal,
           N => N_signal,
           Z => Z_signal,
           Clk => Clk_signal,
           Address_out => Address_out_signal,
           Data_out => Data_out_signal
        );



END;
