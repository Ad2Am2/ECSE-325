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

    constant n : unsigned(31 downto 0) := "00000000000000000000000000001101"; -- 13
    constant p : unsigned(31 downto 0) := "00000000000000000000000000100000"; -- 32
    constant q : unsigned(31 downto 0) := "00000000000000000000000000011111"; -- 31
    constant r : unsigned(31 downto 0) := "00000000000000000000000000000011"; -- 3
    constant a : unsigned(31 downto 0) := "00000000000000000000000000001100"; -- 12

    constant one : unsigned(31 downto 0) := X"00000001";
    
    signal angle_32 : unsigned(31 downto 0);
    signal result : unsigned(31 downto 0);
	 signal result1, result2, result3, result4, result5, result6 : unsigned(31 downto 0);

begin
    process(clk)
    begin
        if rising_edge(clk) then
            angle_32 <= resize(angle, 32); -- Resizing for 32-bit computation
        end if;
    end process;

    -- Implementation of the given formula
    -- result <= (angle_32 * (A1 - ((2**(q-p)) * angle_32 * (angle_32 srl n) * (B1 - ((angle_32 srl (n+r)) * C1 * (angle_32 srl n)))))) srl (n+q-a);

    result1 <= resize(unsigned(rotate_right((C1 * angle_32), 13)), 32);
    result2 <= resize(B1 - unsigned(rotate_right((angle_32 * result1), 3)), 32);
    result3 <= resize(angle_32 * unsigned(rotate_right(result2, 13)), 32);
    result4 <= resize(angle_32 * unsigned(rotate_right(result3, 13)), 32);
    result5 <= resize(A1 - unsigned(rotate_left(result4, 1)), 32);
    result6 <= resize(angle_32 * unsigned(rotate_right(result5, 13)), 32);
    result <= resize(unsigned(rotate_right((result6 + unsigned(rotate_left(one, 18))), (19))), 32);
	 

	 
	 
    -- Output assignment
    process(clk)
    begin
        if rising_edge(clk) then
            -- Adjust the output to fit the expected 13-bit format by scaling down the result appropriately
            sine_out <= resize(rotate_right(result, 20), 13);
        end if;
    end process;
end Behavioral;
