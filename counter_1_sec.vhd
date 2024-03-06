library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity counter_1_sec is
	port ( RESET, CLK: in STD_LOGIC;
			 O: out STD_LOGIC_vector );
end counter_1_sec;

architecture arh of counter_1_sec is 
	signal count: STD_LOGIC_VECTOR ( 0 to 1 );
	begin 
		process ( RESET, CLK )
		begin 
			if ( RESET = '1' ) then count <= "00";
			elsif ( clk'event and clk = '1' ) then 
				count <= count + 1;
			if(count = "01") then
				count<="00";
			end if;
			end if;
		end process;
		O <= count;
end arh;