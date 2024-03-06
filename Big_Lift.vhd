library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Big_Lift is
port( START_LIFT: in STD_LOGIC;
		SEL_FLOOR: in STD_LOGIC_VECTOR( 3 downto 0 );
		CLK: in STD_LOGIC;
		ERROR: out STD_LOGIC;
		ERROR_IN: in STD_LOGIC;
		OPEN_DOORS: out STD_LOGIC;
		SPEED_S: in STD_LOGIC;
		UP_PERS: in STD_LOGIC;
		DOWN_PERS: in STD_LOGIC;
		ANOD_AFIS: out STD_LOGIC_VECTOR( 3 downto 0);
		CATOD_AFIS: out STD_LOGIC_VECTOR ( 6 downto 0));
end Big_Lift;

architecture Behavioral of Big_Lift is

component frequency_divider is
	generic (n: integer := 1000);
	port ( 
			clk: in std_logic;
			clock_out: out std_logic);
end component frequency_divider;

component debouncer is
    port (input, reset, clock: in STD_LOGIC;
            output: out STD_LOGIC);
end component debouncer;

component command_unit is
    port (	clock, reset: in STD_LOGIC;
            state_in: in STD_LOGIC_VECTOR(7 downto 0);
            state_out: out STD_LOGIC_VECTOR(7 downto 0));
end component command_unit;

COMPONENT main is 
port ( START_LIFT: in STD_LOGIC; -- button
	    CLK: in STD_LOGIC; --switch(?)
		 UP: in STD_LOGIC; --button
		 DOWN: in STD_LOGIC; --button
		 SPEED_SWITCH: in STD_LOGIC; --switch
		 FLOOR_NR: in STD_LOGIC_VECTOR( 3 downto 0 ); --4 swtiches
		 ERROR_IN: in STD_LOGIC; --button/switch
		 ERROR: out STD_LOGIC; --led
		 DOOR_STATUS: out STD_LOGIC; --led
		 CURRENT_FLOOR: out STD_LOGIC_VECTOR( 3 downto 0 );
		 DISPLAY: out STD_LOGIC_VECTOR( 6 downto 0 );
		 CU_OUTPUT: out STD_LOGIC_VECTOR( 7 downto 0);
		 CU_INPUT: in STD_LOGIC_VECTOR( 7 downto 0));
end COMPONENT main;

component AFISOR is
    port( CLOCK : in STD_LOGIC;
	     RESET:in std_logic;
		  D1: in STD_LOGIC_VECTOR(3 downto 0);
		  D2: in STD_LOGIC_VECTOR(3 downto 0);
        ANOD : out STD_LOGIC_VECTOR (3 downto 0);
        CATOD : out STD_LOGIC_VECTOR (6 downto 0));
 end component AFISOR;

SIGNAL CLOCK_OUT: STD_LOGIC;
SIGNAL BUTTON_DEBOUNCED: STD_LOGIC;
SIGNAL UP_DEBOUNCED: STD_LOGIC;
SIGNAL DOWN_DEBOUNCED: STD_LOGIC;
SIGNAL ERROR_DEBOUNCED: STD_LOGIC;
SIGNAL D1: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL D2: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL ANOD: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL CATOD: STD_LOGIC_VECTOR(6 downto 0);

SIGNAL CA_STATE_IN_1: STD_LOGIC_VECTOR( 7 downto 0);
SIGNAL CA_STATE_IN_2: STD_LOGIC_VECTOR( 7 downto 0);

SIGNAL CURRENT_FLOOR_AFIS: STD_LOGIC_VECTOR( 3 downto 0);
SIGNAL DISPLAY_S: STD_LOGIC_VECTOR (6 downto 0);

begin

		CATOD_AFIS <= DISPLAY_S;
		P1: debouncer port map (START_LIFT, '0', CLK, BUTTON_DEBOUNCED);
		P2: debouncer port map (UP_PERS, '0', CLK, UP_DEBOUNCED);
		P3: debouncer port map (DOWN_PERS, '0', CLK, DOWN_DEBOUNCED);
		P4: debouncer port map (ERROR_IN, '0', CLK, ERROR_DEBOUNCED);
		P5: frequency_divider generic map (100000000) port map (CLK, CLOCK_OUT);
		P6: command_unit port map (CLOCK_OUT, '0', CA_STATE_IN_1, CA_STATE_IN_2);
		P7: main port map (BUTTON_DEBOUNCED, CLOCK_OUT, UP_DEBOUNCED, DOWN_DEBOUNCED, SPEED_S, SEL_FLOOR,
		ERROR_DEBOUNCED, ERROR, OPEN_DOORS, CURRENT_FLOOR_AFIS, DISPLAY_S , CA_STATE_IN_1, CA_STATE_IN_2);
		
end Behavioral;