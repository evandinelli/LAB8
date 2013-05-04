--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:38:41 05/04/2013
-- Design Name:   
-- Module Name:   C:/Users/Evan Dinelli/Documents/GitHub/LAB8/code/Evan/working/robot_arm_control/final_tb.vhd
-- Project Name:  robot_arm_control
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: combo3
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
 
ENTITY final_tb IS
END final_tb;
 
ARCHITECTURE behavior OF final_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT combo3
    PORT(
         clk_in : IN  std_logic;
         reset : IN  std_logic;
         SW : IN  std_logic_vector(3 downto 0);
         pan_pwm_out : OUT  std_logic := '0';
         tilt_pwm_out : OUT  std_logic := '0'
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal reset : std_logic := '0';
   signal SW : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal pan_pwm_out : std_logic := '0';
   signal tilt_pwm_out : std_logic := '0';

   -- Clock period definitions
   constant clk_in_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: combo3 PORT MAP (
          clk_in => clk_in,
          reset => reset,
          SW => SW,
          pan_pwm_out => pan_pwm_out,
          tilt_pwm_out => tilt_pwm_out
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      reset <= '0';
		SW <= "0000";
		
      wait for 30 ms;
		SW <= "1010";
		
--		wait for 30 ms;
--		SW <= "0011";
--		
--		wait for 30 ms;
--		SW <= "0100";
--		
--		wait for 30 ms;
--		SW <= "0101";
--		
--		wait for 30 ms;
--		SW <= "0110";
--		
--		wait for 30 ms;
--		SW <= "0111";
--		
--		wait for 30 ms;
--		SW <= "1000";
--		
--		wait for 30 ms;
--		SW <= "1001";
--		
--		wait for 30 ms;
--		SW <= "1011";

      wait;
   end process;

END;
