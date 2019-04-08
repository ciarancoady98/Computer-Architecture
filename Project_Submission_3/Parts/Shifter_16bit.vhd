---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: Shifter_16bit
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shifter_16bit is
    Port ( B : in STD_LOGIC_VECTOR (15 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           Ir : in STD_LOGIC;
           Il : in STD_LOGIC;
           H : out STD_LOGIC_VECTOR (15 downto 0));
end Shifter_16bit;

architecture Behavioral of Shifter_16bit is

component Multiplexer_3to1_1bit
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           Z : out STD_LOGIC);
end component;

begin


    mux0: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(0),
            In1 => B(1),
            In2 => Il,
            Z => H(0)
            );
            
    mux1: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(1),
            In1 => B(2),
            In2 => B(0),
            Z => H(1)
            );
            
    mux2: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(2),
            In1 => B(3),
            In2 => B(1),
            Z => H(2)
            );
            
    mux3: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(3),
            In1 => B(4),
            In2 => B(2),
            Z => H(3)
            );

    mux4: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(4),
            In1 => B(5),
            In2 => B(3),
            Z => H(4)
            );
            
    mux5: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(5),
            In1 => B(6),
            In2 => B(4),
            Z => H(5)
            );

    mux6: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(6),
            In1 => B(7),
            In2 => B(5),
            Z => H(6)
            );

    mux7: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(7),
            In1 => B(8),
            In2 => B(6),
            Z => H(7)
            );

    mux8: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(8),
            In1 => B(9),
            In2 => B(7),
            Z => H(8)
            );

    mux9: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(9),
            In1 => B(10),
            In2 => B(8),
            Z => H(9)
            );

    mux10: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(10),
            In1 => B(11),
            In2 => B(9),
            Z => H(10)
            );

    mux11: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(11),
            In1 => B(12),
            In2 => B(10),
            Z => H(11)
            );

    mux12: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(12),
            In1 => B(13),
            In2 => B(11),
            Z => H(12)
            );

    mux13: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(13),
            In1 => B(14),
            In2 => B(12),
            Z => H(13)
            );

    mux14: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(14),
            In1 => B(15),
            In2 => B(13),
            Z => H(14)
            );

    mux15: Multiplexer_3to1_1bit
    PORT MAP(
            S0 => S(0),
            S1 => S(1),
            In0 => B(15),
            In1 => Ir,
            In2 => B(14),
            Z => H(15)
            );

end Behavioral;
