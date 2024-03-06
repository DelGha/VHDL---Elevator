library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown_count is
    Port ( CLK, UP, DOWN : in  STD_LOGIC;
           COUNT : out  STD_LOGIC_VECTOR (3 downto 0));
end updown_count;

architecture Behavioral of updown_count is

begin
	
	process( CLK, UP, DOWN )
	variable TEMP: STD_LOGIC_VECTOR(3 downto 0):="0000";
	begin 
	if( CLK'EVENT and CLK = '1') then
		if( UP = '1' and DOWN = '0') then
			TEMP := TEMP + 1;
		elsif( DOWN = '1' and UP = '0') then
			TEMP := TEMP - 1;
		end if;
	end if;
	COUNT <= TEMP;
	end process;
	
end Behavioral;
