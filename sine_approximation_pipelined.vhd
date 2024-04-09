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
signal pipe_1, pipe_2, pipe_3, pipe_4, pipe_5, pipe_6, pipe_7 : std_logic_vector(31 downto 0);
signal angle_reg_1, angle_reg_2, angle_reg_3, angle_reg_4, angle_reg_5  : std_logic_vector(31 downto 0);
signal angle_change : std_logic_vector(31 downto 0);
signal A1, B1, C1 : std_logic_vector(31 downto 0);
signal temp1, temp2, temp3, temp4,temp6 : std_logic_vector(63 downto 0);
signal temp2_1, temp2_2 : std_logic_vector(31 downto 0);

begin

update : process(clock)
begin
  if (clock'event and rising_edge(clock)) then
    reg_1 <= pipe_1;
    reg_2 <= pipe_2;
    reg_3 <= pipe_3;
    reg_4 <= pipe_4;
    reg_5 <= pipe_5;
    reg_6 <= pipe_6;
    reg_7 <= pipe_7;
    angle_reg_5 <= angle_reg_4;
    angle_reg_4 <= angle_reg_3;
    angle_reg_3 <= angle_reg_2;
    angle_reg_2 <= angle_reg_1;
    angle_reg_1 <= angle_change;

  end if;
end process;

A1 <= X"C8EC8A4B"; -- Hexadecimal representation
B1 <= X"A3B2292C"; -- Hexadecimal representation
C1 <= X"00047645"; -- Hexadecimal representation

angle_change <= std_logic_vector(resize(unsigned(i), 32));
temp1 <= std_logic_vector(unsigned(C1)*unsigned(angle_change));
pipe_1 <= "0000000000000"&temp1(31 downto 13);


temp2 <= std_logic_vector(unsigned(reg_1)*unsigned(angle_reg_1));
pipe_2 <= std_logic_vector(unsigned(B1)-unsigned("000"&temp2(31 downto 3)));

temp3 <= std_logic_vector(unsigned(angle_reg_2)*(unsigned("0000000000000"&reg_2(31 downto 13))));
pipe_3 <= temp3(31 downto 0);


temp4 <= std_logic_vector(unsigned(angle_reg_3)*(unsigned("0000000000000"&reg_3(31 downto 13))));
pipe_4 <= temp4(31 downto 0);

pipe_5 <= std_logic_vector(unsigned(A1)-unsigned("0"&reg_4(31 downto 1)));

temp6 <= std_logic_vector(unsigned(angle_reg_5)*unsigned("0000000000000"&reg_5(31 downto 13)));
pipe_6 <= temp6(31 downto 0);

temp2_1 <= std_logic_vector(to_unsigned(1,32));
temp2_2 <= std_logic_vector(unsigned(reg_6)+unsigned(temp2_1(13 downto 0)&"000000000000000000"));
pipe_7 <= std_logic_vector(resize(unsigned(('0' & temp2_2(31)) & temp2_2(31 downto 18)), 32));


result <= reg_7(15 downto 0);
end no_pipeline;