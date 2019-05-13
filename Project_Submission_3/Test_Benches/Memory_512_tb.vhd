----------------------------------------------------------------------------------
-- Engineer: Ciaran Coady
-- Module Name: Memory_512_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Memory_512_tb IS
END Memory_512_tb;

ARCHITECTURE behavior OF Memory_512_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Memory_512
    Port ( Address_in : in  STD_LOGIC_VECTOR (15 downto 0);
           Data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           Clk : in STD_LOGIC;
           MW : in  STD_LOGIC;
           Data_out : out  STD_LOGIC_VECTOR (15 downto 0));
    end component;

   --Inputs
   signal Address_in_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal Data_in_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal Clk_signal : STD_LOGIC;
   signal MW_signal : STD_LOGIC;

 	--Outputs
   signal Data_out_signal : STD_LOGIC_VECTOR (15 downto 0);

  --Clock
  constant Clk_period : time := 60 ns;

BEGIN


-- Instantiate the Unit Under Test (UUT)
   uut: Memory_512
    PORT MAP ( Address_in => Address_in_signal,
           Data_in => Data_in_signal,
           Clk => Clk_signal,
           MW => MW_signal,
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

   stim_proc: process
   begin
        
        --turn on writing
        MW_signal <= '1';
        wait for Clk_period;
        
        --load 1111 into location 1
        Address_in_signal <= x"0001";
        Data_in_signal <= x"1111";
        wait for Clk_period;
        
        --load 1010 into location 2
        Address_in_signal <= x"0001";
        Data_in_signal <= x"1111";
        wait for Clk_period;
       
       --turn off writing
        MW_signal <= '0';
        
        --access location 1 (signal should not be written)
        Address_in_signal <= x"0001";
        Data_in_signal <= x"2222";
        wait for Clk_period;
        
        --access location 2 (signal should not be written)
        Address_in_signal <= x"0002";
        Data_in_signal <= x"3333";
        wait for Clk_period;
        
        


   end process;

END;
