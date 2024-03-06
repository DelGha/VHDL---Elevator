library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity command_unit is
    port (	clock, reset: in STD_LOGIC;
            state_in: in STD_LOGIC_VECTOR(7 downto 0);
            state_out: out STD_LOGIC_VECTOR(7 downto 0));
end command_unit;

architecture Behavioral of command_unit is

COMPONENT state_block is
	port (input: in STD_LOGIC_VECTOR(7 downto 0);
			clock, reset: in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(7 downto 0);
			qo: out STD_LOGIC_VECTOR(2 downto 0));
end component state_block;

component mux_n is
    generic (sel: natural; len: natural);
    port (sels: in STD_LOGIC_VECTOR(sel - 1 downto 0);
            inputs: in STD_LOGIC_VECTOR((2 ** sel) * len - 1 downto 0);
            output: out STD_LOGIC_VECTOR(len - 1 downto 0)); 
end component;

signal iq: STD_LOGIC_VECTOR(2 downto 0);
signal state: STD_LOGIC_VECTOR(7 downto 0);

begin
    SB: state_block port map (state_in, clock, reset, state, iq);
    state_out <= state;
    
end Behavioral;
