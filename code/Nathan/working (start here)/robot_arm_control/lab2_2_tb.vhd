--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:19:25 04/23/2013
-- Design Name:   
-- Module Name:   C:/Users/NRuetten/Documents/ECE 120/lab8w2_2/lab2_2_tb.vhd
-- Project Name:  lab8w2_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM
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
 
ENTITY lab2_2_tb IS
END lab2_2_tb;
 
ARCHITECTURE behavior OF lab2_2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         clk_in : IN  std_logic;
         reset : IN  std_logic;
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         pwm_in_pan : IN  std_logic_vector(195 downto 105);
         pwn_in_tilt : IN  std_logic_vector(195 downto 105);
         pwm_out_pan : OUT  std_logic_vector(195 downto 105);
         pwm_out_tilt : OUT  std_logic_vector(195 downto 105)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal reset : std_logic := '0';
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';
   signal pwm_in_pan : std_logic_vector(195 downto 105) := (others => '0');
   signal pwn_in_tilt : std_logic_vector(195 downto 105) := (others => '0');

 	--Outputs
   signal pwm_out_pan : std_logic_vector(195 downto 105);
   signal pwm_out_tilt : std_logic_vector(195 downto 105);

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          clk_in => clk_in,
          reset => reset,
          A => A,
          B => B,
          C => C,
          pwm_in_pan => pwm_in_pan,
          pwn_in_tilt => pwn_in_tilt,
          pwm_out_pan => pwm_out_pan,
          pwm_out_tilt => pwm_out_tilt
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
