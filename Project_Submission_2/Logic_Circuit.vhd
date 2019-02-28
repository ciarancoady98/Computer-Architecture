----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2019 10:38:37
-- Design Name: 
-- Module Name: Logic_Circuit - Behavioral
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

entity Logic_Circuit is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           G : out STD_LOGIC_VECTOR (15 downto 0));
end Logic_Circuit;

architecture Behavioral of Logic_Circuit is

component Logic_Circuit_Bitslice
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Z : out STD_LOGIC);
end component;

begin

Bit0 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(0),
        B => B(0),
        Z => G(0),
        S0 => S0,
        S1 => S1
        );
        
Bit1 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(1),
        B => B(1),
        Z => G(1),
        S0 => S0,
        S1 => S1
        );
        
Bit2 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(2),
        B => B(2),
        Z => G(2),
        S0 => S0,
        S1 => S1
        );
        
Bit3 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(3),
        B => B(3),
        Z => G(3),
        S0 => S0,
        S1 => S1
        );

Bit4 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(4),
        B => B(4),
        Z => G(4),
        S0 => S0,
        S1 => S1
        );
        
Bit5 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(5),
        B => B(5),
        Z => G(5),
        S0 => S0,
        S1 => S1
        );
        
Bit6 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(6),
        B => B(6),
        Z => G(6),
        S0 => S0,
        S1 => S1
        );
        
Bit7 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(7),
        B => B(7),
        Z => G(7),
        S0 => S0,
        S1 => S1
        );
        
Bit8 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(8),
        B => B(8),
        Z => G(8),
        S0 => S0,
        S1 => S1
        );
        
Bit9 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(9),
        B => B(9),
        Z => G(9),
        S0 => S0,
        S1 => S1
        );
        
Bit10 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(10),
        B => B(10),
        Z => G(10),
        S0 => S0,
        S1 => S1
        );
        
Bit11 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(11),
        B => B(11),
        Z => G(11),
        S0 => S0,
        S1 => S1
        );
        
Bit12 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(12),
        B => B(12),
        Z => G(12),
        S0 => S0,
        S1 => S1
        );
        
Bit13 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(13),
        B => B(13),
        Z => G(13),
        S0 => S0,
        S1 => S1
        );
        
Bit14 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(14),
        B => B(14),
        Z => G(14),
        S0 => S0,
        S1 => S1
        );
        
Bit15 : Logic_Circuit_Bitslice
       PORT MAP(
        A => A(15),
        B => B(15),
        Z => G(15),
        S0 => S0,
        S1 => S1
        );

end Behavioral;
