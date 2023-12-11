
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MicroProcesorTester is
	port(
		clk : in STD_LOGIC;   
		okb : in STD_LOGIC; 
		 sw:in std_logic_vector(7 downto 0);
		 resetb:in std_logic;
		 cat: out std_logic_vector(6 downto 0);
		 an : out std_logic_vector(3 downto 0);	
		 led :out std_logic_vector(10 downto 0));
end MicroProcesorTester;	   




architecture MicroProcesorTester of MicroProcesorTester is 
	
	
	component SevenSegments is
	port(
		 clk : in STD_LOGIC ;
		 digit1: in std_logic_vector(3 downto 0);
		 digit2: in std_logic_vector(3 downto 0);
		 digit3: in std_logic_vector(3 downto 0);
		 digit4: in std_logic_vector(3 downto 0); 
		 CatOut: out std_logic_vector(6 downto 0);
		 an : out std_logic_vector(0 to 3)
		  );
	end component; 
	
	component GeneratorMonoimpuls is
    Port ( 
           clk: in std_logic;
           btn: in std_logic:='0';
           y: out std_logic:='0');
	end component; 	  
	
	component AdressController is
	 port(
		 clk : in STD_LOGIC;
		 ok :in std_logic;
		 reset:in std_logic;
		 jump : in STD_LOGIC;
		 PCSrc : in STD_LOGIC;
		 branchA : in STD_LOGIC_VECTOR(15 downto 0):= x"0000";
		 jumpA : in  STD_LOGIC_VECTOR(15 downto 0):= x"0000";
		 instruction : inout STD_LOGIC_VECTOR(15 downto 0):=x"0000";
		 curAdress : inout STD_LOGIC_VECTOR(15 downto 0):= x"0000";
		 pcplus1 : inout STD_LOGIC_VECTOR(15 downto 0):= x"0000"
	     );
	end component;
	
	component MainCrontroller is
    Port ( opcode : in std_logic_vector(2 downto 0);
           EXTOP : out STD_LOGIC;
           RegDst : out std_logic;
           REGW : out std_logic;
           ALLUSRC : out STD_LOGIC;
           BRANCH : out STD_LOGIC;
           JUMP : out STD_LOGIC;
           ALLUOP : out STD_LOGIC_Vector(1 downto 0);
           MEMWRITE : out STD_LOGIC;
           MEMTOREG : out STD_LOGIC;
           BRANCHSEZ : out STD_LOGIC);
    end component;
    
    component InstructionDecoder is
    Port ( 
          clk : in STD_LOGIC;
           RegWrite : in std_logic;
           Instr : in STD_LOGIC_vector(12 downto 0);
           RegDst : in STD_LOGIC;
           ExtOp : in STD_LOGIC;	
		   WA :in std_logic_vector(2 downto 0);
           WD : in STD_LOGIC_VECTOR(15 downto 0);
           RD1 : out STD_LOGIC_vector(15 downto 0) ;
           RD2 : out STD_LOGIC_vector(15 downto 0);
           ExtImm : out STD_LOGIC_vector(15 downto 0);
           sa : out STD_LOGIC);
    end component;
    
    component ExecutionUnit is
       Port (
           RD1 : in STD_LOGIC_VECTOR(15 downto 0);
           RD2 : in STD_LOGIC_VECTOR(15 downto 0);
           Ext_Imm : in STD_LOGIC_VECTOR(15 downto 0);
           func : in STD_LOGIC_VECTOR(2 downto 0);
           sa : in STD_LOGIC;
           ALUSrc : in STD_LOGIC;
           ALUOp : in STD_LOGIC_VECTOR(1 downto 0);
           ALURes : inout STD_LOGIC_VECTOR(15 downto 0);
           Zero : inout STD_LOGIC;
           SEZ : out STD_LOGIC);
end component;

component RAM is
	 port(
		 clk : in STD_LOGIC;
		 enableW : in STD_LOGIC;
		 Adress : in STD_LOGIC_VECTOR(6 downto 0);
		 WD : in STD_LOGIC_VECTOR(15 downto 0);
		 RD : out STD_LOGIC_VECTOR(15 downto 0) );
end component;

component clock02sec
	port (
	clockin :in std_logic;
	clockout :inout std_logic
	);
end component;

--Instruction Decoder signals

