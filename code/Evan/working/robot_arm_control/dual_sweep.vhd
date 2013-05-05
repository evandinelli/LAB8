----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:41 05/04/2013 
-- Design Name: 
-- Module Name:    dual_sweep - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dual_sweep is
    Port ( 
			clk_in : in  STD_LOGIC;
			reset : in STD_LOGIC;
			switch : in  STD_LOGIC_VECTOR (3 downto 0);
			pan_count_in  : in  STD_LOGIC_VECTOR (7 downto 0);
			tilt_100_temp : in STD_LOGIC;
			tilt_inc : out STD_LOGIC;
         inc_by   : out STD_LOGIC_VECTOR(2 downto 0)
			);
end dual_sweep;

architecture Behavioral of dual_sweep is

begin

process(clk_in)
begin
	
	if(reset = '1') then
		tilt_inc <= '0';
	
	elsif(rising_edge(clk_in)) then
		if(switch = "1010") then
			inc_by <= "101";
			if(pan_count_in = x"C3") then
				tilt_inc <= '1';
			else
				tilt_inc <= '0';
			end if;
		else
			inc_by <= "011";
			if(tilt_100_temp = '1') then
				tilt_inc <= '1';
			else
				tilt_inc <= '0';
			end if;
		end if;
	
	end if;

end process;
end Behavioral;