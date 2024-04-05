library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sine_approximation_pipelined is
    Port ( clk : in STD_LOGIC;
           angle : in unsigned(12 downto 0); -- 13-bit unsigned input
           sine_out : out unsigned(12 downto 0)); -- 13-bit unsigned output
end sine_approximation_pipelined;

architecture Behavioral of sine_approximation_pipelined is
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

    signal z_reg_1,z_reg_2,z_reg_3,z_reg_4,z_reg_5,z_reg_6,z_reg_7   : unsigned(31 downto 0);
    signal result1, result2, result3, result4, result5, result6, result7 : unsigned(31 downto 0);
    signal angle_reg_1, angle_reg_2, angle_reg_3, angle_reg_4, angle_reg_5  : unsigned(31 downto 0);
    signal angle_change : unsigned(31 downto 0);
    signal tmp1_1, tmp1_2, tmp1_3, tmp1_4,tmp1_6     : unsigned(63 downto 0);
    signal tmp2_1, tmp2_2                            : unsigned(31 downto 0);
    
    signal angle_32 : unsigned(31 downto 0);
    signal result : unsigned(31 downto 0);

begin
    process(clk)
    begin
        if rising_edge(clk) then
            angle_32 <= resize(angle, 32); -- Resizing for 32-bit computation


            z_reg_1 <= result1;
            z_reg_2 <= result2;
            z_reg_3 <= result3;
            z_reg_4 <= result4;
            z_reg_5 <= result5;
            z_reg_6 <= result6;
            z_reg_7 <= result7;
            angle_reg_5 <= angle_reg_4;
            angle_reg_4 <= angle_reg_3;
            angle_reg_3 <= angle_reg_2;
            angle_reg_2 <= angle_reg_1;
            angle_reg_1 <= angle_change;

        end if;
    end process;

    angle_change <= angle_32;
    tmp1_1 <= unsigned(unsigned(C1)*unsigned(angle_change));
    result1 <= "0000000000000"&tmp1_1(31 downto 13);
    
    --angle_reg_1 <= angle_change;
    tmp1_2 <= unsigned(unsigned(z_reg_1)*unsigned(angle_reg_1));
    --tmp2 <= "000"&tmp1(31 downto 3);
    result2 <= unsigned(unsigned(B1)-unsigned("010"&tmp1_2(31 downto 3)));
    
    --angle_reg_2 <= angle_reg_1;
    tmp1_3 <= unsigned(unsigned(angle_reg_2)*(unsigned("0000000000000"&z_reg_2(31 downto 13))));
    result3 <= tmp1_3(31 downto 0);
    
    --angle_reg_3 <= angle_reg_2;
    tmp1_4 <= unsigned(unsigned(angle_reg_3)*(unsigned("0000000000000"&z_reg_3(31 downto 13))));
    result4 <= tmp1_4(31 downto 0);
    
    result5 <= unsigned(unsigned(A1)-unsigned("0"&z_reg_4(31 downto 1)));
    
    tmp1_6 <= unsigned(unsigned(angle_reg_5)*unsigned("0000000000000"&z_reg_5(31 downto 13)));
    result6 <= tmp1_6(31 downto 0);
    
    tmp2_1 <= unsigned(to_unsigned(1,32));
    tmp2_2 <= unsigned(unsigned(z_reg_6)+unsigned(tmp2_1(13 downto 0)&"000000000000000000"));
    result7 <= "0000000000000000000"&tmp2_2(31 downto 19);
    
    result <= z_reg_7;
    -- Output assignment
    process(clk)
    begin
        if rising_edge(clk) then
            -- Adjust the output to fit the expected 13-bit format by scaling down the result appropriately
            sine_out <= resize(rotate_right(result, 20), 13);
        end if;
    end process;
end Behavioral;
