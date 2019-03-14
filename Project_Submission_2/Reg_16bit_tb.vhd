-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Reg_16bit_tb IS
END Reg_16bit_tb;
 
ARCHITECTURE behavior OF Reg_16bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    COMPONENT Reg_16bit
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           Q : out STD_LOGIC_VECTOR (15 downto 0);
           Load : in STD_LOGIC;
           Clk : in STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal D_signal : std_logic_vector(15 downto 0) := (others => '0');
   signal Load_signal : std_logic;
   signal Clk_signal : std_logic;

 	--Outputs
   signal Q_signal : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg_16bit PORT MAP (
          D => D_signal,
          Q => Q_signal,
          Load => Load_signal,
          Clk => Clk_signal
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
      Load_signal <= '1';	
      D_signal <= "0000000000000000";
   
      wait for Clk_period;	
      Load_signal <= '1';	
      D_signal <= "0000000000000001";
      
      wait for Clk_period;	
      Load_signal <= '0';	
      D_signal <= "0000000000000000";
      
      wait for Clk_period;	
      Load_signal <= '1';	
      D_signal <= "1000000000000000";
      
      wait for Clk_period;
      
   end process;

END;
