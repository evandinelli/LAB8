----------------------------------------------------------------------------------
-- Create Date:    19:24:55 11/04/2012 
-- Design Name: HW8 clk divider ( signal vs variable)
-- Module Name:    clk_div - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_div is
    Port ( reset : in  STD_LOGIC; 
           clk_50M : in  STD_LOGIC;
           clk_100khz : out  STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is

signal clk_int : std_logic := '0';
signal count_1 : integer range 0 to 249 := 0; --- not 250

begin
----- Method 1: use internal signal count_1
	process(clk_50M,count_1)
	begin
		if (reset = '1') then
			clk_int <= '0';
			count_1 <= 0;
		elsif ( clk_50M'event and clk_50M = '1') then --rising or falling
				count_1 <=  count_1 + 1;			
				if ( count_1 = 249  ) then ----100 kHz  ( not 250)
					count_1 <= 0;
					clk_int <= not clk_int;
				end if;	  
		end if;
	end process;


----Method 2: use internal variable count_var
----the variable is local to the process
--process(reset,clk_50M,count_1)
--variable count_var : integer range 0 to 250 :=0;
--begin
-- if (reset = '1') then
--			clk_int <= '0';
--			count_var := 0;---- signal vs variable
--  elsif ( clk_50M'event and clk_50M = '1') then --rising or falling
---			count_var :=  count_var + 1;			
--			if ( count_var = 250 ) then ----1 Hz (exact 250)
--				count_var := 0;
--				clk_int <= not clk_int;
--			end if;	  
--  end if;
--end process;

---------------------------------
clk_100khz <= clk_int;

end Behavioral;