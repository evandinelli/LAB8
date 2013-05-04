--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:35:41 04/30/2013
-- Design Name:   
-- Module Name:   C:/Users/Evan Dinelli/Documents/GitHub/LAB8/code/Evan/working/robot_arm_control/combo3_tb.vhd
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
 
ENTITY combo3_tb IS
END combo3_tb;
 
ARCHITECTURE behavior OF combo3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT combo3
    PORT(
         clk_in : IN  std_logic;
         Reset : IN  std_logic;
         switch : IN  std_logic_vector(3 downto 0);
         pan_pwm_out : OUT  std_logic;
         tilt_pwm_out : OUT  std_logic
         --count_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal Reset : std_logic := '0';
   signal switch : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal pan_pwm_out : std_logic;
   signal tilt_pwm_out : std_logic;
   signal count_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_in_period : time := 10 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: combo3 PORT MAP (
          clk_in => clk_in,
          Reset => Reset,
          switch => switch,
          pan_pwm_out => pan_pwm_out,
          tilt_pwm_out => tilt_pwm_out,
          count_out => count_out
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_in_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
