----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Control_Memory_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Control_Memory_tb IS
END Control_Memory_tb;

ARCHITECTURE behavior OF Control_Memory_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Control_Memory is
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

   --Inputs
   signal IN_CAR_signal : std_logic_vector(7 downto 0);

   --Outputs
   Signal MW_signal : std_logic;
   Signal MM_signal : std_logic;
   Signal RW_signal : std_logic;
   Signal MD_signal : std_logic;
   Signal FS_signal : std_logic_vector(4 downto 0);
   Signal MB_signal : std_logic;
   Signal TB_signal : std_logic;
   Signal TA_signal : std_logic;
   Signal TD_signal : std_logic;
   Signal PL_signal : std_logic;
   Signal PI_signal : std_logic;
   Signal IL_signal : std_logic;
   Signal MC_signal : std_logic;
   Signal MS_signal : std_logic_vector(2 downto 0);
   Signal NA_signal : std_logic_vector(7 downto 0);

BEGIN


  -- Instantiate the Unit Under Test (UUT)
   uut: Control_Memory
    PORT MAP (
    MW => MW_signal,
    MM => MM_signal,
    RW => RW_signal,
    MD => MD_signal,
    FS => FS_signal,
    MB => MB_signal,
    TB => TB_signal,
    TA => TA_signal,
    TD => TD_signal,
    PL => PL_signal,
    PI => PI_signal,
    IL => IL_signal,
    MC => MC_signal,
    MS => MS_signal,
    NA => NA_signal,
    IN_CAR => IN_CAR_signal
    );



   stim_proc: process
   begin
   
   --Test to see if outputs the test value in memory
    IN_CAR_signal <= x"10";
    wait for 100 ns;
    
    --Test to see if outputs the test value in memory
    IN_CAR_signal <= x"11";
    wait for 100 ns;



   end process;

END;
