library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEMUX_SOURCE is
    Port ( I,S : in  STD_LOGIC;
           O1, O2 : out  STD_LOGIC);
end DEMUX_SOURCE;

architecture dataflow of DEMUX_SOURCE is

begin

O1 <= I and (not S);
O2 <= I and S;

end dataflow;