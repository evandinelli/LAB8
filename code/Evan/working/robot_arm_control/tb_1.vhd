--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:39:13 04/16/2013
-- Design Name:   
-- Module Name:   C:/Users/Evan Dinelli/Documents/GitHub/LAB8/code/working (start here)/robot_arm_control/tb_1.vhd
-- Project Name:  robot_arm_control
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clk_div
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
 
ENTITY tb_1 IS
END tb_1;
 
ARCHITECTURE behavior OF tb_1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clk_div
    PORT(
         clk_50M : IN  std_logic;
         clk_1hz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_50M : std_logic := '0';

 	--Outputs
   signal clk_1hz : std_logic;

   -- Clock period definitions
   constant clk_50M_period : time := 10 ns;
   constant clk_1hz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clk_div PORT MAP (
          clk_50M => clk_50M,
          clk_1hz => clk_1hz
        );

   -- Clock process definitions
   clk_50M_process :process
   begin
		clk_50M <= '0';
		wait for clk_50M_period/2;
		clk_50M <= '1';
		wait for clk_50M_period/2;
   end process;
 
   clk_1hz_process :process
   begin
		clk_1hz <= '0';
		wait for clk_1hz_period/2;
		clk_1hz <= '1';
		wait for clk_1hz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      

      -- insert stimulus here 

      wait;
   end process;

END;
