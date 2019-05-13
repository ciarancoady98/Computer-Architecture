-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RegisterFile_tb IS
END RegisterFile_tb;
 
ARCHITECTURE behavior OF RegisterFile_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
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
           B_Data : out STD_LOGIC_VECTOR (15 downto 0));
end component;
    

   --Inputs
   
   signal load_enable_signal : STD_LOGIC;
   signal Clk_signal : STD_LOGIC;
   signal Data_signal : STD_LOGIC_VECTOR(15 downto 0);
   signal A_select_Signal : STD_LOGIC_VECTOR(2 downto 0);
   signal B_select_Signal : STD_LOGIC_VECTOR(2 downto 0);
   signal D_select_Signal : STD_LOGIC_VECTOR(2 downto 0);
   
   --outputs
   signal A_data_Signal : STD_LOGIC_VECTOR(15 downto 0);
   signal B_data_Signal : STD_LOGIC_VECTOR(15 downto 0);

   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
           A_Src_s0 => A_select_Signal(0),
           A_Src_s1 => A_select_Signal(1),
           A_Src_s2 => A_select_Signal(2),
           B_Src_s0 => B_select_Signal(0),
           B_Src_s1 => B_select_Signal(1),
           B_Src_s2 => B_select_Signal(2),
           Des_A0 => D_select_Signal(2),
           Des_A1 => D_select_Signal(1),
           Des_A2 => D_select_Signal(0),
           Clk => Clk_signal,
           Write => load_enable_signal,
           Data => Data_signal,
           A_Data => A_data_Signal,
           B_Data => B_data_Signal
        );

-- begin process
stim_proc : process
begin
Clk_signal <= '0';

load_enable_signal <= '1';
data_signal <= "1111111111111110";
D_select_signal <= "000";
A_select_signal <= "000";
--A should display fffe and fffe is in reg0

wait for clk_period*3;
clk_signal <= '1';

wait for clk_period;
clk_signal <= '0';

data_signal <= "1111111111111110";
D_select_signal <= "001";
B_select_signal <= "001";
--B should display fffe and fffe is in reg1

wait for clk_period;
clk_signal <= '1';

wait for clk_period;
clk_signal <= '0';

data_signal <= A_data_signal;
D_select_signal <= "010";
B_select_signal <= "010";
--B select should display fffe and fffe is in reg2

wait for clk_period;
clk_signal <= '1';

wait for clk_period;
clk_signal <= '0';

load_enable_signal <= '0';
data_signal <= "1111111111111110";
D_select_signal <= "010";
B_select_signal <= "010";
--nothing should happen as load enable is not set


wait for clk_period;
clk_signal <= '1';

wait for clk_period;
clk_signal <= '0';

load_enable_signal <= '1';
data_signal <= "0000000000000000";
D_select_signal <= "111";
A_select_signal <= "111";
--A select should display 0000 and 0000 is in reg7


wait for clk_period;
clk_signal <= '1';

wait for clk_period;

end process;



END;