--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:10:28 04/22/2013
-- Design Name:   
-- Module Name:   C:/Users/Evan Dinelli/Documents/GitHub/LAB8/code/Evan/working/robot_arm_control/counter_tb.vhd
-- Project Name:  robot_arm_control
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter_8_bit
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
 
ENTITY counter_tb IS
END counter_tb;
 
ARCHITECTURE behavior OF counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_8_bit
    PORT(
         clk_in : IN  std_logic;
         pause : IN  std_logic;
         load : IN  std_logic;
         inc : IN  std_logic;
         reset : IN  std_logic;
         count_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal pause : std_logic := '0';
   signal load : std_logic := '0';
   signal inc : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal count_out : std_logic_vector(7 downto 0):= "00000000";

   -- Clock period definitions
   constant clk_in_period : time := 10 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_8_bit PORT MAP (
          clk_in => clk_in,
          pause => pause,
          load => load,
          inc => inc,
          reset => reset,
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
      wait for 100 us;
		load <= '1';
		inc <= '1';
		
		wait for 500 us;
		pause <= '1';
		
		wait for 500 us;
		pause <= '0';

      --wait for clk_in_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
