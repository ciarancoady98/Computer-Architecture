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
    Port ( Src_s0 : in STD_LOGIC;
           Src_s1 : in STD_LOGIC;
           Src_s2 : in STD_LOGIC;
           Des_A0 : in STD_LOGIC;
           Des_A1 : in STD_LOGIC;
           Des_A2 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data_src : in STD_LOGIC;
           Data : in STD_LOGIC_VECTOR (15 downto 0);
           Reg0 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg1 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg2 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg3 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg4 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg5 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg6 : out STD_LOGIC_VECTOR (15 downto 0);
           Reg7 : out STD_LOGIC_VECTOR (15 downto 0));
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
    
    -- 2to1 multiplexer --
    COMPONENT Multiplexer_2to1 is
    PORT ( 
           S : in STD_LOGIC;
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
    
    signal reg0_q : std_logic_vector(15 downto 0); 
    signal reg1_q : std_logic_vector(15 downto 0);
    signal reg2_q : std_logic_vector(15 downto 0);
    signal reg3_q : std_logic_vector(15 downto 0);
    signal reg4_q : std_logic_vector(15 downto 0);
    signal reg5_q : std_logic_vector(15 downto 0);
    signal reg6_q : std_logic_vector(15 downto 0);
    signal reg7_q : std_logic_vector(15 downto 0);
    
    signal data_src_mux_out : std_logic_vector(15 downto 0);
    signal src_reg : std_logic_vector(15 downto 0);
    
begin
    --port maps
    
    --register 0
    reg00: Reg_16bit
    PORT MAP(
            D => data_src_mux_out,
            load => load_reg0,
            Clk => Clk,
            Q => reg0_q );
            
    --register 1
    reg01: Reg_16bit
    PORT MAP(
            D => data_src_mux_out,
            load => load_reg1,
            Clk=>Clk,
            Q => reg1_q );
            
   --register 2
    reg02: Reg_16bit
    PORT MAP(
            D => data_src_mux_out,
            load => load_reg2,
            Clk=>Clk,
            Q => reg2_q );
            
   --register 3
    reg03: Reg_16bit
    PORT MAP(
            D => data_src_mux_out,
            load => load_reg3,
            Clk=>Clk,
            Q => reg3_q );
            
            
    --register 4
    reg04: Reg_16bit
    PORT MAP(
            D => data_src_mux_out,
            load => load_reg4,
            Clk=>Clk,
            Q => reg4_q );
            
            
    --register 5
    reg05: Reg_16bit
    PORT MAP(
            D => data_src_mux_out,
            load => load_reg5,
            Clk=>Clk,
            Q => reg5_q );
            
    --register 6
    reg06: Reg_16bit
    PORT MAP(
            D => data_src_mux_out,
            load => load_reg6,
            Clk=>Clk,
            Q => reg6_q );
            
    --register 7
    reg07: Reg_16bit
    PORT MAP(
            D => data_src_mux_out,
            load => load_reg7,
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
            
     --2 to 1 Data source multiplexer 
     data_src_mux2_16bit: Multiplexer_2to1
     PORT MAP(
            In0 => data,
            In1 => src_reg,
            s => data_src,
            Z => data_src_mux_out
            );


     --4 to 1 source register multiplexer 
     inst_mux8_16bit: Multiplexer_8to1
     PORT MAP(
            In0 => reg0_q,
            In1 => reg1_q,
            In2 => reg2_q,
            In3 => reg3_q,
            In4 => reg4_q,
            In5 => reg5_q,
            In6 => reg6_q,
            In7 => reg7_q,
            S0 => src_s0,
            S1 => src_s1,
            S2 => src_s2,
            Z =>src_reg 
            );
            
     reg0 <= reg0_q;
     reg1 <= reg1_q;
     reg2 <= reg2_q;
     reg3 <= reg3_q;
     reg4 <= reg4_q;
     reg5 <= reg5_q;
     reg6 <= reg6_q;
     reg7 <= reg7_q;

end Behavioral;
