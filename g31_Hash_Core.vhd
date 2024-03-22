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
    port ( A_o, B_o, C_o, D_o, E_o, F_o, G_o, H_o : inout std_logic_vector(31 downto 0);
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
    signal Kt, Wt : std_logic_vector(31 downto 0);
    signal RESTOFSHIT : std_logic_vector(31 downto 0);

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
    process
    begin
        if not LD = '1' then

            RESTOFSHIT <= std_logic_vector(unsigned(CH) + unsigned(H_reg) + unsigned(Kt) + unsigned(Wt) + unsigned(SIG1));

            

            A_reg <= std_logic_vector(unsigned(SIG0) + unsigned(MAJ) + unsigned(RESTOFSHIT));
            B_reg <= A_reg;
            C_reg <= B_reg;
            D_reg <= C_reg;
            E_reg <= std_logic_vector(unsigned(D_reg) + unsigned(RESTOFSHIT));
            F_reg <= E_reg;
            G_reg <= F_reg;
            H_reg <= G_reg;

            
        end if;
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

