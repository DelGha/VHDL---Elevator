----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:13:06 05/02/2022 
-- Design Name: 
-- Module Name:    comp_4_bits - Behavioral 
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

entity Comparator is
  port ( A, B: in STD_LOGIC_VECTOR( 3 downto 0 );
			greater, equal, smaller: out STD_LOGIC );
end Comparator ;
 
architecture arh of Comparator is
	begin
		process( A, B)
		begin
			if(A > B) then
				greater <= '1'; smaller <= '0'; equal <= '0';
			elsif(A < B) then
				greater <= '0'; smaller <= '1'; equal <= '0';
					else
						greater <= '0'; smaller <= '0'; equal <= '1';
			end if;
		end process;
end arh;