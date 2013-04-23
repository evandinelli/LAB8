----------------------------------------------------------------------------------
-- Company: ECE 120_2
-- Engineer: NATHAN RUETTEN
-- 
-- Create Date:    13:29:41 04/21/2013 
-- Design Name: 
-- Module Name:    FSM - Behavioral 
-- Project Name: 		Robot Arm Control
-- Target Devices: 
-- Tool versions: 
-- Description: (Mode Generator?)
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

entity FSM is
    Port ( clk_in:in STD_LOGIC;
			  reset: in std_logic;
			  sw0 : in  STD_LOGIC;
           sw1 : in  STD_LOGIC;
			  sw2 : in std_logic;
			  sw3 : in std_logic;
			  pwm_in_pan: in Std_logic_vector(195 downto 105);
			  pwn_in_tilt: in Std_logic_vector(195 downto 105);
           pwm_out_pan : out  STD_LOGIC_vector(195 downto 105);
			  pwm_out_tilt : out STD_logic_vector(195 downto 105));
end FSM;

architecture Behavioral of FSM is

TYPE state_type is (IDLE, panup1, panup2, panup3, pandown1, pandown2, pandown3, tiltup1,tiltup2,tiltup3,tiltdown1,tiltdown2,tiltdown3);
	signal pr_state: state_type;
	signal nx_state: state_type;
	signal pwm_adj_pan : STD_LOGIC_vector(1 downto 0);
	signal pwm_adj_tilt : STD_LOGIC_vector(1 downto 0);

begin
	process(clk_in, pr_state)--clk_process_change_state
		begin
			if (reset = '0') then
				if(falling_edge(clk_in))then
					pr_state <= nx_state;
				end if;
			end if;

		case (pr_state) is 
			
			 when IDLE => 
				pwm_adj_pan<="00";
				pwm_adj_tilt<="00";
				 if (clk_in ='1' and C='0' and A = '0') then
					 nx_state <= panup1;
				 elsif (clk_in ='1' and C='1' and A ='0') then
					nx_state <= pandown1;
				 elsif (clk_in ='1' and C='0' and B ='0') then
					nx_state <= tiltup1;
				 elsif (clk_in ='1' and C='1' and B ='0') then
					nx_state <= tiltdown1;
				 else
					 nx_state <= IDLE;
				 end if;
				 
			 when panup1 =>
				if (clk_in ='1' and B = '0') then
					 nx_state <= panup2;
					 pwm_adj_pan <="00";
				elsif (clk_in ='1' and A = '1') then
					nx_state <=IDLE;
				 else
					 nx_state <= panup1;
				 end if;

			 when panup2 =>
				if (clk_in ='1' and A = '1') then
					 nx_state <= panup3;
				elsif (clk_in ='1' and B = '1') then
					nx_state <=panup1;
				 else
					 nx_state <= panup2;
				 end if;
				 
			when panup3 =>  
				if (clk_in ='1' and B = '1') then
					 nx_state <= IDLE;
					 pwm_adj_pan <="01";
				elsif (clk_in ='1' and A = '0') then
					nx_state <=panup2;
				 else
					 nx_state <= panup3;
				 end if;
		
--end of pan up		
			when pandown1 =>
				if (clk_in ='1' and B = '0') then
					 nx_state <= pandown2;
					 pwm_adj_pan <="00";
				elsif (clk_in ='1' and A = '1') then
					nx_state <=IDLE;
				 else
					 nx_state <= pandown1;
				 end if;

			 when pandown2 =>
				if (clk_in ='1' and A = '1') then
					 nx_state <= pandown3;
				elsif (clk_in ='1' and B = '1') then
					nx_state <=pandown1;
				 else
					 nx_state <= pandown2;
				 end if;
				 
			when pandown3 =>  
				if (clk_in ='1' and B = '1') then
					 nx_state <= IDLE;
					 pwm_adj_pan <="10";
				elsif (clk_in ='1' and A = '0') then
					nx_state <=pandown2;
				 else
					 nx_state <= pandown3;
				 end if;
--end of pan down			
			when tiltdown1 =>
				if (clk_in ='1' and A = '0') then
					 nx_state <= tiltdown2;
					 pwm_adj_tilt <="00";
				elsif (clk_in ='1' and B = '1') then
					nx_state <=IDLE;
				 else
					 nx_state <= tiltdown1;
				 end if;
			
			when tiltdown2 => 
				if (clk_in ='1' and B = '0') then
					 nx_state <= tiltdown3;
					 pwm_adj_tilt <="00";
				elsif (clk_in ='1' and A = '1') then
					nx_state <= tiltdown1;
				 else
					 nx_state <= tiltdown2;
				 end if;
				
			when tiltdown3 => 
				if (clk_in ='1' and A = '1') then
					 nx_state <= IDLE;
					 pwm_adj_tilt <="10";
				elsif (clk_in ='1' and B = '1') then
					nx_state <=tiltdown2;
				 else
					 nx_state <=tiltdown3;
				 end if;
--end of tilt down

			when tiltup1 =>
				if (clk_in ='1' and A = '0') then
					 nx_state <= tiltup2;
					 pwm_adj_tilt <="00";
				elsif (clk_in ='1' and B = '1') then
					nx_state <=IDLE;
				 else
					 nx_state <= tiltup1;
				 end if;
			
			when tiltup2 => 
				if (clk_in ='1' and B = '0') then
					 nx_state <= tiltup3;
					 pwm_adj_tilt <="00";
				elsif (clk_in ='1' and A = '1') then
					nx_state <= tiltup1;
				 else
					 nx_state <= tiltup2;
				 end if;
				
			when tiltup3 => 
				if (clk_in ='1' and A = '1') then
					 nx_state <= IDLE;
					 pwm_adj_tilt <="01";
				elsif (clk_in ='1' and B = '1') then
					nx_state <=tiltup2;
				 else
					 nx_state <= tiltup3;
				 end if;
--end of tilt up		 
			 when others =>  
				  nx_state <= IDLE;
				  pwm_adj_tilt <="00";
				  pwm_adj_pan <="00";
		end case;
		
	end process;

	process(pwm_adj_pan,clk_in)
		begin
			if(falling_edge(clk_in)) then
				if (pwm_adj_pan = "01")then 
					pwm_out_pan <= (pwm_in_pan + 1);
				elsif (pwm_adj_pan = "10")then 
					pwm_out_pan <= (pwm_in_pan - 1);
				else
					pwm_out_pan <= pwm_in_pan;
				end if;
			end if;
	end process;
	
	process(pwm_adj_tilt,clk_in)
		begin
			if(falling_edge(clk_in)) then
				if (pwm_adj_tilt = "01")then 
					pwm_out_tilt <= (pwm_in_tilt + 1);
				elsif (pwm_adj_tilt = "10")then 
					pwm_out_tilt <= (pwm_in_tilt - 1);
				else
					pwm_out_tilt <= pwm_in_tilt;
				end if;
			end if;
	end process;
end Behavioral;

