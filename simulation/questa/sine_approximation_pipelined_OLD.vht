-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/02/2024 17:06:27"
                                                            
-- Vhdl Test Bench template for design  :  sine_approximation_pipelined
-- 
-- Simulation tool : QuestaSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY sine_approximation_pipelined_vhd_tst IS
END sine_approximation_pipelined_vhd_tst;
ARCHITECTURE sine_approximation_pipelined_arch OF sine_approximation_pipelined_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL angle : STD_LOGIC_VECTOR(12 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL sine_out : STD_LOGIC_VECTOR(12 DOWNTO 0);
COMPONENT sine_approximation_pipelined
	PORT (
	angle : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
	clk : IN STD_LOGIC;
	sine_out : BUFFER STD_LOGIC_VECTOR(12 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : sine_approximation_pipelined
	PORT MAP (
-- list connections between master ports and signals
	angle => angle,
	clk => clk,
	sine_out => sine_out
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END sine_approximation_pipelined_arch;
