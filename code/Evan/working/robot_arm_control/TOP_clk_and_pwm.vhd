----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:16 04/23/2013 
-- Design Name: 
-- Module Name:    TOP_clk_and_pwm - Behavioral 
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

entity TOP_clk_and_pwm is
    Port ( clk_in : in  STD_LOGIC;
           pwm_out : out  STD_LOGIC);
end TOP_clk_and_pwm;

architecture Behavioral of TOP_clk_and_pwm is

COMPONENT clk_div
    PORT(
         reset : IN  std_logic;
         clk_50M : IN  std_logic;
         clk_100khz : OUT  std_logic
        );
    END COMPONENT;

COMPONENT pwm
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         pwm_out : OUT  std_logic
        );
    END COMPONENT;

begin

u1: clk_div PORT MAP (
          clk_in => clk_out
			);
u2: pwm PORT MAP (
			clk => clk,
			pwm_out => pwm_out
			);

end Behavioral;

