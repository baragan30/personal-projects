
library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity AdressController is
	 port(
	 	 clk : in STD_LOGIC;
		 ok :in std_logic;
		 reset:in std_logic;
		 jump : in STD_LOGIC;
		 PCSrc : in STD_LOGIC;
		 ExtImm : in STD_LOGIC_VECTOR(15 downto 0);
		 instruction : inout STD_LOGIC_VECTOR(15 downto 0);
		 curAdress : inout STD_LOGIC_VECTOR(15 downto 0):= x"0000"
	     );
end AdressController;

--}} End of automatically maintained section

architecture AdressController of AdressController is 

	component ROM is
		 port(
			 address : in STD_LOGIC_VECTOR(7 downto 0);
			 output : out STD_LOGIC_VECTOR(15 downto 0)
		     );
	end component;
	
signal nextAdress : STD_LOGIC_VECTOR(15 downto 0):=x"0000";	 
signal branchA : STD_LOGIC_VECTOR(15 downto 0):=x"0000";	
signal Adress1 : STD_LOGIC_VECTOR(15 downto 0):=x"0000"; 
signal Adress2 : STD_LOGIC_VECTOR(15 downto 0):=x"0000";
signal jumpA :  STD_LOGIC_VECTOR(15 downto 0);
begin			
	process (clk)
	begin 
		if(rising_edge(clk)) then 
			if (ok = '1')then
				curAdress <= nextAdress;
			
			end if;	
			
			if (reset = '1')then 
				curAdress <= x"0000";
			end if;	
		end if;
	end process;   
	G1 : ROM port map (curAdress(7 downto 0),instruction);	  
	adress1 <= curAdress + 1;
	branchA <= adress1 + ExtImm;
	
	Adress2 <= branchA when PCSrc = '1' else 
		adress1; 
		
	nextAdress <= jumpA when jump = '1' else 
				adress2;
    jumpA <= nextAdress(15 downto 13) & Instruction(12 downto 0);

end AdressController;
