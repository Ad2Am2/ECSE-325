--
-- entity name: g31_Hash_Core(replace “NN” by your group’s number)
--
-- Version 1.0
-- Authors: Adam Corbier, Emilia Solaberrieta
-- Date: March ??, 2024 (enter the date of the latest edit to the file)

library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- needed if you are using unsigned rotate operations


entity g31_Hash_Core is
    port (
        A_o, B_o, C_o, D_o, E_o, F_o, G_o, H_o : inout std_logic_vector(31 downto 0);
        A_i, B_i, C_i, D_i, E_i, F_i, G_i, H_i : in std_logic_vector(31 downto 0);
        Kt_i, Wt_i : in std_logic_vector(31 downto 0);
        LD, CLK: in std_logic
    );
end g31_Hash_Core;




architecture Behavioral of g31_Hash_Core is

	component g31_SIG_CH_MAJ is 
	  port ( 
			A_o, B_o, C_o, E_o, F_o, G_o  : in std_logic_vector(31 downto 0);        
			SIG0, SIG1, CH, MAJ           : out std_logic_vector(31 downto 0)
	  );
	end component;

	-- Internal signals
	signal A_reg, B_reg, C_reg, D_reg, E_reg, F_reg, G_reg, H_reg : std_logic_vector(31 downto 0);
	--    signal Kt, Wt : std_logic_vector(31 downto 0);
--	signal Wt : std_logic_vector(31 downto 0);
	signal SIG0, SIG1, CH, MAJ : std_logic_vector(31 downto 0);
	signal A_reg_next, E_reg_next, RESTOFSTUFF : std_logic_vector(31 downto 0);

	type constant_array is array(0 to 63) of std_logic_vector(31 downto 0);
	constant Kt : constant_array := ( x"428a2f98", x"71374491", x"b5c0fbcf", x"e9b5dba5",
	x"3956c25b", x"59f111f1", x"923f82a4", x"ab1c5ed5", x"d807aa98", x"12835b01",
	x"243185be", x"550c7dc3", x"72be5d74", x"80deb1fe", x"9bdc06a7", x"c19bf174",
	x"e49b69c1", x"efbe4786", x"0fc19dc6", x"240ca1cc", x"2de92c6f", x"4a7484aa",
	x"5cb0a9dc", x"76f988da", x"983e5152", x"a831c66d", x"b00327c8", x"bf597fc7",
	x"c6e00bf3", x"d5a79147", x"06ca6351", x"14292967", x"27b70a85", x"2e1b2138",
	x"4d2c6dfc", x"53380d13", x"650a7354", x"766a0abb", x"81c2c92e", x"92722c85",
	x"a2bfe8a1", x"a81a664b", x"c24b8b70", x"c76c51a3", x"d192e819", x"d6990624",
	x"f40e3585", x"106aa070", x"19a4c116", x"1e376c08", x"2748774c", x"34b0bcb5",
	x"391c0cb3", x"4ed8aa4a", x"5b9cca4f", x"682e6ff3", x"748f82ee", x"78a5636f",
	x"84c87814", x"8cc70208", x"90befffa", x"a4506ceb", x"bef9a3f7", x"c67178f2"
	);
	
	type std_logic_vector_array is array (0 to 63) of std_logic_vector(31 downto 0);
	signal Wt_schedule : std_logic_vector_array;

begin

	

    process (CLK)
    begin
        if rising_edge(CLK) then
            if LD = '1' then
                -- Load initial values
                A_reg <= A_i;
                B_reg <= B_i;
                C_reg <= C_i;
                D_reg <= D_i;
                E_reg <= E_i;
                F_reg <= F_i;
                G_reg <= G_i;
                H_reg <= H_i;
            else
                -- Update values based on SHA-256 algorithm
                -- (Operations implemented outside the process block)

                H_reg <= G_reg;
                G_reg <= F_reg;
                F_reg <= E_reg;
                E_reg <= E_reg_next;
                D_reg <= C_reg;
                C_reg <= B_reg;
                B_reg <= A_reg;
                A_reg <= A_reg_next;

                -- For example:
                -- Kt <= Some_Value;
                -- Wt <= Some_Value;
            end if;
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

    -- Additions
    process(CH, Kt, Wt, SIG1, SIG0, MAJ, CLK)
    begin -- Shifter

        RESTOFSTUFF <= std_logic_vector(unsigned(CH) + unsigned(H_reg) + unsigned(Kt) + unsigned(Wt) + unsigned(SIG1));

        A_reg_next <= std_logic_vector(unsigned(SIG0) + unsigned(MAJ) + unsigned(RESTOFSTUFF));
        E_reg_next <= std_logic_vector(unsigned(D_reg) + unsigned(RESTOFSTUFF));
            
    end process;

    

    -- Output ports
    A_o <= A_reg;
    B_o <= B_reg;
    C_o <= C_reg;
    D_o <= D_reg;
    E_o <= E_reg;
    F_o <= F_reg;
    G_o <= G_reg;
    H_o <= H_reg;

end Behavioral;



entity g31_Message_Schedule is
    port (
        M_i : in std_logic_vector(31 downto 0);
        LD_i : in std_logic;
        Wt_o : out std_logic_vector(31 downto 0);
        CLK : in std_logic
    );
end g31_Message_Schedule;

architecture Behavioral of g31_Message_Schedule is
    signal Wt_reg : std_logic_vector(31 downto 0);
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
            if LD_i = '1' then
                Wt_reg <= M_i;
            else
                -- Implement the logic to generate the message schedule
                -- based on the previous Wt and the hashing algorithm
            end if;
        end if;
    end process;

    Wt_o <= Wt_reg;
end Behavioral;

