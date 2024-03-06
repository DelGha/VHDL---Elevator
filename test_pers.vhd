--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:48:50 05/26/2022
-- Design Name:   
-- Module Name:   C:/My_Designs/LIFT/test_pers.vhd
-- Project Name:  LIFT
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PERS_LIFT
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
 
ENTITY test_pers IS
END test_pers;
 
ARCHITECTURE behavior OF test_pers IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PERS_LIFT
    PORT(
         UP : IN  std_logic;
         DOWN : IN  std_logic;
         CLK : IN  std_logic;
         ERROR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal UP : std_logic := '0';
   signal DOWN : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal ERROR : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PERS_LIFT PORT MAP (
          UP => UP,
          DOWN => DOWN,
          CLK => CLK,
          ERROR => ERROR
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
      wait for CLK_period*10;
		UP <= '1';
		wait for CLK_period*10;
		DOWN <= '1';
		wait for CLK_period*10;
		DOWN <= '0';
		wait for CLK_period*10;
		wait for CLK_period*10;
		wait for CLK_period*10;
		UP <= '0';
		wait for CLK_period*10;
      wait;
   end process;

END;
