----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:31 04/26/2022 
-- Design Name: 
-- Module Name:    flip_flop_d - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity flip_flop_d is
    port (reset, clock, d: in STD_LOGIC;
            q, qn: out STD_LOGIC);
end flip_flop_d;

architecture Behavioral of flip_flop_d is
begin
    process (reset, clock)
    variable intern: STD_LOGIC;
    begin
        if reset = '1' then
            intern := '0';
        elsif clock = '1' and clock'event then
            intern := d;
        end if;
        q <= intern;
        qn <= not intern;
    end process;
end Behavioral;