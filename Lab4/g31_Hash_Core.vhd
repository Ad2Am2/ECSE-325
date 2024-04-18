

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g31_Hash_Core is
 port (	A_o, B_o, C_o, D_o, E_o, F_o, G_o, H_o : 	inout std_logic_vector (31 downto 0); 
			A_i, B_i, C_i, D_i, E_i, F_i, G_i, H_i: 	in std_logic_vector (31 downto 0);
			Kt_i, Wt_i : 										in std_logic_vector (31 downto 0);
			LD, CLK: 											in std_logic);
					
end g31_Hash_Core;

architecture Behavioral of g31_Hash_Core is

	component g31_SIG_CH_MAJ
		 port (A_o, B_o, C_o, E_o, F_o, G_o : in std_logic_vector(31 downto 0);
			SIG0, SIG1, CH, MAJ	    : out std_logic_vector(31 downto 0)
			);
	end component;

	signal A_reg, B_reg, C_reg, D_reg, E_reg, F_reg, G_reg, H_reg : std_logic_vector(31 downto 0);
	signal SIG0, SIG1, CH, MAJ : std_logic_vector(31 downto 0);
	signal A_reg_next, E_reg_next : std_logic_vector(31 downto 0);

begin

A_reg_next <= std_logic_vector(unsigned(SIG0) + unsigned(MAJ) + unsigned(SIG1) + unsigned(CH) + unsigned(H_o) + unsigned(Kt_i) + unsigned(Wt_i));
E_reg_next <= std_logic_vector(unsigned(D_o) + unsigned(SIG1) + unsigned(CH) + unsigned(Kt_i) + unsigned(Wt_i) + unsigned(H_o));


process(LD, CLK)
begin
	if rising_edge(CLK) then
		
		if LD = '1' then
        A_reg <= A_i;
		  B_reg <= B_i;
		  C_reg <= C_i;
		  D_reg <= D_i;
		  E_reg <= E_i;
		  F_reg <= F_i;
		  G_reg <= G_i;
		  H_reg <= H_i;		
		  
		else
			H_reg <= G_o;
			G_reg <= F_o;
			F_reg <= E_o;
			E_reg <= E_reg_next;
			D_reg <= C_o;
			C_reg <= B_o;
			B_reg <= A_o;
			A_reg <= A_reg_next;
    end if; 
		
	 -- Output ports
    A_o <= A_reg;
    B_o <= B_reg;
    C_o <= C_reg;
    D_o <= D_reg;
    E_o <= E_reg;
    F_o <= F_reg;
    G_o <= G_reg;
    H_o <= H_reg;
	 
	 
	end if;
end process;

	-- Other operations
    g31_SIG_CH_MAJ_inst : g31_SIG_CH_MAJ
    port map (
        A_o => A_reg,
        B_o => B_reg,
        C_o => C_reg,
        E_o => E_reg,
        F_o => F_reg,
        G_o => G_reg,
        SIG0 => SIG0, -- Connect output ports appropriately
        SIG1 => SIG1,
        CH => CH,
        MAJ => MAJ
    );


end Behavioral;