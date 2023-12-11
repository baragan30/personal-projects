library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock02sec is 
	port (
	clockin :in std_logic;
	clockout :inout std_logic := '0'
	);
end clock02sec;


architecture clock02sec of clock02sec is
    signal numarator : std_logic_vector (31 downto 0 ) := x"00000000";
begin
	process(clockin)
	begin 	  
		if (rising_edge(clockin) ) then
			
			if numarator =x"00000900" then	   --  35A4E900  
				numarator <= x"00000000";
				clockout<= not clockout;
				else 
				numarator <=numarator+1;
			end if;
		end if ;
		
		
		
	end process	; 
		

end clock02sec;