signal WD :  STD_LOGIC_VECTOR(15 downto 0);
signal RD1 :  STD_LOGIC_vector(15 downto 0) ;
signal RD2 :  STD_LOGIC_vector(15 downto 0);
signal ExtImm :  STD_LOGIC_vector(15 downto 0);	 
signal sa :  STD_LOGIC;
signal func:std_logic_vector(2 downto 0);
   

-- Adress Controller
signal instructions : STD_LOGIC_VECTOR(15 downto 0):= x"0000";
signal pcplus1 : STD_LOGIC_VECTOR(15 downto 0) := x"0000" ;  
signal curAdress : STD_LOGIC_VECTOR(15 downto 0) := x"0000" ;
signal branchA : STD_LOGIC_VECTOR(15 downto 0):=x"0000"; 
signal jumpA : STD_LOGIC_VECTOR(15 downto 0):=x"0000";

-- Main Controller signals 
signal EXTOP : STD_LOGIC:='0';
signal RegDst : std_logic:='0';
signal REGW : std_logic:='0';
signal ALLUSRC : STD_LOGIC:='0';
signal BRANCH : STD_LOGIC:='0';
signal JUMP : STD_LOGIC:='0';
signal ALLUOP : STD_LOGIC_Vector(1 downto 0):="00";
signal MEMWRITE : STD_LOGIC:='0';
signal MEMTOREG : STD_LOGIC:='0';
signal BRANCHSEZ : STD_LOGIC:='0';

-- End Main Controller	

-- Execute Unit signals
signal AluRes :  STD_LOGIC_VECTOR(15 downto 0) := x"0000";
signal ZeroFlag : std_logic := '0';
signal SEZFlag : std_logic := '0';

-- Ram signals
signal RamData : std_logic_vector(15 downto 0);

--Tester signals
signal PCSRC :std_logic;
signal output :	STD_LOGIC_VECTOR(15 downto 0);
signal ok :std_logic;
signal ok1,clk05,ok2 :std_logic;
signal reset:std_logic;	 
signal WA : STD_LOGIC_VECTOR(2 downto 0);

--REG IF
signal pcplus1RegIF : std_logic_vector(15 downto 0);
signal instructionsRegIF : STD_LOGIC_VECTOR(15 downto 0):= x"0000";	

-- REG ID	   
signal WARegID :std_logic_vector(2 downto 0); 
signal funcRegID : std_logic_vector(2 downto 0);
signal ExtImmRegId :  STD_LOGIC_vector(15 downto 0):= x"0000";
signal RD1RegID :  STD_LOGIC_vector(15 downto 0):= x"0000" ;
signal RD2RegID :  STD_LOGIC_vector(15 downto 0):= x"0000";
signal pcplus1RegID : std_logic_vector(15 downto 0); 
signal EXRegID : std_logic_vector(2 downto 0):="000"; 
signal MRegID : std_logic_vector(2 downto 0):="000"; 
signal WBRegID : std_logic_vector(1 downto 0):="00"; 
signal saRegID : std_logic:='0';

--Reg Ex
signal WARegEx :std_logic_vector(2 downto 0); 
signal RD2RegEx :  STD_LOGIC_vector(15 downto 0):= x"0000";
signal AluResRegEx :  STD_LOGIC_VECTOR(15 downto 0) := x"0000";
signal AluFlegsEx :std_logic_vector(1 downto 0);
signal BranchAdressRegEx : std_logic_vector(15 downto 0);
signal MRegEx  : std_logic_vector(2 downto 0);  
signal WBRegEx : std_logic_vector(1 downto 0):="00"; 

--Reg Mem
 signal WARegMem :std_logic_vector(2 downto 0); 
signal AluResRegMem :  STD_LOGIC_VECTOR(15 downto 0) := x"0000";
signal RD2RegMem :  STD_LOGIC_vector(15 downto 0);
signal RAMDataRegMem :  STD_LOGIC_vector(15 downto 0);  
signal WBRegMem : std_logic_vector(1 downto 0):="00"; 




