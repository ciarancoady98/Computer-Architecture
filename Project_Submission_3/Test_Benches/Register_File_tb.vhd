---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: RegisterFile_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RegisterFile_tb IS
END RegisterFile_tb;
 
ARCHITECTURE behavior OF RegisterFile_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    component RegisterFile
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
    

   --Inputs
   
   signal rw_enable_signal : STD_LOGIC;
   signal Clk_signal : STD_LOGIC;
   signal A_select_Signal : STD_LOGIC_VECTOR(3 downto 0);
   signal B_select_Signal : STD_LOGIC_VECTOR(3 downto 0);
   signal D_select_Signal : STD_LOGIC_VECTOR(3 downto 0);
   
   --Outputs
   signal A_data_Signal : STD_LOGIC_VECTOR(15 downto 0);
   signal B_data_Signal : STD_LOGIC_VECTOR(15 downto 0);
   signal D_data_Signal : STD_LOGIC_VECTOR(15 downto 0);
    
    --Clock
    constant Clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
           A_Address => A_select_signal,
           B_Address => B_select_signal,
           D_Address => D_select_signal,
           Clk => Clk_signal,
           RW => rw_enable_signal,
           D_Data => D_data_signal,
           A_Data => A_data_signal,
           B_Data => B_data_signal
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

rw_enable_signal <= '1';
D_data_Signal <= "0000000000000000";
D_select_signal <= "0000";
wait for Clk_period;
--rw_enable_signal <= '0';
A_select_signal <= "0000";
--A should display 0000 and 0000 is in reg0

wait for Clk_period;

D_data_Signal <= "0000000000000001";
D_select_signal <= "0001";
wait for Clk_period;
--rw_enable_signal <= '0';
A_select_signal <= "0001";
--B should display 0001 and 0001 is in reg1

wait for Clk_period;

D_data_Signal <= "0000000000000010";
D_select_signal <= "0010";
wait for Clk_period;
--rw_enable_signal <= '0';
A_select_signal <= "0010";
--B select should display 0010 and 0010 is in reg2

wait for clk_period;

rw_enable_signal <= '0';
D_data_Signal <= "1111111111111110";
D_select_signal <= "0010";
wait for Clk_period;
B_select_signal <= "0010";
--nothing should happen as load enable is not set


wait for Clk_period;

rw_enable_signal <= '1';
D_data_Signal <= "0000000000000111";
D_select_signal <= "0111";
wait for Clk_period;
--rw_enable_signal <= '0';
A_select_signal <= "0111";
--A select should display 0111 and 0111 is in reg7

wait for Clk_period;

rw_enable_signal <= '1';
D_data_Signal <= "0000000000001000";
D_select_signal <= "1000";
wait for Clk_period;
--rw_enable_signal <= '0';
A_select_signal <= "1000";
B_select_signal <= "1000";
--A select should display 1000 and 1000 is in reg8

wait for Clk_period;

end process;



END;