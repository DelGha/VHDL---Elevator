library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memory is
    port (input: in STD_LOGIC_VECTOR(3 downto 0);
            output: out STD_LOGIC_VECTOR(2 downto 0));
end memory;

architecture Behavioral of memory is
begin
    process (input)
    begin
        case input is
            when "0000" => output <= "000"; --0
            when "1000" => output <= "001"; --0
				
            when "0001" => output <= "001"; --1
            when "1001" => output <= "010"; --1
				
            when "0010" => output <= "010"; --2
            when "1010" => output <= "011"; --2
				
            when "0011" => output <= "100"; --3
            when "1011" => output <= "100"; --3
				
            when "0100" => output <= "000"; --4
            when "1100" => output <= "000"; --4
				
            when others => output <= "000";
        end case;
    end process;
end Behavioral;

