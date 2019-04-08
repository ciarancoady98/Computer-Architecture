---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Instruction_Register
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Register is
    Port ( data_in : in  STD_LOGIC_VECTOR (15 downto 0);
           IL : in  STD_LOGIC;
			     Clk : in STD_LOGIC;
           Opcode : out  STD_LOGIC_VECTOR (6 downto 0);
           DR : out  STD_LOGIC_VECTOR (2 downto 0);
           SA : out  STD_LOGIC_VECTOR (2 downto 0);
           SB : out  STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Register;

architecture Behavioral of Instruction_Register is

	-- 16 bit Register
  COMPONENT Reg_16bit is
      Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
             Q : out STD_LOGIC_VECTOR (15 downto 0);
             Load : in STD_LOGIC;
             Clk : in STD_LOGIC);
  end COMPONENT;

signal data_out : std_logic_vector(15 downto 0);

begin

	-- Instruction Register --
	  InstructionRegister : Reg_16bit
    PORT MAP(
      		D => data_in,
      		load => IL,
      		Clk => Clk,
      		Q => data_out
          );

	Opcode<=data_out(15 downto 9);
	DR<=data_out(8 downto 6);
	SA<=data_out(5 downto 3);
	SB<=data_out(2 downto 0);

end Behavioral;
