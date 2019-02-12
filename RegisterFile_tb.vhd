LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RegisterFile_tb IS
END RegisterFile_tb;
 
ARCHITECTURE behavior OF RegisterFile_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    COMPONENT RegisterFile
    PORT ( Src_s0 : in STD_LOGIC;
           Src_s1 : in STD_LOGIC;
           Src_s2 : in STD_LOGIC;
           Des_A0 : in STD_LOGIC;
           Des_A1 : in STD_LOGIC;
           Des_A2 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data_src : in STD_LOGIC;
           Data : in STD_LOGIC_VECTOR (15 downto 0);
           Reg0 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg1 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg2 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg3 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg4 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg5 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg6 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg7 : out STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;
    

    --Inputs
    signal Src_s0_signal : std_logic;
    signal Src_s1_signal : std_logic;
    signal Src_s2_signal : std_logic;
   
    signal Des_A0_signal : std_logic;
    signal Des_A1_signal : std_logic;
    signal Des_A2_signal : std_logic;
   
    signal Clk_signal : std_logic;
   
    signal Data_src_signal : std_logic;
   
    signal Data_signal : std_logic_vector(15 downto 0) := (others => '0');

    --Outputs
 	
 	signal Reg0_signal : std_logic_vector(15 downto 0) := (others => '0');
 	signal Reg1_signal : std_logic_vector(15 downto 0) := (others => '0');
 	signal Reg2_signal : std_logic_vector(15 downto 0) := (others => '0');
 	signal Reg3_signal : std_logic_vector(15 downto 0) := (others => '0');
 	signal Reg4_signal : std_logic_vector(15 downto 0) := (others => '0');
 	signal Reg5_signal : std_logic_vector(15 downto 0) := (others => '0');
 	signal Reg6_signal : std_logic_vector(15 downto 0) := (others => '0');
 	signal Reg7_signal : std_logic_vector(15 downto 0) := (others => '0');
 	
   
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
           Src_s0 => Src_s0_signal,
           Src_s1 => Src_s1_signal,
           Src_s2 => Src_s2_signal,
           Des_A0 => Des_A0_signal,
           Des_A1 => Des_A1_signal,
           Des_A2 => Des_A2_signal,
           Clk => Clk_signal,
           Data_src => Data_src_signal,
           Data => Data_signal,
           Reg0 => Reg0_signal,
           Reg1 => Reg1_signal,
           Reg2 => Reg2_signal,
           Reg3 => Reg3_signal,
           Reg4 => Reg4_signal,
           Reg5 => Reg5_signal,
           Reg6 => Reg6_signal,
           Reg7 => Reg7_signal
        );


   -- Process to change the clock signal
   Clk_process :process
   begin
	   Clk_signal <= '0';
	   wait for Clk_period;
	   Clk_signal <= '1';
	   wait for Clk_period;
   end process;
   
   stim_proc: process
   begin
		
	   wait for Clk_period;
	   --Load 0 into reg0
	   Data_signal <= "0000000000000001";
	   Des_A0_signal <= '0';
	   Des_A1_signal <= '0';
	   Des_A2_signal <= '0';
	   
	   Src_S0_signal <= '0';
	   Src_S1_signal <= '0';
	   Src_S2_signal <= '0';
	   
	   Data_src_signal <= '1';
	   
       wait for Clk_period;
        	
        
     
 --     wait;
   end process;

END;