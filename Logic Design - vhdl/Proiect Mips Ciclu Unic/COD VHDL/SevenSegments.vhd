

library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use ieee.std_logic_unsigned.all;   

-- primeste clock-ul de la Basys 3 (450 MHZ) 
-- afiseaza Digit(3->0) pe afisorul cu 7 segmente

entity SevenSegments is
	 port(
	 clk : in STD_LOGIC ;
	 digit1: in std_logic_vector(3 downto 0);
	 digit2: in std_logic_vector(3 downto 0);
	 digit3: in std_logic_vector(3 downto 0);
	 digit4: in std_logic_vector(3 downto 0); 
	 CatOut: out std_logic_vector(6 downto 0);
	 an : out std_logic_vector(0 to 3)
	     );
end SevenSegments;

--}} End of automatically maintained section

architecture SevenSegments of SevenSegments is
signal numarator : std_logic_vector (15 downto 0) := X"0000"; 
signal digit : std_logic_vector (3 downto 0) ;
begin
	process(clk)	
	begin
		if (rising_edge(clk))then 
				numarator <= (numarator + 1);
		end if;
	end process;   
	
	process(numarator)  
	begin		   
			case numarator(15 downto 14) is 
				when "00" =>  an <= "1110"; 
				when "01" => an <= "1101"; 
				when "10" => an <= "1011";
				when others => an <= "0111";	
			end case; 
	end process;
	
	process(numarator)  
	begin		   
			case numarator(15 downto 14) is 
				when "00" =>  digit <=digit1;
				when "01" =>  digit <=digit2; 
				when "10" =>  digit <=digit3;
				when others =>digit <=digit4;	
			end case;  
	end process;   
	
	process(digit)  
	begin		   
			case digit is 
				when x"0" => CatOut <= "0000001";  -- 0
				when x"1" => CatOut <= "1001111";  -- 1
				when x"2" => CatOut <= "0010010";  -- 2
				when x"3" => CatOut <= "0000110";  -- 3
				when x"4" => CatOut <= "1001100";  -- 4
				when x"5" => CatOut <= "0100100";  -- 5
				when x"6" => CatOut <= "0100000";  -- 6
				when x"7" => CatOut <= "0001111";  -- 7
				when x"8" => CatOut <= "0000000";  -- 8
				when x"9" => CatOut <= "0000100";  -- 9
				when x"A" => CatOut <= "0001000";  -- o	- litera mica
				when x"B" => CatOut <= "1100000";  -- nothing
				when x"C" => CatOut <= "0110001";  -- r/n
				when x"D" => CatOut <= "1000010";  -- K
				when x"E" => CatOut <= "0110000";  -- E
				when others =>CatOut <= "0111000"; -- -
			end case;  
	end process;   

	
				
end SevenSegments;
