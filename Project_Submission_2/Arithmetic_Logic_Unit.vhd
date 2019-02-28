----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2019 12:35:20
-- Design Name: 
-- Module Name: Arithmetic_Logic_Unit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Arithmetic_Logic_Unit is
    Port ( C_in : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           G : out STD_LOGIC_VECTOR (15 downto 0);
           C_out : out STD_LOGIC);
end Arithmetic_Logic_Unit;

architecture Behavioral of Arithmetic_Logic_Unit is

component Arithmetic_Circuit
    Port ( C_In : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           G : out STD_LOGIC_VECTOR (15 downto 0);
           C_Out : out STD_LOGIC);
end component;

component Logic_Circuit
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           G : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Multiplexer_2to1 is
    Port ( S : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           Z : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal arithmetic_output : std_logic_vector(15 downto 0); 
signal logic_output : std_logic_vector(15 downto 0); 

begin

arithmetic_unit : Arithmetic_Circuit
       PORT MAP(
           C_in => C_in,
           A => A,
           B => B,
           S0 => S0,
           S1 => S1,
           C_out => C_out,
           G => arithmetic_output
        );
        
logic_unit : Logic_Circuit
       PORT MAP(
           A => A,
           B => B,
           S0 => S0,
           S1 => S1,
           G => logic_output
        );
        
mux : Multiplexer_2to1
        PORT MAP(
            S => S2,
            In0 => arithmetic_output,
            In1 => logic_output,
            Z => G
         );       

end Behavioral;
