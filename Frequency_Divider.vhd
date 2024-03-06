----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:50:59 05/12/2022 
-- Design Name: 
-- Module Name:    Frequency_Divider - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity frequency_divider is
	generic (n: integer := 1000);
	port ( 
			clk: in std_logic;
			clock_out: out std_logic);
end frequency_divider;

architecture Behavioral of frequency_divider is
signal count: integer range 0 to 1000 := 0;
signal tmp: std_logic;
begin
	process( clk, tmp )
	begin
		if( clk'event and clk = '1' ) then
			count <= count + 1;
			if ( count = n ) then
				tmp <= NOT tmp;
				count <= 1;
			end if;
		end if;
		clock_out <= tmp;
	end process;
end Behavioral;
