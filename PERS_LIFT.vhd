library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PERS_LIFT is
port( UP, DOWN, CLK: in STD_LOGIC;
		ERROR: out STD_LOGIC);
		
end PERS_LIFT;

architecture Behavioral of PERS_LIFT is

component updown_count is
    Port ( CLK, UP, DOWN : in  STD_LOGIC;
           COUNT : out  STD_LOGIC_VECTOR (3 downto 0));
end component updown_count;

component Comparator is
  port ( A, B: in STD_LOGIC_VECTOR( 3 downto 0 );
			greater, equal, smaller: out STD_LOGIC );
end component Comparator ;

component debouncer is
    port (input, clock, reset: in STD_LOGIC;
            output: out STD_LOGIC);
end component debouncer;

component org is
	port ( A, B: in STD_LOGIC;
			 Z: out STD_LOGIC );
end component org;

SIGNAL UP_DEB: STD_LOGIC;
SIGNAL DOWN_DEB: STD_LOGIC;
SIGNAL COUNT_SIG: STD_LOGIC_VECTOR ( 3 downto 0);

SIGNAL GR, EQ, SM: STD_LOGIC;
SIGNAL FOUR: STD_LOGIC_VECTOR ( 3 downto 0);
begin
	FOUR <= "0100";
	--P1: debouncer port map(UP, '0', CLK, UP_DEB );
	--P2: debouncer port map(DOWN, '0', CLK, DOWN_DEB);
	P3: updown_count port map(CLK, UP, DOWN, COUNT_SIG);
	P4: Comparator port map(COUNT_SIG, FOUR, GR, EQ, SM);
	P5: org port map(GR, EQ, ERROR);
	
	
end Behavioral;

