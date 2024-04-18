LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity g31_Message_Scheduler is
 port (
	CLK : in std_logic;
	M_i : in std_logic_vector(31 downto 0);
	LD_i:	in std_logic;
	Wt_o:	out std_logic_vector(31 downto 0)
 );
end g31_Message_Scheduler;

architecture implementation of g31_Message_Scheduler is

signal reg_0, reg_1, reg_2, reg_3, reg_4, reg_5, reg_6, reg_7, reg_8, reg_9, reg_10, reg_11, reg_12, reg_13, reg_14, reg_15: std_logic_vector(31 downto 0);
signal Wt_out: std_logic_vector(31 downto 0);
signal sig0, sig1: std_logic_vector(31 downto 0);
signal temp: std_logic_vector(31 downto 0);

begin
	
	sig0 <= (std_logic_vector(rotate_right(unsigned(reg_14),7)) xor std_logic_vector(rotate_right(unsigned(reg_14), 18))) xor std_logic_vector(shift_right(unsigned(reg_14), 3));
	sig1 <= (std_logic_vector(rotate_right(unsigned(reg_1),17)) xor std_logic_vector(rotate_right(unsigned(reg_1), 19))) xor std_logic_vector(shift_right(unsigned(reg_1), 10));
			
	Wt_out <= sig1 AND reg_6 AND sig0 AND reg_15;
	
	process(LD_i, M_i, Wt_out)
	begin
		 if LD_i = '1' then
			  Wt_o <= M_i;
		 else
			  Wt_o <= Wt_out;
		 end if;
	end process;
	
	process(LD_i, M_i, Wt_out)
	begin
		 if LD_i = '1' then
			  temp <= M_i;
		 else
			  temp <= Wt_out;
		 end if;
	end process;
	
	process(CLK) 
	
	begin
	
		if(rising_edge(CLK)) 
		then	
		
		reg_15 <= reg_14;
		reg_14 <= reg_13;
		reg_13 <= reg_12;
		reg_12 <= reg_11;
		reg_11 <= reg_10;
		reg_10 <= reg_9;
		reg_9 <= reg_8;
		reg_8 <= reg_7;
		reg_7 <= reg_6;
		reg_6 <= reg_5;
		reg_5 <= reg_4;
		reg_4 <= reg_3;
		reg_3 <= reg_2;
		reg_2 <= reg_1;
		reg_1 <= reg_0;
		reg_0 <= temp;
		
		end if;
	end process;
		
end implementation;