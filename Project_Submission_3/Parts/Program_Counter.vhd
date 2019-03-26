-- Ciaran Coady --

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    Port (
           Extend : in  STD_LOGIC_VECTOR (15 downto 0);
			     Reset : in STD_LOGIC;
           PL : in  STD_LOGIC;
           PI : in  STD_LOGIC;
           Clk : in STD_LOGIC;
           PC_out : out  STD_LOGIC_VECTOR (15 downto 0));
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


signal pi_or_pl_or_reset : std_logic;
signal load_result : std_logic_vector(15 downto 0);
signal increment_result : std_logic_vector(15 downto 0);
signal next_PC : std_logic_vector (15 downto 0);
signal last_PC : std_logic_vector (15 downto 0);

begin

-- ripple_adder_16bit
adderLoad: ripple_adder_16bit PORT MAP(
	A => last_pc,
	B(15 downto 0) => Extend,
	Cin => '0',
	S => load_result
);

-- ripple_adder_16bit
adderIncrement: ripple_adder_16bit PORT MAP(
	A => last_PC,
	B => x"0001",
	Cin => '0',
	S => increment_result
);

-- register
reg: reg16 PORT MAP(
	D => next_PC,
	load => pi_or_pl_or_reset,
	Clk => Clk,
	Q => last_PC
);

	next_PC <= x"0000" when reset='1' else increment_result when PI='1' else
					load_result when PL='1' else x"0000";
	PC_out <= last_PC;
	pi_or_pl_or_reset <= (PI or PL or reset);

end Behavioral;
