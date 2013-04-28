--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:29:24 04/28/2013
-- Design Name:   
-- Module Name:   C:/Users/Evan Dinelli/Documents/GitHub/LAB8/code/Evan/working/robot_arm_control/pwm_tb.vhd
-- Project Name:  robot_arm_control
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pwm
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
 
ENTITY pwm_tb IS
END pwm_tb;
 
ARCHITECTURE behavior OF pwm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pwm
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         pwm_out : OUT  std_logic;
         tick20 : OUT  std_logic;
         tick100 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal pwm_out : std_logic;
   signal tick20 : std_logic;
   signal tick100 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pwm PORT MAP (
          clk => clk,
          reset => reset,
          pwm_out => pwm_out,
          tick20 => tick20,
          tick100 => tick100
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

		reset <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
