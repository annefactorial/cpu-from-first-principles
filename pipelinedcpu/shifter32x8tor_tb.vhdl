library ieee;
use ieee.std_logic_1164.all;

use work.shifter32x8tor;

entity shifter32x8tor_tb is
end shifter32x8tor_tb;

architecture behavior of shifter32x8tor_tb is
	component shifter32x8tor
		port (R: in std_logic_vector(31 downto 0);
		      S: in std_logic;
		      O: out std_logic_vector(31 downto 0);
		      C: out std_logic);
	end component;

	signal R: std_logic_vector(31 downto 0);
	signal S: std_logic;
	signal O: std_logic_vector(31 downto 0);
	signal C: std_logic;
begin
	shifter32x8tor_0: shifter32x8tor port map (R, S, O, C);

	process
	begin
		assert false report "Testing shifter32x8tor" severity note;
		R <= X"FFFF_FFFF";
		S <= '0';
		wait for 2 ns;
		assert O=X"FFFF_FFFF" report "test failed" severity error;

		R <= X"FFFF_FFFF";
		S <= '1';
		wait for 2 ns;
		assert O=X"FFFF_FF00" report "test failed" severity error;
		assert C='1' report "test failed" severity error;

		wait;
	end process;
end behavior;

