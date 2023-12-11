library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainCrontroller is
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
end MainCrontroller;

architecture Behavioral of MainCrontroller is
signal R : std_logic ;
signal addi : std_logic ;
signal lw : std_logic ;
signal sw : std_logic ;
signal beq : std_logic ;
signal subi : std_logic ;
signal bsez : std_logic ;
signal j : std_logic ;

begin
    R <= (not opcode(2)) and (not opcode(1)) and (not opcode(0));
    addi <= (not opcode(2)) and (not opcode(1)) and ( opcode(0));
    lw <= (not opcode(2)) and ( opcode(1)) and (not opcode(0));
    sw <= (not opcode(2)) and ( opcode(1)) and ( opcode(0));
    beq <= ( opcode(2)) and (not opcode(1)) and (not opcode(0));
    subi <= ( opcode(2)) and (not opcode(1)) and ( opcode(0));
    bsez <= ( opcode(2)) and ( opcode(1)) and (not opcode(0));
    j <= ( opcode(2)) and ( opcode(1)) and ( opcode(0));
    
    RegDST <=  R;
    RegW  <=  R or addi or lw or subi;
    AlluSrc <= addi or lw or sw or subi;
    ExtOp <=   lw or sw or beq  or bsez;
    AlluOp(1) <= beq or subi or bsez;
    AlluOP(0) <= R;
    MemWrite <= sw;
    MemToReg <= lw;
    Branch <= beq;
    jump <= j;
    BranchSez <= bsez;
end Behavioral;
