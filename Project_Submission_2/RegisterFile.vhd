-- Ciaran Coady --


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
    Port ( A_Src_s0 : in STD_LOGIC;
           A_Src_s1 : in STD_LOGIC;
           A_Src_s2 : in STD_LOGIC;
           B_Src_s0 : in STD_LOGIC;
           B_Src_s1 : in STD_LOGIC;
           B_Src_s2 : in STD_LOGIC;
           Des_A0 : in STD_LOGIC;
           Des_A1 : in STD_LOGIC;
           Des_A2 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Write : in STD_LOGIC;
           Data : in STD_LOGIC_VECTOR (15 downto 0);
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
    
    -- 3to8 Decoder --
    COMPONENT Decoder_3to8 is
    PORT ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC);
    END COMPONENT;
    
    
    -- 8to1 multiplexer --
    COMPONENT Multiplexer_8to1 is
    PORT ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           In0 : in STD_LOGIC_VECTOR (15 downto 0);
           In1 : in STD_LOGIC_VECTOR (15 downto 0);
           In2 : in STD_LOGIC_VECTOR (15 downto 0);
           In3 : in STD_LOGIC_VECTOR (15 downto 0);
           In4 : in STD_LOGIC_VECTOR (15 downto 0);
           In5 : in STD_LOGIC_VECTOR (15 downto 0);
           In6 : in STD_LOGIC_VECTOR (15 downto 0);
           In7 : in STD_LOGIC_VECTOR (15 downto 0);
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
    
    signal load_reg0_enable : std_logic;
    signal load_reg1_enable : std_logic; 
    signal load_reg2_enable : std_logic; 
    signal load_reg3_enable : std_logic; 
    signal load_reg4_enable : std_logic; 
    signal load_reg5_enable : std_logic; 
    signal load_reg6_enable : std_logic;
    signal load_reg7_enable : std_logic;
    
    signal reg0_q : std_logic_vector(15 downto 0); 
    signal reg1_q : std_logic_vector(15 downto 0);
    signal reg2_q : std_logic_vector(15 downto 0);
    signal reg3_q : std_logic_vector(15 downto 0);
    signal reg4_q : std_logic_vector(15 downto 0);
    signal reg5_q : std_logic_vector(15 downto 0);
    signal reg6_q : std_logic_vector(15 downto 0);
    signal reg7_q : std_logic_vector(15 downto 0);
    
    signal Data_signal : std_logic_vector(15 downto 0);
    
    signal A_Data_Signal : std_logic_vector(15 downto 0);
    signal B_Data_Signal : std_logic_vector(15 downto 0);
    
begin
    --port maps
    
    --register 0
    reg00: Reg_16bit
    PORT MAP(
            D => Data_signal,
            load => load_reg0_enable,
            Clk => Clk,
            Q => reg0_q );
            
    --register 1
    reg01: Reg_16bit
    PORT MAP(
            D => Data_signal,
            load => load_reg1_enable,
            Clk=>Clk,
            Q => reg1_q );
            
   --register 2
    reg02: Reg_16bit
    PORT MAP(
            D => Data_signal,
            load => load_reg2_enable,
            Clk=>Clk,
            Q => reg2_q );
            
   --register 3
    reg03: Reg_16bit
    PORT MAP(
            D => Data_signal,
            load => load_reg3_enable,
            Clk=>Clk,
            Q => reg3_q );
            
            
    --register 4
    reg04: Reg_16bit
    PORT MAP(
            D => Data_signal,
            load => load_reg4_enable,
            Clk=>Clk,
            Q => reg4_q );
            
            
    --register 5
    reg05: Reg_16bit
    PORT MAP(
            D => Data_signal,
            load => load_reg5_enable,
            Clk=>Clk,
            Q => reg5_q );
            
    --register 6
    reg06: Reg_16bit
    PORT MAP(
            D => Data_signal,
            load => load_reg6_enable,
            Clk=>Clk,
            Q => reg6_q );
            
    --register 7
    reg07: Reg_16bit
    PORT MAP(
            D => Data_signal,
            load => load_reg7_enable,
            Clk=>Clk,
            Q => reg7_q );
            
            
    --Destination register decoder
    des_decoder_3to8: Decoder_3to8
    PORT MAP(
            A0 => des_A0,
            A1 => des_A1,
            A2 => des_A2,
            Q0 => load_reg0,
            Q1 => load_reg1,
            Q2 => load_reg2,
            Q3 => load_reg3,
            Q4 => load_reg4,
            Q5 => load_reg5,
            Q6 => load_reg6,
            Q7 => load_reg7
            );


     --8 to 1 source register multiplexer 
     A_inst_mux8_16bit: Multiplexer_8to1
     PORT MAP(
            In0 => reg0_q,
            In1 => reg1_q,
            In2 => reg2_q,
            In3 => reg3_q,
            In4 => reg4_q,
            In5 => reg5_q,
            In6 => reg6_q,
            In7 => reg7_q,
            S0 => A_src_s0,
            S1 => A_src_s1,
            S2 => A_src_s2,
            Z =>A_Data_Signal
            );
            
     --8 to 1 source register multiplexer 
     B_inst_mux8_16bit: Multiplexer_8to1
     PORT MAP(
            In0 => reg0_q,
            In1 => reg1_q,
            In2 => reg2_q,
            In3 => reg3_q,
            In4 => reg4_q,
            In5 => reg5_q,
            In6 => reg6_q,
            In7 => reg7_q,
            S0 => B_src_s0,
            S1 => B_src_s1,
            S2 => B_src_s2,
            Z =>B_Data_Signal
            );
            
            
     Data_Signal <= Data;
     A_Data <= A_Data_Signal;
     B_Data <= B_Data_Signal;
     
     load_reg0_enable <= load_reg0 AND Write;
     load_reg1_enable <= load_reg1 AND Write;
     load_reg2_enable <= load_reg2 AND Write;
     load_reg3_enable <= load_reg3 AND Write;
     load_reg4_enable <= load_reg4 AND Write;
     load_reg5_enable <= load_reg5 AND Write;
     load_reg6_enable <= load_reg6 AND Write;
     load_reg7_enable <= load_reg7 AND Write;
     

end Behavioral;
