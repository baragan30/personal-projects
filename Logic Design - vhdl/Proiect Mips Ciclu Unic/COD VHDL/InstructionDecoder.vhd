library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use	ieee.std_logic_unsigned.all;  
use ieee.std_logic_arith.all;

entity InstructionDecoder is
    Port ( 
           clk : in STD_LOGIC;
           RegWrite : in std_logic;
           Instr : in STD_LOGIC_vector(12 downto 0);
           RegDst : in STD_LOGIC;
           ExtOp : in STD_LOGIC;
           WD : in STD_LOGIC_VECTOR(15 downto 0);
           RD1 : out STD_LOGIC_vector(15 downto 0) ;
           RD2 : out STD_LOGIC_vector(15 downto 0);
           ExtImm : out STD_LOGIC_vector(15 downto 0);
           sa : out STD_LOGIC);
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is
component RegFile is
	 port(
		 clk : in STD_LOGIC;
		 enableW : in STD_LOGIC;
		 RA1 : in STD_LOGIC_VECTOR(2 downto 0);
		 Ra2 : in STD_LOGIC_VECTOR(2 downto 0);
		 WA : in STD_LOGIC_VECTOR(2 downto 0);
		 WD : in STD_LOGIC_VECTOR(15 downto 0);
		 RD1 : out STD_LOGIC_VECTOR(15 downto 0);
		 RD2 : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end component;
signal WA :STD_LOGIC_VECTOR(2 downto 0);

begin
    sa <= Instr(3);
    WA <= Instr(9 downto 7) when RegDst = '0' else
           Instr(6 downto 4);
    G1 : RegFile port map(clk,RegWrite,instr(12 downto 10),Instr(9 downto 7),
                            WA,WD,RD1,RD2);
                            
     --ExtUnit  
	 ExtImm(6 downto 0) <= instr(6 downto 0);
	 ExtIMM(15 downto 7) <= "111111111" when( ExtOp ='1' and instr(6) = '1' ) else
							 "000000000" ;
                                              
   
    -- End ExtUnit                      
     
                            
    
                            
                            
                            
                            
                            

end Behavioral;
