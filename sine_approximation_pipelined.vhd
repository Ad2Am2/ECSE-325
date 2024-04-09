library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sine_approximation_pipelined is
port(
  clock   : in std_logic;
  i       : in std_logic_vector (15 downto 0);
  result  : out std_logic_vector (15 downto 0)
  --ecursion: out std_logic_vector(31 downto 0)
);
end sine_approximation_pipelined;

architecture no_pipeline of sine_approximation_pipelined is

signal reg_out,reg_in  : std_logic_vector(15 downto 0);
signal reg_1,reg_2,reg_3,reg_4,reg_5,reg_6,reg_7   : std_logic_vector(31 downto 0);
signal next_1, next_2, next_3, next_4, next_5, next_6, next_7 : std_logic_vector(31 downto 0);
signal i_reg_1, i_reg_2, i_reg_3, i_reg_4, i_reg_5  : std_logic_vector(31 downto 0);
signal i_change : std_logic_vector(31 downto 0);
signal A1, B1, C1 : std_logic_vector(31 downto 0);
signal tmp1_1, tmp1_2, tmp1_3, tmp1_4,tmp1_6     : std_logic_vector(63 downto 0);
signal tmp2_1, tmp2_2                            : std_logic_vector(31 downto 0);

begin

update : process(clock)
begin
  if (clock'event and rising_edge(clock)) then
    reg_1 <= next_1;
    reg_2 <= next_2;
    reg_3 <= next_3;
    reg_4 <= next_4;
    reg_5 <= next_5;
    reg_6 <= next_6;
    reg_7 <= next_7;
    i_reg_5 <= i_reg_4;
    i_reg_4 <= i_reg_3;
    i_reg_3 <= i_reg_2;
    i_reg_2 <= i_reg_1;
    i_reg_1 <= i_change;

  end if;
end process;

A1 <= X"C8EC8A4B"; -- Hexadecimal representation
B1 <= X"A3B2292C"; -- Hexadecimal representation
C1 <= X"00047645"; -- Hexadecimal representation

i_change <= std_logic_vector(resize(unsigned(i), 32));
tmp1_1 <= std_logic_vector(unsigned(C1)*unsigned(i_change));
next_1 <= "0000000000000"&tmp1_1(31 downto 13);


tmp1_2 <= std_logic_vector(unsigned(reg_1)*unsigned(i_reg_1));
next_2 <= std_logic_vector(unsigned(B1)-unsigned("000"&tmp1_2(31 downto 3)));

tmp1_3 <= std_logic_vector(unsigned(i_reg_2)*(unsigned("0000000000000"&reg_2(31 downto 13))));
next_3 <= tmp1_3(31 downto 0);


tmp1_4 <= std_logic_vector(unsigned(i_reg_3)*(unsigned("0000000000000"&reg_3(31 downto 13))));
next_4 <= tmp1_4(31 downto 0);

next_5 <= std_logic_vector(unsigned(A1)-unsigned("0"&reg_4(31 downto 1)));

tmp1_6 <= std_logic_vector(unsigned(i_reg_5)*unsigned("0000000000000"&reg_5(31 downto 13)));
next_6 <= tmp1_6(31 downto 0);

tmp2_1 <= std_logic_vector(to_unsigned(1,32));
tmp2_2 <= std_logic_vector(unsigned(reg_6)+unsigned(tmp2_1(13 downto 0)&"000000000000000000"));
next_7 <= std_logic_vector(resize(unsigned(('0' & tmp2_2(31)) & tmp2_2(31 downto 18)), 32));


result <= reg_7(15 downto 0);
end no_pipeline;