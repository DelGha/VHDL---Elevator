--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:23:55 05/20/2022
-- Design Name:   
-- Module Name:   C:/My_Designs/LIFT/TEST.vhd
-- Project Name:  LIFT
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: updown_count
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
 
ENTITY TEST IS
END TEST;
 
ARCHITECTURE behavior OF TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT updown_count
    PORT(
         CLK : IN  std_logic;
         UP : IN  std_logic;
         DOWN : IN  std_logic;
         COUNT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal UP : std_logic := '0';
   signal DOWN : std_logic := '0';

 	--Outputs
   signal COUNT : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: updown_count PORT MAP (
          CLK => CLK,
          UP => UP,
          DOWN => DOWN,
          COUNT => COUNT
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
      -- hold reset state for 100 ns.
      wait for CLK_period;
		UP <= '1';
		wait for CLK_period;
		wait for CLK_period;
		wait for CLK_period;
		DOWN <= '1';
		wait for CLK_period;
		wait for CLK_period;
		UP <= '0';
		wait for CLK_period;

      -- insert stimulus here 

      wait;
   end process;

END;
