----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:36:43 11/07/2012 
-- Design Name: 
-- Module Name:    single_pulse_gen - Behavioral 
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

entity debouncer is
    Port ( data_in : in  STD_LOGIC;
           data_rising_pulse : out  STD_LOGIC;
			  data_falling_pulse : out std_logic;
           clk : in  STD_LOGIC
			  );
end debouncer;

architecture Behavioral of debouncer is

signal data_in_delay : std_logic;

begin

process(clk,data_in)
begin
		
 if( falling_edge (clk)) then
     data_in_delay <= data_in;
	  
	  if (data_in_delay = '0' and data_in = '1') then ----rising edge of data_in
	        data_rising_pulse <= '1';
	  else
	        data_rising_pulse <= '0';
	  end if;
 
	  if (data_in_delay = '1' and data_in = '0') then ----falling edge of data_in
	        data_falling_pulse <= '1';
	  else
	        data_falling_pulse <= '0';
	  end if; 
 end if;
end process;

end Behavioral;