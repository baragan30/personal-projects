
library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use	ieee.std_logic_unsigned.all;  
use ieee.std_logic_arith.all;

entity RAM is
	 port(
		 clk : in STD_LOGIC;
		 enableW : in STD_LOGIC;
		 Adress : in STD_LOGIC_VECTOR(6 downto 0);
		 WD : in STD_LOGIC_VECTOR(15 downto 0);
		 RD : out STD_LOGIC_VECTOR(15 downto 0) );
end RAM;


architecture RAM of RAM is 	
type regArray  is array (0 to 127) of std_logic_vector(15 downto 0);
signal data : regArray :=(
	x"0001",
	x"0002",
	x"0003",
	others=> x"0000" );

begin

	process(clk)
	begin 
		if (rising_edge(clk)) then	
			if (enableW = '1') then 
				data(conv_integer(Adress)) <= WD;
			end if;
		end if;
	end process;
	RD <= data(conv_integer(Adress));
	
	
			

end RAM;
