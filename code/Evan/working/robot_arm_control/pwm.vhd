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
		clk         : in    std_logic;
		reset       : in    std_logic;
		--pwm_on_in   : in    std_logic_vector(7 downto 0);
      pwm_out     : out   std_logic              
    );

end pwm;

architecture Behavioral of pwm is

-- Declare internal signals
signal num_clks     : unsigned(31 downto 0) := x"00000000"; --1073741824
signal pwm_width    : unsigned(31 downto 0) := x"00000095"; --Default to 1ms=50000
signal pulse_period : unsigned(31 downto 0) := x"000007CF"; --Wait > 20ms 1000000

begin
pulse_period <= x"000007CF";        --20ms period
pwm_width <= x"00000095"; --unsigned(pwm_on_in);   
 
	process(clk, reset)
		begin
			if(reset = '0') then
                num_clks <= (others => '0');
                pwm_out <= '0';
            elsif(rising_edge(clk)) then
                if (num_clks < pwm_width) then
                    pwm_out <= '1';
                    else 
                    pwm_out <= '0';
                end if;
				
                if(num_clks >= pulse_period) then
					num_clks <= (others => '0');
				else
					num_clks <= num_clks + 1;
				end if;
			end if;
	end process;


end Behavioral;

