						----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:02 04/22/2013 
-- Design Name: 
-- Module Name:    counter_8_bit - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_8_bit is
	Port (
			clk_in : in STD_LOGIC;
          pause : in STD_LOGIC;
			 inc   : in STD_LOGIC;
          reset : in STD_LOGIC;
			 load  : in STD_LOGIC;
			 load_vec  : in STD_LOGIC_VECTOR(7 downto 0);
			 count_out : out STD_LOGIC_VECTOR(7 downto 0));

end counter_8_bit;

architecture Behavioral of counter_8_bit is

signal count_temp: std_logic_vector(7 downto 0) := x"96";

begin

process (clk_in,reset,pause,load,inc,count_temp)
	begin
		if (rising_edge(clk_in)) then
			if (reset = '1') then ---sync. reset
				--if (count_temp /= x"96") then
					count_temp <= x"96";
				--else
					--count_temp <= count_temp;
				--end if;
			elsif(pause = '1') then  ---check pause first
				count_temp <= count_temp;	
			elsif (load = '1') then
				count_temp <= load_vec;
			elsif (inc = '1') then
				--if (count_temp = x"C3") then
				--	count_temp <= count_temp - 3; -- back 3 degrees
				--else
				  if (count_temp = x"c3") then
				      count_temp <= x"69"; -----
				  else
					count_temp <= count_temp + 3;
				  end if;
				--end if;	
			else
				count_temp <= count_temp;
			end if;
		end if;
		
	end process;
	
count_out <= count_temp;

end Behavioral;