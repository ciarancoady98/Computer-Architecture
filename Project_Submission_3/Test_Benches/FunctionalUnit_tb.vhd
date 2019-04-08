---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Functional_Unit_tb
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Functional_Unit_tb IS
END Functional_Unit_tb;
 
ARCHITECTURE behavior OF Functional_Unit_tb is
 
    -- Component Declaration for the Unit Under Test (UUT)
    component Functional_Unit
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           FS : in STD_LOGIC_VECTOR (4 downto 0);
           V : out STD_LOGIC;
           C : out STD_LOGIC;
           N : out STD_LOGIC;
           Z : out STD_LOGIC;
           F : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    

   --Inputs
   signal A_signal : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
   signal B_signal : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
   signal FS_signal : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
 
 	--Outputs
   
   signal V_signal : std_logic;
   signal C_signal : std_logic;
   signal N_signal : std_logic;
   signal Z_signal : std_logic;
   signal F_signal : std_logic_vector(15 downto 0);
 
    constant Clk_period : time := 120 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Functional_Unit PORT MAP (
          A => A_signal,
          B => B_signal,
          FS => FS_signal,
          V => V_signal,
          C => C_signal,
          N => N_signal,
          Z => Z_signal,
          F => F_signal
        );

-- begin process
stim_proc : process
begin
A_signal <= "0101010101010101";
B_signal <= "0101010101010101";


FS_signal <= "00000";
wait for clk_period;
    -- F = A
    --result = 0x5555

FS_signal <= "00001";
wait for clk_period;
-- F  =A + 1 
-- result = 0x5556

FS_signal <= "00010";
wait for clk_period;
-- F = 0xFFFF
--flags N = 1

FS_signal <= "00011";
wait for clk_period;
-- F = A + B + 1
-- result = 0xAAAB


A_signal <= "1010101010101010";
B_signal <= "1010101010101010";

FS_signal <= "00100";
wait for clk_period;
-- F = A + !B
--result = 0x5554
-- flags V=1, C=1

FS_signal <= "00101";
wait for clk_period;
-- F = A + !B +1
--result = 0x5555
-- flags V=1, C=1

FS_signal <= "00110";
wait for clk_period;
-- F = A + 0xFFFF
--result = 0xAAA9
-- flags C=1, N=1

FS_signal <= "00111";
wait for clk_period;
-- F = A + 0xFFFF + 1
--result = 0xAAAA
-- flags C=1, N=1



FS_signal <= "01000";
wait for clk_period;
-- F = A&B 
--result = 0x0000
-- N=0, Z=1

FS_signal <= "01010";
wait for clk_period;
-- F= A|B
--result = 0xFFFF
-- N=1, Z=0

FS_signal <= "01100";
wait for clk_period;
-- F = A^B 
--result = 0xFFFF
-- flags N=1

FS_signal <= "01110";
wait for clk_period;
-- F = not A
-- result = 0x5555

FS_signal <= "10000";
wait for clk_period;
-- F = B
--result = 0x5555

FS_signal <= "10100";
wait for clk_period;
-- F = srB
--result = 0x2AAA

FS_signal <= "11000";
wait for clk_period;
-- F = slB
-- result = 0xAAAA
-- flags N=1

end process; 



END;