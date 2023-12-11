library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.ALL;


entity ExecutionUnit is
Port ( 
           RD1 : in STD_LOGIC_VECTOR(15 downto 0):= x"0000";
           RD2 : in STD_LOGIC_VECTOR(15 downto 0):= x"0000";
           Ext_Imm : in STD_LOGIC_VECTOR(15 downto 0);
           func : in STD_LOGIC_VECTOR(2 downto 0);
           sa : in STD_LOGIC;
           ALUSrc : in STD_LOGIC;
           ALUOp : in STD_LOGIC_VECTOR(1 downto 0):="00";
           ALURes : inout STD_LOGIC_VECTOR(15 downto 0):= x"0000";
           Zero : inout STD_LOGIC;
           SEZ : out STD_LOGIC);
end ExecutionUnit;

architecture Behavioral of ExecutionUnit is
signal ALUIn2 : STD_LOGIC_VECTOR(15 downto 0);
signal ALUCtrl : STD_LOGIC_VECTOR(2 downto 0);
begin
    AluIn2 <= RD2 when ALUSRC = '0' else 
               EXT_IMM;        
    -- ALU Control
    process(ALUOp, func)
    begin
        case ALUOp is
            when "01" =>
                case func is
                    when "000" => ALUCtrl <= "000";
                    when "001" => ALUCtrl <= "001";
                    when "010" => ALUCtrl <= "010";
                    when "011" => ALUCtrl <= "011";
                    when "100" => ALUCtrl <= "100";
                    when "101" => ALUCtrl <= "101";
                    when "110" => ALUCtrl <= "110";
                    when "111" => ALUCtrl <= "111";
                    when others => ALUCtrl <= (others => '0'); -- unknown
                end case;
            when "00" => ALUCtrl <= "000";
            when "10" => ALUCtrl <= "001";
            when others => ALUCtrl <= (others => '0'); -- unknown
        end case;
    end process;
    
    -- ALU Calculator
    process(ALUCtrl, RD1, AluIn2, sa)
    begin
        case ALUCtrl  is
            when "000" =>
                ALURes <= RD1 + ALUIn2;
            when "001" =>
                ALURes <= RD1 + (not AluIn2) + 1;                                    
            when "010" =>
                case sa is
                    when '0' => ALURes<= RD1(14 downto 0) & "0";
                    when others=> ALURes <= RD1(15) & RD1(13 downto 0) & "0";
                 end case;
            when "011" =>
                case sa is
                    when '0' => ALURes<= "0" & RD1(15 downto 1);
                    when others => ALURes <= RD1(15) & RD1(15 downto 1);
                end case;
            when "100" =>
                ALURes<=RD1 and ALUIn2;		
            when "101" =>
                ALURes<=RD1 or ALUIn2; 
            when "110" =>
                ALURes <=RD1 xor ALUIn2;		
            when others =>
                ALURES <= not RD1;           
        end case;
    
    end process;
    
    --ALu Flags
    Zero <= '1' when ALURES = X"0000"else
            '0';
            
    SEZ <= '1' when( (zero = '1') or ( ALURES(15) = '1')) else
           '0';

end Behavioral;