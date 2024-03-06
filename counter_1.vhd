----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:04:17 05/02/2022 
-- Design Name: 
-- Module Name:    counter_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
	port ( RESET, CLK: in STD_LOGIC;
			 O: out STD_LOGIC_VECTOR ( 0 to 3 ) );
end counter;

architecture arh of counter is 
	signal count: STD_LOGIC_VECTOR ( 0 to 3 );
	begin 
		process ( RESET, CLK )
		begin 
			if ( RESET = '1' ) then count <= "0000";
			elsif ( clk'event and clk = '1' ) then 
				count <= count + 1;
			end if;
		end process;
		O <= count;
end arh;