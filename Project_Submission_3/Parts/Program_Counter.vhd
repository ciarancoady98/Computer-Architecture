---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Program_Counter
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    Port (
           Input : in  STD_LOGIC_VECTOR (15 downto 0);
		   Reset : in STD_LOGIC;
           PL : in  STD_LOGIC;
           PI : in  STD_LOGIC;
           Clk : in STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

  -- Adder--
  COMPONENT Ripple_Adder_16bit
      Port ( X : in STD_LOGIC_VECTOR (15 downto 0);
             Y : in STD_LOGIC_VECTOR (15 downto 0);
             C_in : in STD_LOGIC;
             Z : out STD_LOGIC_VECTOR (15 downto 0);
             C_out : out STD_LOGIC);
  end COMPONENT;

	-- Register --
  COMPONENT Reg_16bit
      Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
             Q : out STD_LOGIC_VECTOR (15 downto 0);
             Load : in STD_LOGIC;
             Clk : in STD_LOGIC);
  end COMPONENT;

signal load_result : std_logic_vector(15 downto 0);
signal incremented_signal : std_logic_vector(15 downto 0);
signal next_value : std_logic_vector (15 downto 0);
signal last_value : std_logic_vector (15 downto 0);
signal load_signal : std_logic;

begin

-- ripple_adder_16bit
load: ripple_adder_16bit PORT MAP(
	X => last_value,
	Y(15 downto 0) => Input,
	C_in => '0',
	Z => load_result
);

-- ripple_adder_16bit
increment: ripple_adder_16bit PORT MAP(
	X => last_value,
	Y => x"0001",
	C_in => '0',
	Z => incremented_signal
);

-- register
reg: Reg_16bit PORT MAP(
	D => next_value,
	load => load_signal,
	Clk => Clk,
	Q => last_value
);

--if reset is 1 output 0, if pi is 1 increment, if pl is 1 load, otherwise just output 0
	next_value <= x"0000" when reset='1' else incremented_signal when PI='1' else load_result when PL='1' else x"0000";
	Output <= last_value;
	load_signal <= (PI or PL or reset);

end Behavioral;
