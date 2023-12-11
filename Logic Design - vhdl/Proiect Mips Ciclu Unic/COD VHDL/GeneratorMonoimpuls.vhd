

library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity GeneratorMonoimpuls is
    Port ( 
           clk: in std_logic;
           btn: in std_logic:='0';
           y: out std_logic:='0');
end GeneratorMonoimpuls;

architecture Behavioral of GeneratorMonoimpuls is
signal numar: std_logic_vector(0 to 15) :="0000000000000000";
signal y1: std_logic:='0';
signal y2: std_logic:='0';
signal y3: std_logic:='0';
begin
    y <= y2 and (not y3);
    
    
    process (clk) -- numaratorul
    begin
        if (rising_edge(clk)) then
         numar<= numar+1;
        end if;
    end process;
    
    process (clk,numar)   -- bistabilele
    begin
        if rising_edge(clk) then
            if(numar=X"FFFF") then
                y1<=btn;      
            end if;
        end if;
    end process;
    
    
    process(clk)
     begin
        if (rising_edge(clk)) then
            y2<=y1;
        end if;
    
    end process;
    
     process(clk)
     begin
        if (rising_edge(clk)) then
            y3<=y2;
        end if;
    
    end process;
    
    
end Behavioral;
