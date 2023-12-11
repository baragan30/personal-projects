
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ROM is
	 port(
		 address : in STD_LOGIC_VECTOR(7 downto 0);
		 output : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end ROM;

--}} End of automatically maintained section

architecture ROM of ROM is
begin	  
	output <=  b"000_000_000_000_0_110" when (address = "00000000") else
b"001_000_001_0011000" when (address = "00000001") else
b"001_000_010_0100011" when (address = "00000010") else
b"001_000_111_0000001" when (address = "00000011") else
b"011_111_001_0000000" when (address = "00000100") else
b"001_000_111_0000010" when (address = "00000101") else
b"011_111_010_0000000" when (address = "00000110") else
b"001_000_111_0000011" when (address = "00000111") else
b"011_111_000_0000000" when (address = "00001000") else
b"001_000_111_0000100" when (address = "00001001") else
b"011_111_000_0000000" when (address = "00001010") else
b"001_000_111_0000001" when (address = "00001011") else
b"001_000_001_1101001" when (address = "00001100") else
b"001_000_101_0000110" when (address = "00001101") else
b"101_001_001_0000001" when (address = "00001110") else
b"011_001_111_0000000" when (address = "00001111") else
b"110_101_001_1111101" when (address = "00010000") else
b"001_000_001_0000010" when (address = "00010001") else
b"001_000_100_1100100" when (address = "00010010") else
b"001_001_111_0000011" when (address = "00010011") else
b"010_111_011_0000000" when (address = "00010100") else
b"100_011_000_0000101" when (address = "00010101") else
b"000_001_000_010_0_000" when (address = "00010110") else
b"000_010_001_010_0_000" when (address = "00010111") else
b"001_010_111_0000011" when (address = "00011000") else
b"011_111_000_0000000" when (address = "00011001") else
b"110_010_100_1111100" when (address = "00011010") else
b"001_001_001_0000001" when (address = "00011011") else
b"110_001_100_1110110" when (address = "00011100") else
b"001_000_111_0000001" when (address = "00011101") else
b"010_111_001_0000000" when (address = "00011110") else
b"001_000_111_0000010" when (address = "00011111") else
b"010_111_100_0000000" when (address = "00100000") else
b"000_101_101_101_0_110" when (address = "00100001") else
b"001_001_111_0000011" when (address = "00100010") else
b"010_111_011_0000000" when (address = "00100011") else
b"100_011_000_0000001" when (address = "00100100") else
b"001_101_101_0000001" when (address = "00100101") else
b"001_001_001_0000001" when (address = "00100110") else
b"110_001_100_1111010" when (address = "00100111") else
b"001_101_101_0000000" when (address = "00101000") else
b"111_0000000101000" when (address = "00101001") else


				X"0000" ;
end ROM;
