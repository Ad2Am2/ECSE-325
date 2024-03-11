--
-- entity name: SIG_CH_MAJ  --
-- Version 1.0

-- Use separate PROCESS blocks within the design entity to describe each 
-- function’s operation. These are purely combinational circuits, so there is no 
-- clock signal.

-- Using the following form for the entity declaration (replace the values in the header with 
-- your own information), write the complete VHDL entity description for a circuit that 
-- implements the SIG0, SIG1, CH, and MAJ operations.5


library ieee; -- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- needed if you are using unsigned rotate operations

entity g31_SIG_CH_MAJ is 
    port ( A_o, B_o, C_o, E_o, F_o, G_o  : in std_logic_vector(31 downto 0);        
    SIG0, SIG1, CH, MAJ           : out std_logic_vector(31 downto 0)
); 
end g31_SIG_CH_MAJ;

architecture Behavioral of g31_SIG_CH_MAJ is
    signal ror2, ror6, ror11, ror13, ror22, ror25, xor1, xor2 : std_logic_vector(31 downto 0);

    begin
        process (A_o, ror2, ror13, ror22, xor1)
        begin
            -- Implement SIG0 logic
				ror2 <= std_logic_vector(rotate_right(unsigned(A_o), 2));
            ror13 <= std_logic_vector(rotate_right(unsigned(A_o), 13));
            ror22 <= std_logic_vector(rotate_right(unsigned(A_o), 22));

            xor1 <= ror2 xor ror13;

            SIG0 <= xor1 xor ror22;
            
        end process;
    
        process (E_o, ror6, ror11, xor2, ror25)
        begin
            -- Implement SIG1 logic
				ror6 <= std_logic_vector(rotate_right(unsigned(E_o), 6));
            ror11 <= std_logic_vector(rotate_right(unsigned(E_o), 11));
            ror25 <= std_logic_vector(rotate_right(unsigned(E_o), 25));

            xor2 <= ror6 xor ror11;

            SIG1 <= xor2 xor ror25;
        end process;
    
        process (E_o, F_o, G_o)
        begin
            -- Implement CH logic
            CH <= (E_o and F_o) xor (not E_o and G_o);
        end process;
    
        process (A_o, B_o, C_o)
        begin
            -- Implement MAJ logic
            MAJ <= ((A_o and B_o) xor (B_o and C_o)) xor (A_o and C_o);
        end process;
    end Behavioral;