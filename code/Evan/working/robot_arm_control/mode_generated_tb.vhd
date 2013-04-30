--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:10:24 04/29/2013
-- Design Name:   
-- Module Name:   C:/Users/Evan Dinelli/Documents/GitHub/LAB8/code/Evan/working/robot_arm_control/mode_generated_tb.vhd
-- Project Name:  robot_arm_control
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mode_generator
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
 
ENTITY mode_generated_tb IS
END mode_generated_tb;
 
ARCHITECTURE behavior OF mode_generated_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mode_generator
    PORT(
         clk_in : IN  std_logic;
         reset : IN  std_logic;
         mode_sel : IN  std_logic_vector(3 downto 0);
         pan_pause : OUT  std_logic;
         tilt_pause : OUT  std_logic;
         pan_load : OUT  std_logic;
         tilt_load : OUT  std_logic;
         pan_load_vec : OUT  std_logic_vector(7 downto 0);
         tilt_load_vec : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal reset : std_logic := '0';
   signal mode_sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal pan_pause : std_logic;
   signal tilt_pause : std_logic;
   signal pan_load : std_logic;
   signal tilt_load : std_logic;
   signal pan_load_vec : std_logic_vector(7 downto 0);
   signal tilt_load_vec : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_in_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mode_generator PORT MAP (
          clk_in => clk_in,
          reset => reset,
          mode_sel => mode_sel,
          pan_pause => pan_pause,
          tilt_pause => tilt_pause,
          pan_load => pan_load,
          tilt_load => tilt_load,
          pan_load_vec => pan_load_vec,
          tilt_load_vec => tilt_load_vec
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
      mode_sel <= "0001";
		
      wait for 100 us;
		mode_sel <= "0010";
		
		wait for 100 us;
		mode_sel <= "0011";
		
		wait for 100 us;
		mode_sel <= "0100";
		
		wait for 100 us;
		mode_sel <= "0101";
		
		wait for 100 us;
		mode_sel <= "0110";
		
		wait for 100 us;
		mode_sel <= "0111";
		
		wait for 100 us;
		mode_sel <= "0000";

      -- insert stimulus here 

      wait;
   end process;

END;
