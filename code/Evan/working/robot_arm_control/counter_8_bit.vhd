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
			clk_in : in  STD_LOGIC;
          pause : in  STD_LOGIC;
          load  : in  STD_LOGIC;
			 inc   : in  STD_LOGIC;
          reset : in  STD_LOGIC;
			 count_out : out  std_logic_vector(7 downto 0));

end counter_8_bit;

architecture Behavioral of counter_8_bit is

signal count: std_logic_vector(7 downto 0) := "00000000";

begin

process (clk_in,reset,pause,load,inc,count)
	begin
		if (reset = '1') then ---asyn. reset
			count <= "00000000";
		elsif (clk_in = '1' and clk_in'event) then
				if(pause = '1') then  ---check pause first
					count <= count;
				else
					if(inc = '1' and load = '1') then
						count <= count +1;
					else
						count <= count;
					end if;
				end if;
		end if;
	end process;
	
count_out <= count;

end Behavioral;