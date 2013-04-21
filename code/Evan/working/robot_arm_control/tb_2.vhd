--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:43:10 04/16/2013
-- Design Name:   
-- Module Name:   C:/Users/Evan Dinelli/Documents/GitHub/LAB8/code/working (start here)/robot_arm_control/tb_2.vhd
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
 
ENTITY tb_2 IS
END tb_2;
 
ARCHITECTURE behavior OF tb_2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clk_div
    PORT(
         reset : IN  std_logic;
         clk_50M : IN  std_logic;
         clk_100khz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk_50M : std_logic := '0';

 	--Outputs
   signal clk_100khz : std_logic;

   -- Clock period definitions
   constant clk_50M_period : time := 20 ns;
   constant clk_100khz_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clk_div PORT MAP (
          reset => reset,
          clk_50M => clk_50M,
          clk_100khz => clk_100khz
        );

   -- Clock process definitions
   clk_50M_process :process
   begin
		clk_50M <= '0';
		wait for clk_50M_period/2;
		clk_50M <= '1';
		wait for clk_50M_period/2;
   end process;
 
   clk_100khz_process :process
   begin
		clk_100khz <= '0';
		wait for clk_100khz_period/2;
		clk_100khz <= '1';
		wait for clk_100khz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for clk_50M_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
