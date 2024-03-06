library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_n is
    generic (max_value: STD_LOGIC_VECTOR; min_value: STD_LOGIC_VECTOR);
    port (reset, clock, ce, mode, pl: in STD_LOGIC;
            d: in STD_LOGIC_VECTOR(max_value'range);
            q: out STD_LOGIC_VECTOR(max_value'range));
end counter_n;

architecture Behavioral of counter_n is
signal intern: STD_LOGIC_VECTOR(max_value'range);
begin
    counter: process(reset, clock, pl, d)
    begin
        if reset = '1' then
            intern <= min_value;
        elsif pl = '0' then
            intern <= d;
        elsif clock = '1' and clock'event then
            if ce = '1' then
                if mode = '0' then
                    if intern = max_value then
                        intern <= min_value;
                    else
                        intern <= STD_LOGIC_VECTOR(unsigned(intern) + 1);
                    end if;
                elsif mode = '1' then
                    if intern = min_value then
                        intern <= max_value;
                    else 
                        intern <= STD_LOGIC_VECTOR(unsigned(intern) - 1);
                    end if;
                end if;
            end if;
        end if;
    end process;
    q <= intern;
end Behavioral;
