library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FPSin is
    Port (
        i : in signed(15 downto 0);
        sin_out : out signed(15 downto 0)
    );
end FPSin;

architecture Behavioral of FPSin is

    -- Constants defined as in C code
    constant A1 : unsigned(31 downto 0) := to_unsigned(3370945099, 32);
    constant B1 : unsigned(31 downto 0) := to_unsigned(2746362156, 32);
    constant C1 : unsigned(31 downto 0) := to_unsigned(292421, 32);

    constant n : integer := 13;
    constant p : integer := 32;
    constant q : integer := 31;
    constant r : integer := 3;
    constant a : integer := 12;

    -- Signal declaration
    signal y : unsigned(31 downto 0);

begin

    process(i)
    begin
        -- Calculate y = (C1 * i) >> n
        y <= resize(C1 * unsigned(i), y'length) srl n;

        -- Calculate y = B1 - ((i * y) >> r)
        y <= resize(B1 - (unsigned(i) * y) srl r, y'length);

        -- Calculate y = i * (y >> n)
        y <= resize(unsigned(i) * (y srl n), y'length);

        -- Calculate y = A1 - (y >> (p - q))
        y <= resize(A1 - (y srl (p - q)), y'length);

        -- Calculate y = (y + (1 << (q - a - 1))) >> (q - a) (Rounding)
        y <= resize((y + to_unsigned(2**(q - a - 1), y'length)) srl (q - a), y'length);

        -- Output the result
        sin_out <= signed(y);
    end process;

end Behavioral;