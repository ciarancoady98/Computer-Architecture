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
    end component;


    signal RW_signal : STD_LOGIC;
    signal PC_signal : STD_LOGIC_VECTOR (15 downto 0);
    signal A_Address_signal : STD_LOGIC_VECTOR (3 downto 0);
    signal B_Address_signal : STD_LOGIC_VECTOR (3 downto 0);
    signal D_Address_signal : STD_LOGIC_VECTOR (3 downto 0);
    signal MB_select_signal : STD_LOGIC;
    signal MD_select_signal : STD_LOGIC;
    signal MM_select_signal : STD_LOGIC;
    signal SB_signal : STD_LOGIC_VECTOR (2 downto 0);
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
           RW => RW_signal,
           PC => PC_signal,
           A_Address => A_Address_signal,
           B_Address => B_Address_signal,
           D_Address => D_Address_signal,
           MB_select => MB_select_signal,
           MD_select => MD_select_signal,
           MM_select => MM_select_signal,
           SB => SB_signal,
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

    -- Process to change the clock signal
   Clk_process :process
   begin
	   Clk_signal <= '0';
	   wait for 10 ns;
	   Clk_signal <= '1';
	   wait for 10 ns;
   end process;

-- begin process
stim_proc : process
begin

wait for Clk_period;

RW_signal <= '1';
MM_select_signal <= '0';
MB_select_signal <= '0';
Data_in_signal <= "0000000000000000";
D_Address_signal <= "0000";
wait for Clk_period;
--rw_enable_signal <= '0';
A_Address_signal <= "0000";
--A should display 0000 and 0000 is in reg0

wait for Clk_period;

Data_in_signal <= "0000000000000001";
D_Address_signal <= "0001";
wait for Clk_period;
--rw_enable_signal <= '0';
A_Address_signal <= "0001";
--B should display 0001 and 0001 is in reg1

wait for Clk_period;

Data_in_signal <= "0000000000000010";
D_Address_signal <= "0010";
wait for Clk_period;
--rw_enable_signal <= '0';
A_Address_signal <= "0010";
--B select should display 0010 and 0010 is in reg2

wait for clk_period;

RW_signal <= '0';
Data_in_signal <= "1111111111111110";
D_Address_signal <= "0010";
wait for Clk_period;
A_Address_signal <= "0010";
--nothing should happen as load enable is not set


wait for Clk_period;

RW_signal <= '1';
Data_in_signal <= "0000000000000111";
D_Address_signal <= "0111";
wait for Clk_period;
--rw_enable_signal <= '0';
A_Address_signal <= "0111";
--A select should display 0111 and 0111 is in reg7

wait for Clk_period;

RW_signal <= '1';
Data_in_signal <= "0000000000001000";
D_Address_signal <= "1000";
wait for Clk_period;
--rw_enable_signal <= '0';
A_Address_signal <= "1000";
B_Address_signal <= "1000";
--A select should display 1000 and 1000 is in reg8

wait for Clk_period;

Data_in_signal <= "0101010101010101";
D_Address_signal <= "0000";
wait for Clk_period;
--rw_enable_signal <= '0';

Data_in_signal <= "0101010101010101";
D_Address_signal <= "0001";
wait for Clk_period;
RW_signal <= '0';
wait for Clk_period;

A_Address_signal <= "0000";
B_Address_signal <= "0001";

FS_signal <= "00000";
wait for clk_period;
    -- F = A


FS_signal <= "00001";
wait for clk_period;
-- F  =A + 1 


FS_signal <= "00010";
wait for clk_period;
-- F = 0xFFFF


FS_signal <= "00011";
wait for clk_period;
-- F = A + B + 1


      --test 111
      SB_signal <= "111";

      wait for Clk_period;

      --test 000
      SB_signal <= "000";

      wait for Clk_period;

      --test 010
      SB_signal <= "010";

wait for Clk_period;


end process;

END;
