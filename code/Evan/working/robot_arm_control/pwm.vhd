----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:37 04/15/2013 
-- Design Name: 
-- Module Name:    pwm - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm is

port(
	clk       : in std_logic;
	reset     : in std_logic; --logic high
	--pwm_on_in : in std_logic_vector(11 downto 0) := x"095";
	pwm_out   : out std_logic;
	tick20    : out std_logic :='0'; --falling edge is 20 ms tick
	tick100   : out std_logic :='0'  --Not sure if it works!
    );

end pwm;

architecture Behavioral of pwm is

-- Declare internal signals
signal num_clks        : unsigned(11 downto 0) := x"000";
signal num_clks100     : unsigned(15 downto 0) := x"0000";
signal pwm_width       : unsigned(7 downto 0) := x"095";
signal pulse_period    : unsigned(11 downto 0) := x"7CF";  --Wait > 20ms  1999
signal pulse_period100 : unsigned(15 downto 0) := x"270F"; --Wait > 100ms 9999  270F

begin
--pulse_period <= x"7CF";        --20ms period
--pulse_period100 <= x"270F";
pwm_width <= unsigned(pwm_on_in);

	process(clk, reset)
		begin
			if(reset = '1') then
                num_clks <= (others => '0');
                pwm_out <= '0';
					 
            elsif(rising_edge(clk)) then
					if (num_clks < pwm_width) then
                    pwm_out <= '1';
                    else 
                    pwm_out <= '0';
                end if;
				
					if(num_clks >= pulse_period) then
						tick20 <= '1';
						num_clks <= (others => '0');
					else
						num_clks <= num_clks + 1;
						tick20 <= '0';
					end if;
					if(num_clks100 >= pulse_period100) then
						tick100 <= '1';
						num_clks100 <= (others => '0');
					else
						num_clks100 <= num_clks100 + 1;
						tick100 <= '0';
					end if;
					
			end if;
	end process;

end Behavioral;