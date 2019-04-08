---------------------------------------------------------------------------------- 
-- Engineer: Ciaran Coady
-- Module Name: RegisterFile
-- Project Name: Computer Architecture
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port ( A_Address : in STD_LOGIC_VECTOR (3 downto 0);
           B_Address : in STD_LOGIC_VECTOR (3 downto 0);
           D_Address : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RW : in STD_LOGIC;
           D_Data : in STD_LOGIC_VECTOR (15 downto 0);
           A_Data : out STD_LOGIC_VECTOR (15 downto 0);
           B_Data : out STD_LOGIC_VECTOR (15 downto 0)
           );
end RegisterFile;

architecture Behavioral of RegisterFile is

    --16 bit register --
    COMPONENT Reg_16bit
    PORT ( D : in STD_LOGIC_VECTOR (15 downto 0);
           Q : out STD_LOGIC_VECTOR (15 downto 0);
           Load : in STD_LOGIC;
           Clk : in STD_LOGIC);
    END COMPONENT;

    -- 4to16 Decoder --
    COMPONENT decoder_4to16
	PORT(
		A0 : IN std_logic;
		A1 : IN std_logic;
		A2 : IN std_logic;
		A3 : IN std_logic;
		Q0 : OUT std_logic;
		Q1 : OUT std_logic;
		Q2 : OUT std_logic;
		Q3 : OUT std_logic;
		Q4 : OUT std_logic;
		Q5 : OUT std_logic;
		Q6 : OUT std_logic;
		Q7 : OUT std_logic;
		Q8 : OUT std_logic;
		Q9 : OUT std_logic;
		Q10 : OUT std_logic;
		Q11 : OUT std_logic;
		Q12 : OUT std_logic;
		Q13 : OUT std_logic;
		Q14 : OUT std_logic;
		Q15 : OUT std_logic
		);
    END COMPONENT;


    -- 16to1 multiplexer --
    COMPONENT Multiplexer_16to1
        Port ( S0 : in  STD_LOGIC;
               S1 : in  STD_LOGIC;
               S2 : in  STD_LOGIC;
               S3 : in  STD_LOGIC;
               In0 : in  STD_LOGIC_VECTOR (15 downto 0);
               In1 : in  STD_LOGIC_VECTOR (15 downto 0);
               In2 : in  STD_LOGIC_VECTOR (15 downto 0);
               In3 : in  STD_LOGIC_VECTOR (15 downto 0);
               In4 : in  STD_LOGIC_VECTOR (15 downto 0);
               In5 : in  STD_LOGIC_VECTOR (15 downto 0);
               In6 : in  STD_LOGIC_VECTOR (15 downto 0);
               In7 : in  STD_LOGIC_VECTOR (15 downto 0);
               In8 : in  STD_LOGIC_VECTOR (15 downto 0);
               In9 : in  STD_LOGIC_VECTOR (15 downto 0);
               In10 : in  STD_LOGIC_VECTOR (15 downto 0);
               In11 : in  STD_LOGIC_VECTOR (15 downto 0);
               In12 : in  STD_LOGIC_VECTOR (15 downto 0);
               In13 : in  STD_LOGIC_VECTOR (15 downto 0);
               In14 : in  STD_LOGIC_VECTOR (15 downto 0);
               In15 : in  STD_LOGIC_VECTOR (15 downto 0);
               Z : out STD_LOGIC_VECTOR (15 downto 0));
    end COMPONENT;


    -- 2to1 Multiplexer --
    COMPONENT Multiplexer_2to1
        Port ( S : in STD_LOGIC;
               In0 : in STD_LOGIC_VECTOR (15 downto 0);
               In1 : in STD_LOGIC_VECTOR (15 downto 0);
               Z : out STD_LOGIC_VECTOR (15 downto 0));
    END COMPONENT;

    --signals
    signal load_reg0 : std_logic;
    signal load_reg1 : std_logic;
    signal load_reg2 : std_logic;
    signal load_reg3 : std_logic;
    signal load_reg4 : std_logic;
    signal load_reg5 : std_logic;
    signal load_reg6 : std_logic;
    signal load_reg7 : std_logic;
    signal load_reg8 : std_logic;

    signal load_reg0_enable : std_logic;
    signal load_reg1_enable : std_logic;
    signal load_reg2_enable : std_logic;
    signal load_reg3_enable : std_logic;
    signal load_reg4_enable : std_logic;
    signal load_reg5_enable : std_logic;
    signal load_reg6_enable : std_logic;
    signal load_reg7_enable : std_logic;
    signal load_reg8_enable : std_logic;

    signal reg0_q : std_logic_vector(15 downto 0);
    signal reg1_q : std_logic_vector(15 downto 0);
    signal reg2_q : std_logic_vector(15 downto 0);
    signal reg3_q : std_logic_vector(15 downto 0);
    signal reg4_q : std_logic_vector(15 downto 0);
    signal reg5_q : std_logic_vector(15 downto 0);
    signal reg6_q : std_logic_vector(15 downto 0);
    signal reg7_q : std_logic_vector(15 downto 0);
    signal reg8_q : std_logic_vector(15 downto 0);

    signal D_Data_signal : std_logic_vector(15 downto 0);

    signal A_Data_Signal : std_logic_vector(15 downto 0);
    signal B_Data_Signal : std_logic_vector(15 downto 0);

