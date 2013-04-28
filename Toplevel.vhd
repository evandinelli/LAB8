----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:42:46 04/16/2013 
-- Design Name: 
-- Module Name:    Toplevel - Behavioral 
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

entity Toplevel is
port(	clk_in		: in std_logic;
		Reset		: in std_logic;
		--Data		: in std_logic_vector(3 downto 0); --pwm_const
		--tickII	: out std_logic; --led 0
		--tickIOO	: out std_logic; --led 1
		--pan: out std_logic;
		--tilt: out std_logic
		pwm_out : out std_logic
		);

end Toplevel;

architecture Behavioral of Toplevel is

signal clk_temp  : std_logic := '0';
signal int_pwm_width    : std_logic_vector(11 downto 0) := x"095";

--signal clk_out: std_logic;

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
			--pwm_on_in : in std_logic_vector(11 downto 0);
         pwm_out : OUT  std_logic;
			tick20    : out std_logic :='0'; --falling edge is 20 ms tick
			tick100   : out std_logic :='0'  --Not sure if it works!
        );
    END COMPONENT;

begin

u1: clk_div port map(
	clk_50M=>clk_in,
	reset => reset,
	clk_100khz => clk_temp
	);
	
u2: PWM port map(
	clk => clk_temp,
	--pwm_on_in => int_pwm_width,
	pwm_out => pwm_out,
	reset => reset
	);

end Behavioral;

