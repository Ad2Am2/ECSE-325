library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sine_approximation is
    Port ( clk : in STD_LOGIC;
           angle : in unsigned(12 downto 0); -- 13-bit unsigned input
           sine_out : out unsigned(12 downto 0)); -- 13-bit unsigned output
end sine_approximation;

architecture Behavioral of sine_approximation is
    -- Constants definition
    constant A1 : unsigned(31 downto 0) := X"C8EC8A4B"; -- Hexadecimal representation
    constant B1 : unsigned(31 downto 0) := X"A3B2292C"; -- Hexadecimal representation
    constant C1 : unsigned(31 downto 0) := X"00047645"; -- Hexadecimal representation
    constant n : integer := 13;
    constant p : integer := 32;
    constant q : integer := 31;
    constant r : integer := 3;
    constant a : integer := 12;
    
    signal angle_32 : unsigned(31 downto 0);
    signal result : unsigned(31 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            angle_32 <= resize(angle, 32); -- Resizing for 32-bit computation
        end if;
    end process;

    -- Implementation of the given formula
    result <= (angle_32 * (A1 - ((2**(q-p)) * angle_32 * (angle_32 srl n) * (B1 - ((angle_32 srl (n+r)) * C1 * (angle_32 srl n)))))) srl (n+q-a);

    -- Output assignment
    process(clk)
    begin
        if rising_edge(clk) then
            -- Adjust the output to fit the expected 13-bit format by scaling down the result appropriately
            sine_out <= resize(result srl (32 - a), 13);
        end if;
    end process;
end Behavioral;
