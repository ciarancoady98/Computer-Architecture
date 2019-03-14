-- Ciaran Coady --
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Ripple_Adder_16bit_tb IS
END Ripple_Adder_16bit_tb;
 
ARCHITECTURE behavior OF Ripple_Adder_16bit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component Ripple_Adder_16bit
    Port ( X : in STD_LOGIC_VECTOR (15 downto 0);
           Y : in STD_LOGIC_VECTOR (15 downto 0);
           C_in : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (15 downto 0);
           C_out : out STD_LOGIC);
end component;
    

   --Inputs
   signal X_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal Y_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal C_in_signal : STD_LOGIC;

 	--Outpzuts
   signal Z_signal : STD_LOGIC_VECTOR (15 downto 0);
   signal C_out_signal : STD_LOGIC;
   
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ripple_Adder_16bit PORT MAP (
          X => X_signal,
          Y => Y_signal,
          C_in => C_in_signal,
          Z => Z_signal,
          C_out => C_out_signal
        );

   stim_proc: process
   begin	
        
      wait for 10 ns;
      X_signal <= "0000000000000000";
      Y_signal <= "0000000000000000";
      C_in_signal <= '0';
      
      wait for 20 ns;
      
      X_signal <= "0000000000000001";
      
      wait for 20 ns;	
      
      X_signal <= "0000000000000001";
      Y_signal <= "0000000000000001";
      
      wait for 20 ns;
      	
      C_in_signal <= '1';
      
      wait for 20 ns;	
      
      
      X_signal <= "1111111111111110";
      Y_signal <= "1111111111111111";
     
      wait for 10 ns;
     
 --     wait;
   end process;

END;