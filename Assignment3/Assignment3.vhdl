--
-- entity name: SIG_CH_MAJ --
-- Version 1.0

library ieee; -- allows use of the stg_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- needed if you are using unsigned rotate operations

entity SIG_CH_MAJ is
	port(A_o, B_o, C_o, E_o, F_o, G_o : in std_logic_vector(31 downto 0);
		SIG0, SIG1, CH, MAJ : out std_logic_vector(31 downto 0);
	);

end SIG_CH_MAJ;


architecture 