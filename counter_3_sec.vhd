library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_3_sec is
	port ( RESET, CLK: in STD_LOGIC;
			 O: out STD_LOGIC;
end counter_3_sec;

architecture arh of counter_3_sec is 
	signal count: STD_LOGIC_VECTOR ( 0 to 1 );
	begin 
		process ( RESET, CLK )
		begin 
			if ( RESET = '1' ) then count <= "00";
			elsif ( clk'event and clk = '1' ) then 
				count <= count + 1;
				if(count = "11") then
					count <= "00";
					O <= count;
			end if;
			
		end process;
		O <= count;
end arh;