begin
    --port maps

    --register 0
    reg00: Reg_16bit
    PORT MAP(
            D => D_Data_signal,
            load => load_reg0_enable,
            Clk => Clk,
            Q => reg0_q );

    --register 1
    reg01: Reg_16bit
    PORT MAP(
            D => D_Data_signal,
            load => load_reg1_enable,
            Clk=>Clk,
            Q => reg1_q );

   --register 2
    reg02: Reg_16bit
    PORT MAP(
            D => D_Data_signal,
            load => load_reg2_enable,
            Clk=>Clk,
            Q => reg2_q );

   --register 3
    reg03: Reg_16bit
    PORT MAP(
            D => D_Data_signal,
            load => load_reg3_enable,
            Clk=>Clk,
            Q => reg3_q );


    --register 4
    reg04: Reg_16bit
    PORT MAP(
            D => D_Data_signal,
            load => load_reg4_enable,
            Clk=>Clk,
            Q => reg4_q );


    --register 5
    reg05: Reg_16bit
    PORT MAP(
            D => D_Data_signal,
            load => load_reg5_enable,
            Clk=>Clk,
            Q => reg5_q );

    --register 6
    reg06: Reg_16bit
    PORT MAP(
            D => D_Data_signal,
            load => load_reg6_enable,
            Clk=>Clk,
            Q => reg6_q );

    --register 7
    reg07: Reg_16bit
    PORT MAP(
            D => D_Data_signal,
            load => load_reg7_enable,
            Clk=>Clk,
            Q => reg7_q );

    --instruction register
    reg8: Reg_16bit
    PORT MAP(
            D => D_Data_signal,
            load => load_reg8_enable,
            Clk=>Clk,
            Q => reg8_q );


    --Destination register decoder
    des_decoder_4to16: Decoder_4to16
    PORT MAP(
            A0 => D_Address(0),
            A1 => D_Address(1),
            A2 => D_Address(2),
            A3 => D_Address(3),
            Q0 => load_reg0,
            Q1 => load_reg1,
            Q2 => load_reg2,
            Q3 => load_reg3,
            Q4 => load_reg4,
            Q5 => load_reg5,
            Q6 => load_reg6,
            Q7 => load_reg7,
            Q8 => load_reg8,
          	Q9 => load_reg8,
          	Q10 => load_reg8,
          	Q11 => load_reg8,
          	Q12 => load_reg8,
          	Q13 => load_reg8,
          	Q14 => load_reg8,
            Q15 => load_reg8
            );


     --16 to 1 source register multiplexer
     A_inst_mux16_16bit: Multiplexer_16to1
     PORT MAP(
            In0 => reg0_q,
            In1 => reg1_q,
            In2 => reg2_q,
            In3 => reg3_q,
            In4 => reg4_q,
            In5 => reg5_q,
            In6 => reg6_q,
            In7 => reg7_q,
            In8 => reg8_q,
            In9 => reg8_q,
            In10 => reg8_q,
            In11 => reg8_q,
            In12 => reg8_q,
            In13 => reg8_q,
            In14 => reg8_q,
            In15 => reg8_q,
            S0 => A_Address(0),
            S1 => A_Address(1),
            S2 => A_Address(2),
            S3 => A_Address(3),
            Z =>A_Data_Signal
            );

     --16 to 1 source register multiplexer
     B_inst_mux16_16bit: Multiplexer_16to1
     PORT MAP(
           In0 => reg0_q,
            In1 => reg1_q,
            In2 => reg2_q,
            In3 => reg3_q,
            In4 => reg4_q,
            In5 => reg5_q,
            In6 => reg6_q,
            In7 => reg7_q,
            In8 => reg8_q,
            In9 => reg8_q,
            In10 => reg8_q,
            In11 => reg8_q,
            In12 => reg8_q,
            In13 => reg8_q,
            In14 => reg8_q,
            In15 => reg8_q,
            S0 => B_Address(0),
            S1 => B_Address(1),
            S2 => B_Address(2),
            S3 => B_Address(3),
            Z =>A_Data_Signal
            );


     D_Data_Signal <= D_Data;
     A_Data <= A_Data_Signal;
     B_Data <= B_Data_Signal;

     load_reg0_enable <= load_reg0 AND RW;
     load_reg1_enable <= load_reg1 AND RW;
     load_reg2_enable <= load_reg2 AND RW;
     load_reg3_enable <= load_reg3 AND RW;
     load_reg4_enable <= load_reg4 AND RW;
     load_reg5_enable <= load_reg5 AND RW;
     load_reg6_enable <= load_reg6 AND RW;
     load_reg7_enable <= load_reg7 AND RW;
     load_reg8_enable <= load_reg8 AND RW;

end Behavioral;
