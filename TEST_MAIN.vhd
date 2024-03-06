--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:15:25 05/20/2022
-- Design Name:   
-- Module Name:   C:/My_Designs/LIFT/TEST_MAIN.vhd
-- Project Name:  LIFT
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TEST_MAIN IS
END TEST_MAIN;
 
ARCHITECTURE behavior OF TEST_MAIN IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         START_LIFT : IN  std_logic;
         CLK : IN  std_logic;
         UP : IN  std_logic;
         DOWN : IN  std_logic;
         SPEED_SWITCH : IN  std_logic;
         FLOOR_NR : IN  std_logic_vector(3 downto 0);
         ERROR_IN : IN  std_logic;
         ERROR : OUT  std_logic;
         DOOR_STATUS : OUT  std_logic;
         CURRENT_FLOOR : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal START_LIFT : std_logic := '0';
   signal CLK : std_logic := '0';
   signal UP : std_logic := '0';
   signal DOWN : std_logic := '0';
   signal SPEED_SWITCH : std_logic := '0';
   signal FLOOR_NR : std_logic_vector(3 downto 0) := (others => '0');
   signal ERROR_IN : std_logic := '0';

 	--Outputs
   signal ERROR : std_logic;
   signal DOOR_STATUS : std_logic;
   signal CURRENT_FLOOR : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          START_LIFT => START_LIFT,
          CLK => CLK,
          UP => UP,
          DOWN => DOWN,
          SPEED_SWITCH => SPEED_SWITCH,
          FLOOR_NR => FLOOR_NR,
          ERROR_IN => ERROR_IN,
          ERROR => ERROR,
          DOOR_STATUS => DOOR_STATUS,
          CURRENT_FLOOR => CURRENT_FLOOR
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for CLK_period;
      wait for CLK_period;
		UP<= '1';
		wait for CLK_period;
		UP<= '0';
		wait for CLK_period;
		UP<='1';
		wait for CLK_period;
		wait for CLK_period;
		wait for CLK_period;
		wait for CLK_period;
		wait for CLK_period;
		

      -- insert stimulus here 

      wait;
   end process;

END;
