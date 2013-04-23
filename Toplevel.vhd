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
		Data		: in std_logic_vector(7 downto 0); --pwm_const
		tickII	: out std_logic; --led 0
		tickIOO	: out std_logic; --led 1
		PWM_sig_pan: out std_logic;
		PWM_sig_tilt: out std_logic;
		PWM_sig_temp_pan: out std_logic;
		PWM_sig_temp_tilt: out std_logic
		);

end Toplevel;

architecture Behavioral of Toplevel is

signal clk_out: std_logic;

component clk_divid
port    ( clk_in: in std_logic; 
			 reset: in std_logic;
			 clk_out  : out std_logic
			 ); 
		 end component;
		 
component PWM
port    ( clk_out: in std_logic; 
			 Data: in std_logic_vector(7 downto 0);
			 tickII	: out std_logic; --led 0
			 tickIOO	: out std_logic; --led 1
			 PWM_sig_pan: out std_logic;
			 PWM_sig_tilt: out std_logic;
			 PWM_sig_temp_pan: out std_logic;
			 PWM_sig_temp_tilt: out std_logic
			 ); 
		 end component;

begin

u1: clk_divid port map(
	clk_in => clk_in,
	reset => reset,
	clk_out => clk_out
	);
	
u2: PWM port map(
	clk_out => clk_out,
	Data(7 downto 0) => Data(7 downto 0),
	tickII => tickII,
	tickIOO => tickIOO,
	PWM_sig_pan => PWM_sig_pan,
	PWM_sig_tilt => PWM_sig_tilt,
	PWM_sig_temp_pan => PWM_sig_temp_pan,
	PWM_sig_temp_tilt => PWM_sig_temp_tilt
	);

end Behavioral;

