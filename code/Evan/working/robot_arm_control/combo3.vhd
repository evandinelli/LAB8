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
		reset	   	: in std_logic;
		reset45     : in std_logic;
		SW : in std_logic_vector(3 downto 0);
		SW_LED : out std_logic_vector(3 downto 0);
		pan_pwm_out : out std_logic;
		tilt_pwm_out : out std_logic;
		LED_20 : out std_logic;
		LED_100 : out std_logic;
		test : out std_logic
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
			tick20    : out std_logic; --falling edge is 20 ms tick
			tick100   : out std_logic  --falling edge is 100 ms tick
        );
END COMPONENT;
	 
COMPONENT counter_8_bit
	PORT (
			clk_in : in STD_LOGIC;
          pause : in STD_LOGIC;
			 inc   : in STD_LOGIC;
			 dual : in STD_LOGIC;
          reset : in STD_LOGIC;
			 load  : in STD_LOGIC;
			 load_vec  : in STD_LOGIC_VECTOR(7 downto 0) := x"96";
			 count_out : out STD_LOGIC_VECTOR(7 downto 0)
			 );
END COMPONENT;

COMPONENT mode_generator
	PORT (
			clk_in:in STD_LOGIC;
			  reset: in std_logic;
			  reset45 :in std_logic;
			  sw : in  STD_LOGIC_vector(3 downto 0);
			  pan_pause :out std_logic;
			  pan_load : out std_logic;
			  pan_load_v: out std_logic_vector(7 downto 0);
			  tilt_pause : out std_logic;
			  tilt_load: out std_logic;
			  tilt_load_v: out std_logic_vector(7 downto 0)
			  );
END COMPONENT;

COMPONENT dual_sweep
	PORT (
			clk_in : in  STD_LOGIC;
			reset : in STD_LOGIC;
			switch : in  STD_LOGIC_VECTOR (3 downto 0);
			pan_count_in  : in  STD_LOGIC_VECTOR (7 downto 0);
			tilt_100_temp : in STD_LOGIC;
			tilt_inc : out STD_LOGIC;
         dual     : out STD_LOGIC
			);
END COMPONENT;

COMPONENT debouncer
		PORT (
				data_in : in  STD_LOGIC;
				data_rising_pulse : out  STD_LOGIC;
				data_falling_pulse : out std_logic;
				clk : in  STD_LOGIC
				);
END COMPONENT;

signal clk_temp  : std_logic;
signal pan_tick_100,tilt_tick_100 : std_logic;
signal pan_pwm_in, tilt_pwm_in : std_logic_vector(7 downto 0) := x"96";
signal pan_p, tilt_p, pan_l, tilt_l, tilt_inc_temp : std_logic;
signal pan_load_vec, tilt_load_vec : std_logic_vector(7 downto 0);
signal tick_20, tick2_20 : std_logic;
signal dual_temp, reset_deb, reset45_deb, reset_falling, reset45_falling : std_logic;

begin

u1: clk_div port map(
	clk_50M=>clk_in,
	reset => '0', ---test
	clk_100khz => clk_temp
	);
	
pan_pwm : pwm port map(
			clk => clk_temp,
			pwm_on_in => pan_pwm_in,
			pwm_out => pan_pwm_out,
			reset => '0',--test
			tick100 => pan_tick_100,
			tick20 => tick2_20
			);

tilt_pwm : pwm port map(
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
			reset => reset_deb,
			pause => pan_p,
			count_out => pan_pwm_in,
			load => pan_l,
			load_vec => pan_load_vec,
			dual => '0'
);

tilt_count: counter_8_bit port map(
			inc => tilt_inc_temp,
			clk_in => clk_temp,
			reset => reset_deb,
			pause => tilt_p,
			count_out => tilt_pwm_in,
			load => tilt_l,
			load_vec => tilt_load_vec,
			dual => dual_temp
);

mode_gen : mode_generator port map(
					clk_in => clk_temp,
					reset => reset_deb,
					reset45 => reset45_deb,
					sw => SW,
					pan_pause => pan_p,
					pan_load => pan_l,
					pan_load_v => pan_load_vec,
					tilt_pause => tilt_p,
					tilt_load => tilt_l,
					tilt_load_v => tilt_load_vec

);

dual : dual_sweep port map(
					clk_in => clk_temp,
					reset => reset_deb,
					switch => SW,
					pan_count_in => pan_pwm_in,
					tilt_inc => tilt_inc_temp,
					dual => dual_temp,
					tilt_100_temp => tilt_tick_100
);

deb90 : debouncer port map(
					data_in => reset,
					data_rising_pulse => reset_deb,
					data_falling_pulse => reset_falling,
					clk => clk_temp
);

deb45 : debouncer port map(
					data_in => reset45,
					data_rising_pulse => reset45_deb,
					data_falling_pulse => reset45_falling,
					clk => clk_temp
);

LED_20 <= tick_20;
LED_100 <= pan_tick_100;
SW_LED <= SW;
test <= tilt_inc_temp;

end Behavioral;