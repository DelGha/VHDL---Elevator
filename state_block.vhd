library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity state_block is
	port (input: in STD_LOGIC_VECTOR(7 downto 0);
			clock, reset: in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(7 downto 0);
			qo: out STD_LOGIC_VECTOR(2 downto 0));
end state_block;

architecture Behavioral of state_block is
component d_flip_flop is
	port (reset, clock, d, ce: in STD_LOGIC;
			q, qn: out STD_LOGIC);
end component;
component memory is
	port (input: in STD_LOGIC_VECTOR(3 downto 0);
			output: out STD_LOGIC_VECTOR(2 downto 0));
end component;
component mux_n is
	generic (sel: natural; len: natural);
	port (sels: in STD_LOGIC_VECTOR(sel - 1 downto 0);
			inputs: in STD_LOGIC_VECTOR((2 ** sel) * len - 1 downto 0);
			output: out STD_LOGIC_VECTOR(len - 1 downto 0)); 
end component;
component decoder is
	generic (n:natural);
	port (d: in STD_LOGIC_VECTOR(n - 1 downto 0);
			output: out STD_LOGIC_VECTOR((2 ** n) - 1 downto 0));
end component;
signal q: STD_LOGIC_VECTOR(2 downto 0);
signal a: STD_LOGIC_VECTOR(3 downto 0);
signal d: STD_LOGIC_VECTOR(2 downto 0);
begin
	U1: mux_n generic map (3, 1) port map (sels => q, inputs => input, output(0) => a(3));
	M: memory port map (a, d);
	D2: d_flip_flop port map (reset => reset, clock => clock, d => d(2), q => q(2), ce => '1');
	D1: d_flip_flop port map (reset => reset, clock => clock, d => d(1), q => q(1), ce => '1');
	D0: d_flip_flop port map (reset => reset, clock => clock, d => d(0), q => q(0), ce => '1');
	a(2 downto 0) <= q(2 downto 0);
	U2: decoder generic map (3) port map (q, output);
	qo <= q;
end Behavioral;