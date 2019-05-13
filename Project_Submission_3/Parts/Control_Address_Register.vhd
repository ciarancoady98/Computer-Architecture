---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Control_Address_Register
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Address_Register is
    Port ( Data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Control : in  STD_LOGIC;
		   Clk : in STD_LOGIC;
		   Reset : in STD_LOGIC;
           Data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end Control_Address_Register;


architecture Behavioral of Control_Address_Register is

    --Ripple Adder
	COMPONENT Ripple_Adder_16bit
	PORT(
	   X : in STD_LOGIC_VECTOR (15 downto 0);
       Y : in STD_LOGIC_VECTOR (15 downto 0);
       C_in : in STD_LOGIC;
       Z : out STD_LOGIC_VECTOR (15 downto 0);
       C_out : out STD_LOGIC);
	END COMPONENT;

	-- 16 bit Register
	COMPONENT Reg_16bit
	PORT(
		D : IN std_logic_vector(15 downto 0);
		load : IN std_logic;
		Clk : IN std_logic;
		Q : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

signal incremented : std_logic_vector(7 downto 0);
signal Current_Instruction : std_logic_vector (15 downto 0);
signal toRegister : std_logic_vector (15 downto 0);
signal leftover : std_logic_vector(7 downto 0);

begin

	-- ripple_adder_16bit
	rippleAdder: Ripple_Adder_16bit 
	PORT MAP(
		X(7 downto 0) => Current_Instruction(7 downto 0),
		X(15 downto 8) => x"00",
		Y => x"0001",
		C_in => '0',
		Z(7 downto 0) => incremented,
		Z(15 downto 8) => leftover
	);

	-- 16 bit register
	reg16: Reg_16bit PORT MAP(
		D => toRegister,
		load => '1',
		Clk => Clk,
		Q => Current_Instruction
		);

--load the first address when reset is pressed
toRegister(7 downto 0) <= x"00" when reset='1' else Data_in when Control = '1' else incremented;
--But the incremented instruction into the register if control is set to 1
--toRegister(7 downto 0) <= Data_in when Control = '1' else incremented;
--fill in extra bits
toRegister(15 downto 8) <= x"00";
--output the Current instruction
Data_out <= Current_Instruction(7 downto 0);
end Behavioral;
