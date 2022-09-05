library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter8 is
	port (
		rst : in std_logic := '1';
		clk : in std_logic;
		d_out : out std_logic_vector (3 downto 0) := "0000"
	);
end counter8;

architecture behavioral of counter8 is
signal d_reg : std_logic_vector (3 downto 0) := "0000";
signal prev_state : std_logic := '0';
begin
	process (rst, clk)
	begin
		if rst = '1' and prev_state = '0' then
			d_reg <= "0000";
		elsif rising_edge(clk) and rst = '1' then
			d_reg <= std_logic_vector(unsigned(d_reg) + 1);
		end if;
		d_out <= d_reg;
		prev_state <= rst;
	end process;	
--	d_reg <= "00110000" when rising_edge(rst) else 
--			std_logic_vector(unsigned(d_reg) + 1) when rising_edge(clk) and rst = '1';
--	d_out <= d_reg;
end architecture;