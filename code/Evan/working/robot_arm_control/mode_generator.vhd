----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:11:59 04/29/2013 
-- Design Name: 
-- Module Name:    mode_generator - Behavioral 
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

entity mode_generator is
    Port ( clk_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           mode_sel : in  STD_LOGIC_VECTOR (3 downto 0);
           pan_pause : out  STD_LOGIC;
           tilt_pause : out  STD_LOGIC;
           pan_load : out  STD_LOGIC;
           tilt_load : out  STD_LOGIC;
           pan_load_vec : out  STD_LOGIC_VECTOR (7 downto 0) := x"96";
           tilt_load_vec : out  STD_LOGIC_VECTOR (7 downto 0) := x"96";
			  state_out : out STD_LOGIC_VECTOR (3 downto 0)
			  );
end mode_generator;

architecture Behavioral of mode_generator is

TYPE state_type is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11);
signal present_state: state_type := S0;
signal next_state: state_type := S0;

begin

	process(clk_in)
	begin
		if(reset = '1') then
			present_state <= present_state;
		elsif(rising_Edge(clk_in)) then
			present_state <= next_state;
		end if;
	end process;
	
	process(present_state,clk_in,mode_sel,reset)
	begin
	
		case(present_state) is
			when S0 => -- pan: NC  tilt: NC
				state_out <= "0000";
				
				pan_pause <= '1';
				tilt_pause <= '1';
				pan_load <= '0';
				tilt_load <= '0';
				--pan_load_vec <= x"96";
				--tilt_load_vec <= x"96";
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S1 => -- pan: 90  tilt: 90
				state_out <= "0001";
				
				pan_pause <= '0';
				tilt_pause <= '0';
				pan_load <= '1';
				tilt_load <= '1';
				pan_load_vec <= x"96";
				tilt_load_vec <= x"96";
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S2 => -- pan: NC  tilt: ec
				state_out <= "0001";
				
				pan_pause <= '1';
				tilt_pause <= '0';
				pan_load <= '0';
				tilt_load <= '1';
				--pan_load_vec <= x"96";
				tilt_load_vec <= x"79"; --121
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S3 => -- pan: ec  tilt: NC
				state_out <= "0011";
				
				pan_pause <= '0';
				tilt_pause <= '1';
				pan_load <= '1';
				tilt_load <= '0';
				pan_load_vec <= x"79"; --121
				--tilt_load_vec <= x"96";
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S4 =>
				 -- pan: max  tilt: NC
				state_out <= "0100";
				
				pan_pause <= '0';
				tilt_pause <= '1';
				pan_load <= '1';
				tilt_load <= '0';
				pan_load_vec <= x"C3";
				--tilt_load_vec <= x"96";
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S5 => -- pan: min  tilt: NC
				state_out <= "0101";
				
				pan_pause <= '0';
				tilt_pause <= '1';
				pan_load <= '1';
				tilt_load <= '0';
				pan_load_vec <= x"69";
				--tilt_load_vec <= x"96";
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S6 => -- pan: NC  tilt: max
				state_out <= "0110";
				
				pan_pause <= '1';
				tilt_pause <= '0';
				pan_load <= '0';
				tilt_load <= '1';
				--pan_load_vec <= x"96";
				tilt_load_vec <= x"C3";
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S7 => -- pan: NC  tilt: min
				state_out <= "0111";
				
				pan_pause <= '1';
				tilt_pause <= '0';
				pan_load <= '0';
				tilt_load <= '1';
				--pan_load_vec <= x"96";
				tilt_load_vec <= x"96";
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S8 => -- pan: sweep  tilt: NC
				state_out <= "1000";
				
				pan_pause <= '0';
				tilt_pause <= '1';
				pan_load <= '1';
				tilt_load <= '0';
				pan_load_vec <= x"AB"; --171
				--tilt_load_vec <= x"96";
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S9 => -- pan: NC  tilt: sweep
				state_out <= "1001";
				
				pan_pause <= '1';
				tilt_pause <= '0';
				pan_load <= '0';
				tilt_load <= '1';
				--pan_load_vec <= x"96";
				tilt_load_vec <= x"AB"; --171
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S10 => -- pan: sweep  tilt: sweep
				state_out <= "1010";
				
				pan_pause <= '0';
				tilt_pause <= '0';
				pan_load <= '1';
				tilt_load <= '1';
				pan_load_vec <= x"AB";
				tilt_load_vec <= x"AB";
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when S11 => -- pan: ec  tilt: ec
				state_out <= "1011";
				
				pan_pause <= '0';
				tilt_pause <= '0';
				pan_load <= '1';
				tilt_load <= '1';
				pan_load_vec <= x"6F"; --111
				tilt_load_vec <= x"B7";  --183
				
				if(mode_sel = "0000") then
					next_state <= S0;
				elsif(mode_sel = "0001") then
					next_state <= S1;
				elsif(mode_sel = "0010") then
					next_state <= S2;
				elsif(mode_sel = "0011") then
					next_state <= S3;
				elsif(mode_sel = "0100") then
					next_state <= S4;
				elsif(mode_sel = "0101") then
					next_state <= S5;
				elsif(mode_sel = "0110") then
					next_state <= S6;
				elsif(mode_sel = "0111") then
					next_state <= S7;
				elsif(mode_sel = "1000") then
					next_state <= S8;
				elsif(mode_sel = "1001") then
					next_state <= S9;
				elsif(mode_sel = "1010") then
					next_state <= S10;
				elsif(mode_sel = "1011") then
					next_state <= S11;
				end if;
			when others =>
				state_out <= "1111";
				next_state <= S0;
		end case;
	end process;

end Behavioral;

