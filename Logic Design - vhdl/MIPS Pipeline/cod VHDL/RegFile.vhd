
library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use	ieee.std_logic_unsigned.all;  
use ieee.std_logic_arith.all;

entity RegFile is
	 port(
		 clk : in STD_LOGIC;
		 enableW : in STD_LOGIC :='0';
		 RA1 : in STD_LOGIC_VECTOR(2 downto 0);
		 Ra2 : in STD_LOGIC_VECTOR(2 downto 0);
		 WA : in STD_LOGIC_VECTOR(2 downto 0);
		 WD : in STD_LOGIC_VECTOR(15 downto 0);
		 RD1 : out STD_LOGIC_VECTOR(15 downto 0);
		 RD2 : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end RegFile;


architecture RegFile of RegFile is 	
type regArray  is array (0 to 7) of std_logic_vector(15 downto 0);
signal data : regArray :=(
	x"0000",
	others=> x"0000" );

begin

	process(clk)
	begin 
		if (falling_edge(clk)) then	
			if (enableW = '1') then 
				data(conv_integer(WA)) <= WD;
			end if;
		end if;
	end process;
	RD1 <= data(conv_integer(RA1));
	RD2 <= data(conv_integer(RA2));
	
	
			

end RegFile;
