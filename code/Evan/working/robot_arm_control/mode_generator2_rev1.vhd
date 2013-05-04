----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:27:17 04/23/2013 
-- Design Name: 
-- Module Name:    lab8w2_3 - Behavioral 
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

entity mode_generator2 is
    Port ( clk_in:in STD_LOGIC;
			  reset: in std_logic;
			  sw : in  STD_LOGIC_vector(3 downto 0);
			  pan_pause :out std_logic;
			  pan_load : out std_logic;
			  pan_load_v: out std_logic_vector(7 downto 0);
			  tilt_pause : out std_logic;
			  tilt_load: out std_logic;
			  tilt_load_v: out std_logic_vector(7 downto 0));
			 
end mode_generator2;

architecture Behavioral of mode_generator2 is

begin
	process(reset,clk_in, sw)--clk_process_change_state
		begin
			if (reset = '1') then
			 pan_pause <= '0';
				pan_load <='1';
				pan_load_v <=x"96";--others set to 90 degreesy
				tilt_pause <= '0';
				tilt_load <='1';
				tilt_load_v <=x"96";
			
				elsif(rising_edge(clk_in))then
					case (sw) is 
						when "0000" =>
							pan_pause <= '1';--NC
							pan_load <='0';
							pan_load_v <=x"96";
							tilt_pause <= '1';--NC
							tilt_load <='0';
							tilt_load_v <=x"96";			
						when "0001" =>
							pan_pause <= '0';
							pan_load <='1';
							pan_load_v <=x"96";--90 degrees
							tilt_pause <= '0';
							tilt_load <='1';
							tilt_load_v <=x"96";--90 degrees
						when "0010" =>
							pan_pause <= '1';--NC
							pan_load <='0';
							pan_load_v <=x"96";
							tilt_pause <= '0';
							tilt_load <='1';
							--tilt_load_v <=x"80";--control=68 degrees  (bad value)
							tilt_load_v <=x"96";--control=68 degrees  (bad value)
							
						when "0011" =>
							pan_pause <= '0';
							pan_load <='1';
							--pan_load_v <=x"80";--control=68 degrees
							pan_load_v <=x"96";--control=68 degrees
							
							tilt_pause <= '1';--NC
							tilt_load <='0';
							tilt_load_v <=x"96";
						when "0100" =>
							pan_pause <= '0';
							pan_load <='1';
							pan_load_v <=x"C3";--max=135 degrees
							tilt_pause <= '1';--NC
							tilt_load <='0';
							tilt_load_v <=x"96";
						when "0101" =>
							pan_pause <= '0';
							pan_load <='1';
							pan_load_v <=x"69";--min=45 degrees
							tilt_load <='0';
							tilt_load_v <=x"96";
							tilt_pause <= '1';--NC
						when "0110" =>
							pan_pause <= '1';--NC
							--pan_pause <= '0'; ---overwritten (changed)
							pan_load <='0';
							pan_load_v <=x"96";
							
							tilt_pause <= '0';
							tilt_load <='1';
							tilt_load_v <=x"C3";--max=135 degrees
						when "0111" =>
							pan_pause <= '1';--NC
							pan_load <='0';
							pan_load_v <=x"96";
							tilt_pause <= '0';
							tilt_load <='1';
							tilt_load_v <=x"69";--max=45 degrees
						when "1000" =>
							pan_pause <= '0';
							pan_load <='0';--sweep to max(135)
							pan_load_v <=x"C3";
							tilt_pause <= '1';
							tilt_load <='0';--NC
							tilt_load_v <=x"C3";
						when "1001" =>
							pan_pause <= '1';
							pan_load <='0';--NC
							pan_load_v <=x"96";
							tilt_pause <= '0';
							tilt_load <='0';--sweep to max
							tilt_load_v <=x"C3";
						when "1011" =>
							pan_pause <= '0';
							pan_load <='0';--sweep to  max
							pan_load_v <=x"C3";
							tilt_pause <= '0';
							tilt_load <='0';--sweep to max
							tilt_load_v <=x"C3";
						when others => --reset to 90 degrees
							pan_pause <= '0';
							pan_load <='1';
							pan_load_v <=x"96";--others set to 90 degreesy
							tilt_pause <= '0';
							tilt_load <='1';
							tilt_load_v <=x"96";
					end case;
				end if;
end process;

end Behavioral;