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

entity combo3 is
port(	clk_in		: in std_logic;
		reset		: in std_logic;
		switch : in std_logic_vector(3 downto 0);
		pan_pwm_out : out std_logic ;
		tilt_pwm_out : out std_logic 
		);

end combo3;

architecture Behavioral of combo3 is

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
			pwm_on_in : in std_logic_vector(7 downto 0);
         pwm_out : OUT  std_logic;
			tick20    : out std_logic :='0'; --falling edge is 20 ms tick
			tick100   : out std_logic :='0'  --Not sure if it works!
        );
END COMPONENT;
	 
COMPONENT counter_8_bit
	PORT (
			clk_in : in STD_LOGIC;
          pause : in STD_LOGIC;
			 inc   : in STD_LOGIC;
          reset : in STD_LOGIC;
			 load  : in STD_LOGIC;
			 load_vec  : in STD_LOGIC_VECTOR(7 downto 0) := x"96";
			 count_out : out STD_LOGIC_VECTOR(7 downto 0)
			 );
END COMPONENT;

COMPONENT mode_generator2
	PORT (
			clk_in:in STD_LOGIC;
			  reset: in std_logic;
			  sw : in  STD_LOGIC_vector(3 downto 0);
			  pan_pause :out std_logic;
			  pan_load : out std_logic;
			  pan_load_v: out std_logic_vector(7 downto 0);
			  tilt_pause : out std_logic;
			  tilt_load: out std_logic;
			  tilt_load_v: out std_logic_vector(7 downto 0)
			  );
END COMPONENT;			  

signal clk_temp  : std_logic := '0';
signal pan_tick_100,tilt_tick_100 : std_logic := '0';
signal pan_pwm_in, tilt_pwm_in : std_logic_vector(7 downto 0) := x"96";
signal pan_p, tilt_p, pan_l, tilt_l : std_logic;
signal pan_load_vec, tilt_load_vec : std_logic_vector(7 downto 0);
signal tick_20, tick2_20 : std_logic;

begin

u1: clk_div port map(
	clk_50M=>clk_in,
	reset => '0', ---test
	clk_100khz => clk_temp
	);
	
pan_pwm :PWM port map(
			clk => clk_temp,
			pwm_on_in => x"C3",
			pwm_out => pan_pwm_out,
			reset => '0',--test
			tick100 => pan_tick_100,
			tick20 => tick2_20
			);

tilt_pwm :PWM port map(
			clk => clk_temp,
			pwm_on_in => tilt_pwm_in,
			pwm_out => tilt_pwm_out,
			reset => '0',---test
			tick100 => tilt_tick_100,
			tick20 => tick_20
			);			
	
pan_count: counter_8_bit port map(
			inc => pan_tick_100,
			clk_in => clk_temp,
			reset => reset,
			pause => pan_p,
			count_out => pan_pwm_in,
			load => pan_l,
			load_vec => pan_load_vec
);

tilt_count: counter_8_bit port map(
			inc => tilt_tick_100,
			clk_in => clk_temp,
			reset => reset,
			pause => tilt_p,
			count_out => tilt_pwm_in,
			load => tilt_l,
			load_vec => tilt_load_vec
);

mode_gen : mode_generator2 port map(
					clk_in => clk_temp,
					reset => reset,
					sw => switch,
					pan_pause => pan_p,
					pan_load => pan_l,
					pan_load_v => pan_load_vec,
					tilt_pause => tilt_p,
					tilt_load => tilt_l,
					tilt_load_v => tilt_load_vec

);

end Behavioral;