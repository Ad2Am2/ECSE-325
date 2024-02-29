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


architecture SIG_CH_MAJ is
begin
	
	Maj: process (A_o, B_o, C_o)
	signal I0, I1, I2, I3: std_logic_vector(31 downto 0);
	begin
		I0 <= (A_o and B_o);
		I1 <= (B_o and C_o);
		I2 <= (A_o and C_o);
		I3 <= (I0 xor I1);
		MAJ <= (I3 xor I2);
	end process Maj;

	Ch: process (E_o, F_o, G_o)
	signal I4, I5: std_logic_vector(31 downto 0);
	brgin
		I4 <= (E_o and F_o);
		I5 <= (not E_o and G_o);
		CH <= (I4 xor I5);
	end process Ch;

	Sig0: process (A_o)
	signal I6, I7, I8: std_logic_vector(31 downto 0);
	begin
		I6 <= (A_o ror 2);
		I7 <= (A_o ror 13);
		I8 <= (A_o ror 22);
		SIG0 <= I6 xor I7 xor I8;
	end process Sig0;

	Sig1: process (E_o)
	signal I9, I10, I11: std_logic_vector(31 downto 0);
	begin
		I9 <= (E_o ror 6);
		I10 <= (E_o ror 11);
		I11 <= (E_o ror 25);
		SIG1 <= I9 xor I10 xor I11;
	end process Sig1;
		

end SIG_CH_MAJ;