begin	
	
	func <=  instructionsRegIF(2 downto 0) ;  
	
	WA <= instructionsRegIF(9 downto 7) when RegDst = '0' else
		instructionsRegIF(6 downto 4);	
		
	BranchA <= pcplus1RegID + ExtImmRegID;
	jumpA <= pcplus1RegIF(15 downto 13) & InstructionsRegIf(12 downto 0);
	
	--REG IF
	process(clk) 
	begin
		if(rising_edge(clk)) then 
			pcplus1RegIF <= pcplus1 ;
			instructionsRegIF <= instructions;
			
		end if ;
	end process;  
	
	-- RegID
	process(clk) 
	begin
		if(rising_edge(clk)) then  
			WARegID <= WA  ;
			funcRegID <=  func;
			ExtImmRegId<= ExtImm;
			RD1RegId <=RD1;
			RD2RegId <=RD2;
			pcplus1RegID <= pcplus1RegIF; 
			ExRegId <= AlluOp &  AlluSRC;
			MRegID <= MemWrite & BranchSez & Branch;
			WBRegID <= MemToReg & RegW;	
			saRegId <= sa;
			
		end if ;
	end process; 
	 	
	
	--REG EX
	process(clk) 
	begin
		if(rising_edge(clk)) then 
			WARegEx <= WARegID  ;
			RD2RegEx <= RD2RegId;
			ALuResRegEx <= AluRes;
			AluFlegsEx <=  SezFlag & ZeroFlag;
			BranchAdressRegEx <= BranchA;
			MRegEx <= MRegID; 
			WbRegEx <= WbRegID;
		end if ;
	end process;   
	
	--REG Mem
	process(clk) 
	begin
		if(rising_edge(clk)) then 
			WARegMem <= WARegEx;
			RD2RegMem <= RD2RegEx;
			ALuResRegMem <= AluResRegEx;
			RamDataRegMem <= RAMData ;
			WbRegMem <= WbRegEX;
		end if ;
	end process;
	
	
	


-- 	G21 : clock02sec port map(clk,clk05); 
	
	G1 : GeneratorMonoimpuls port map(clk,okb,ok);	
	
	G2 : GeneratorMonoimpuls port map(clk,resetb,reset);
	
	G3 : SevenSegments port map(clk,output(15 downto 12),output(11 downto 8),
									output(7 downto  4),output (3 downto 0),
									cat ,an);	--output			
	
	G4 : AdressController port map (clk,ok,reset,jump,PCSRC,BranchAdressRegEx,jumpA,instructions,curAdress,pcplus1);								
	 
	
	G5:MainCrontroller port map ( instructionsRegIf(15 downto 13),EXTOP,RegDst,REGW,ALLUSRC,BRANCH,JUMP 
                                    ,ALLUOP,MEMWRITE ,MEMTOREG ,BRANCHSEZ);
                                    
    G6: InstructionDecoder port map (clk,WbRegMem(0),InstructionsRegIf(12 downto 0),RegDst,EXTOP,WARegMem,WD,RD1,RD2
                                        ,ExtImm,sa);
                                        
    G7 :ExecutionUnit port map(RD1RegId,RD2RegID,ExtImmRegID,funcRegID,
								saRegId,ExRegID(0),ExRegID(2 downto 1),AluRes,ZeroFlag,SezFlag);
    
    G8 : RAM port map (clk,MRegEx(2),AluResRegEX(6 downto 0),RD2RegEx,RamData);
    
    WD <= AluResRegMem when WbRegMem(1) = '0' else 
          RamDataRegMem;
          
    PcSRC <=((MRegEx(0) and AluFlegsEx(0)) or (MRegEx(1) and AluFlegsEx(1)));
    
    output <= instructions when 	sw(7 downto 5) = "000" else 
              curAdress    when 	sw(7 downto 5) = "001" else 
              RD1    when 	sw(7 downto 5) = "010"  else 
              Rd2    when 	sw(7 downto 5) = "011"  else 
              ExtImm when sw(7 downto 5) = "100" else 
              AluRes     when 	sw(7 downto 5) = "101"  else 
              RamData     when 	sw(7 downto 5) = "110"  else 
	          WD;
	           
     

    -- ld Assigment
    led(0) <= EXTOP ;
    led(1) <= RegDst ;
    led(2) <= REGW;
    led(3) <= ALLUSRC;
    led(4) <= BRANCH;
    led(5) <= JUMP;
    led(6) <= ALLUOP(0) ;
    led(7) <= ALLUOP(1) ;
    led(8) <= MEMWRITE;
    led(9) <= MEMTOREG;
    led(10) <= BRANCHSEZ ;

end MicroProcesorTester;
