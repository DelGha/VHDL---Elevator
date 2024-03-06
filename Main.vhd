library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

entity main is 
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
end main;

architecture arh of main is 
	component nandg is
		port ( A, B, C, D: in STD_LOGIC;
				 Z: out STD_LOGIC );
	end component nandg;

	component org is
		port ( A, B: in STD_LOGIC;
				 Z: out STD_LOGIC );
	end component org;

	component andg is
		port ( A, B, C, D: in STD_LOGIC;
				 Z: out STD_LOGIC );
	end component andg;

	component DEMUX_SOURCE is -- E scris in dataflow in file-ul propriu
    Port ( I,S : in  STD_LOGIC;
           O1, O2 : out  STD_LOGIC);
	end component DEMUX_SOURCE;

	component invg is
		port ( A: in STD_LOGIC;
				 Z: out STD_LOGIc );
	end component invg;

	component RAM is
		port(  A1,A2 : in STD_LOGIC_VECTOR( 3 downto 0 );
				 WE,reset: in STD_LOGIC;
				 D: in STD_LOGIC_VECTOR( 3 downto 0 );
				 B: out STD_LOGIC_VECTOR( 3 downto 0 ) );
	end component RAM;

	component Comparator is
	  port ( A, B: in STD_LOGIC_VECTOR( 3 downto 0 );
				greater, equal, smaller: out STD_LOGIC );
	end component Comparator ;

	component updown_count is
    port ( CLK, UP, DOWN : in  STD_LOGIC;
           COUNT : out  STD_LOGIC_VECTOR (3 downto 0));
	end component updown_count;

	component counter is
		port ( RESET, CLK: in STD_LOGIC;
				 O: out STD_LOGIC_VECTOR ( 0 to 3 ) );
	end component counter;
	
	component debouncer is
    port (input, reset, clock: in STD_LOGIC;
            output: out STD_LOGIC);
	end component debouncer;
	
	component frequency_divider is
	generic (N: integer := 1000);
	port ( 
			CLK: in std_logic;
			CLOCK_OUT: out std_logic);
	end component frequency_divider;
	
	component RAM16_4 is
	port ( ADR:  in STD_LOGIC_VECTOR (3 downto 0);
			 CS, CLK, WE:  in STD_LOGIC;
          Din:  in STD_LOGIC_VECTOR (3 downto 0);
          Dout: out STD_LOGIC_VECTOR (3 downto 0) );
	end component;

	component AFISOR is
    port( CLOCK : in STD_LOGIC;
	     RESET:in std_logic;
		  D1: in STD_LOGIC_VECTOR(3 downto 0);
		  D2: in STD_LOGIC_VECTOR(3 downto 0);
          ANOD : out STD_LOGIC_VECTOR (3 downto 0);
          CATOD : out STD_LOGIC_VECTOR (6 downto 0));
  end component AFISOR;
  
  component counter_n is
    generic (max_value: STD_LOGIC_VECTOR; min_value: STD_LOGIC_VECTOR);
    port (reset, clock, ce, mode, pl: in STD_LOGIC;
            d: in STD_LOGIC_VECTOR(max_value'range);
            q: out STD_LOGIC_VECTOR(max_value'range));
	end component counter_n;
	
	
	SIGNAL IN_COUNTER_PERS_UP: STD_LOGIC;
	SIGNAL IN_COUNTER_PERS_DOWN: STD_LOGIC;
	SIGNAL OUT_COUNTER_PERS: STD_LOGIC_VECTOR( 3 downto 0 );
	SIGNAL GREATER: STD_LOGIC;
	SIGNAL EQUAL: STD_LOGIC;
	SIGNAL SMALLER: STD_LOGIC;
	
	SIGNAL GREATER_FLOOR: STD_LOGIC;
	SIGNAL EQUAL_FLOOR: STD_LOGIC;
	SIGNAL SMALLER_FLOOR: STD_LOGIC;
	SIGNAL ERROR_OUTPUT: STD_LOGIC;
	SIGNAL CURRENT_FLOOR_SIGNAL: STD_LOGIC_VECTOR ( 3 downto 0 );
	SIGNAL CLK_OUT: STD_LOGIC;
	SIGNAL ANOD_1: STD_LOGIC_VECTOR( 3 downto 0 );
	SIGNAL CATOD_1: STD_LOGIC_VECTOR ( 6 downto 0);
	
	SIGNAL OUT_COUNTER: STD_LOGIC_VECTOR( 3 downto 0 );
	SIGNAL OUT_COUNTER_3: STD_LOGIC_VECTOR( 3 downto 0 );
	SIGNAL OUT_COUNTER_1: STD_LOGIC_VECTOR( 3 downto 0 );
	SIGNAL OUT_COUNTER_3_1: STD_LOGIC_VECTOR( 3 downto 0 );
	SIGNAL ONE_SEC: STD_LOGIC;
	SIGNAL THREE_SEC: STD_LOGIC;
	SIGNAL ONE_SEC_1: STD_LOGIC;
	SIGNAL THREE_SEC_1: STD_LOGIC;
	
	SIGNAL INC_FLOOR: STD_LOGIC;
	SIGNAL DEC_FLOOR: STD_LOGIC;
	
	SIGNAL INC_FLOOR_1: STD_LOGIC;
	SIGNAL INC_FLOOR_2: STD_LOGIC;
	SIGNAL DEC_FLOOR_1: STD_LOGIC;
	SIGNAL DEC_FLOOR_2: STD_LOGIC;
	
	SIGNAL RAM_OUT: STD_LOGIC_VECTOR( 3 downto 0 );
	SIGNAL ADDRESS_YES: STD_LOGIC_VECTOR( 3 downto 0 );
	SIGNAL CS: STD_LOGIC;
	
	SIGNAL iCU_OUTPUT: STD_LOGIC_VECTOR ( 7 downto 0 );
	SIGNAL COUNT_2_SEC_DOOR: STD_LOGIC_VECTOR( 1 downto 0 );
	SIGNAL VERIF_COUNTER_2_SEC_DOOR: STD_LOGIC;
	SIGNAL COUNTER_STAT_USI_2_SEC: STD_LOGIC_VECTOR( 1 downto 0 );
	SIGNAL VERIF_COUNTER_2_SEC_DOOR_1: STD_LOGIC;
	
	SIGNAL STATUS_USA: STD_LOGIC;
	
	SIGNAL S1: STD_LOGIC;
	SIGNAL S2: STD_LOGIC;
	SIGNAL S3: STD_LOGIC;
	SIGNAL S4: STD_LOGIC;
	SIGNAL S5: STD_LOGIC;
	SIGNAL S6: STD_LOGIC;
	SIGNAL S7: STD_LOGIC;
	SIGNAL S8: STD_LOGIC;
	SIGNAL S9: STD_LOGIC;
	SIGNAL S10: STD_LOGIC;
	SIGNAL S11: STD_LOGIC;
	SIGNAL S12: STD_LOGIC;
	SIGNAL S13: STD_LOGIC;
	SIGNAL S14: STD_LOGIC;
	SIGNAL S15: STD_LOGIC;
	SIGNAL S16: STD_LOGIC;
	SIGNAL S17: STD_LOGIC;
	SIGNAL S18: STD_LOGIC;
	SIGNAL S19: STD_LOGIC;
	SIGNAL S20: STD_LOGIC;
	
	
	
	begin
	
	S1 <= VERIF_COUNTER_2_SEC_DOOR_1 AND STATUS_USA;
	S2 <= EQUAL_FLOOR AND CU_INPUT(3);
	S3 <= START_LIFT AND ERROR_OUTPUT;
	S4 <= IN_COUNTER_PERS_UP and CU_INPUT(2);
	S5 <= IN_COUNTER_PERS_DOWN and CU_INPUT(2);
	S6 <= not(COUNTER_STAT_USI_2_SEC(0));
	S7 <= not( COUNT_2_SEC_DOOR(0));
	S8 <= not(ERROR_IN);
	S9 <= not(EQUAL_FLOOR);
	S10 <= START_LIFT AND CU_INPUT(3);
	S11 <= not(OUT_COUNTER(3));
	S12 <= not(OUT_COUNTER_3(3));
	S13 <=  not(OUT_COUNTER_3(2));
	S14 <= not(OUT_COUNTER_3_1(2));
	S15 <= not(OUT_COUNTER_1(3));
	S16 <= not(OUT_COUNTER_1(3));
	
	STATUS_USA <= CU_INPUT(0) or CU_INPUT(4);
	DISPLAY <= CATOD_1;
	
	AFISSSS: AFISOR PORT MAP( CLK, '0', CURRENT_FLOOR_SIGNAL, CURRENT_FLOOR_SIGNAL, ANOD_1, CATOD_1);
	
	iCU_OUTPUT <= "111" & (S1) & (S2) & (S3) & VERIF_COUNTER_2_SEC_DOOR & START_LIFT;
	CU_OUTPUT <= iCU_OUTPUT;
	DOOR_STATUS <= STATUS_USA;
	
	COUNTER_1: COUNTER_N generic map ("11", "00") port map (CU_INPUT(0), CLK, CU_INPUT(1), '0', '1', "00", COUNT_2_SEC_DOOR);
	VERIF_COUNTER_2_SEC_DOOR <= (COUNT_2_SEC_DOOR(1)) AND ( S7 );
	
	COUNTER_1_1: COUNTER_N generic map ("11", "00") port map (CU_INPUT(0), CLK, CU_INPUT(4), '0', '1', "00", COUNTER_STAT_USI_2_SEC);
	VERIF_COUNTER_2_SEC_DOOR_1 <= (COUNTER_STAT_USI_2_SEC(1)) AND (S6);
	
	Nr_Pers_Process_Up: debouncer port map (UP, '0', CLK, IN_COUNTER_PERS_UP);
	Nr_Pers_Process_Down: debouncer port map(DOWN, '0', CLK, IN_COUNTER_PERS_DOWN);
	Counter_Pers_Process: updown_count port map (CLK, (S4), (S5), OUT_COUNTER_PERS);  
	Comp_Nr_Pers: Comparator port map (OUT_COUNTER_PERS, "0100", GREATER, EQUAL, SMALLER);
	Output_Comp_Nr_Pers: org port map (GREATER, EQUAL, ERROR_OUTPUT); --eroare daca sunt >= 4 oameni in lift
	If_Error_Output: org port map(ERROR_OUTPUT, ERROR_IN, ERROR);
	
	P_CS: NANDG port map( S8, S9, START_LIFT, SMALLER, CS);
	P_COUNTER_ADRESS: counter port map('0', CLK, ADDRESS_YES);
	P_RAM: RAM16_4 port map (ADDRESS_YES, CS, CLK, (S10), FLOOR_NR, RAM_OUT);
	
	P3: Comparator port map (CURRENT_FLOOR_SIGNAL, RAM_OUT, GREATER_FLOOR, EQUAL_FLOOR, SMALLER_FLOOR);
	P4: DEMUX_SOURCE port map (GREATER_FLOOR, SPEED_SWITCH, ONE_SEC, THREE_SEC);
	P5: counter port map ('0', ONE_SEC, OUT_COUNTER);
	P6: counter port map ('0', THREE_SEC, OUT_COUNTER_3);
	P_NAND: NANDG port map( S11, OUT_COUNTER(2), OUT_COUNTER(1), OUT_COUNTER(0), INC_FLOOR_1);
	P_NAND_1: NANDG port map( S12, S13, OUT_COUNTER_3(1), OUT_COUNTER_3(0), INC_FLOOR_2);
	P_OR: ORG port map(INC_FLOOR_1, INC_FLOOR_2, INC_FLOOR);
	
	P7: DEMUX_SOURCE port map (SMALLER_FLOOR, SPEED_SWITCH, ONE_SEC_1, THREE_SEC_1);
	P8: counter port map ('0', ONE_SEC_1, OUT_COUNTER_1);
	P9: counter port map ('0', THREE_SEC_1, OUT_COUNTER_3_1);
	P_NAND_3: NANDG port map( S15, OUT_COUNTER_1(2), OUT_COUNTER_1(1), OUT_COUNTER_1(0), DEC_FLOOR_1);
	P_NAND_4: NANDG port map( S16, S14, OUT_COUNTER_3_1(1), OUT_COUNTER_3_1(0), DEC_FLOOR_2);
	P_OR_1: ORG port map (DEC_FLOOR_1, DEC_FLOOR_2, DEC_FLOOR);
	
	MOVE_PLS: updown_count port map( CLK, INC_FLOOR, DEC_FLOOR, CURRENT_FLOOR_SIGNAL);
	
	CURRENT_FLOOR <= CURRENT_FLOOR_SIGNAL;
end arh;