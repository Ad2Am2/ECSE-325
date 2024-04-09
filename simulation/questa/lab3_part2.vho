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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

-- DATE "04/05/2024 13:38:22"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for QuestaSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	sine_approximation IS
    PORT (
	clk : IN std_logic;
	angle : IN std_logic_vector(12 DOWNTO 0);
	sine_out : BUFFER std_logic_vector(12 DOWNTO 0)
	);
END sine_approximation;

-- Design Ports Information
-- sine_out[0]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[1]	=>  Location: PIN_AJ4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[2]	=>  Location: PIN_AK4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[3]	=>  Location: PIN_AJ6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[4]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[5]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[6]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[7]	=>  Location: PIN_AH9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[8]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[9]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[10]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[11]	=>  Location: PIN_AJ5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sine_out[12]	=>  Location: PIN_AG2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[0]	=>  Location: PIN_AJ11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[1]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[2]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[3]	=>  Location: PIN_AG13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[4]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[5]	=>  Location: PIN_AJ7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[6]	=>  Location: PIN_AK2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[7]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[8]	=>  Location: PIN_AK7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[9]	=>  Location: PIN_AK6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[10]	=>  Location: PIN_AK3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[11]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- angle[12]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sine_approximation IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_angle : std_logic_vector(12 DOWNTO 0);
SIGNAL ww_sine_out : std_logic_vector(12 DOWNTO 0);
SIGNAL \Mult4~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult4~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult4~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult4~8_AX_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult4~8_AY_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Mult4~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult4~346_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult4~346_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult4~346_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult4~346_AX_bus\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \Mult4~346_AY_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult4~346_BX_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \Mult4~346_BY_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Mult4~346_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult3~mult_llmac_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult3~mult_llmac_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult3~mult_llmac_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult3~mult_llmac_AX_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult3~mult_llmac_AY_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Mult3~mult_llmac_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult2~mult_llmac_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult2~mult_llmac_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult2~mult_llmac_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult2~mult_llmac_AX_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult2~mult_llmac_AY_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Mult2~mult_llmac_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult3~383_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult3~383_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult3~383_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult3~383_AX_bus\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \Mult3~383_AY_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult3~383_BX_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \Mult3~383_BY_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Mult3~383_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult2~383_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult2~383_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult2~383_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult2~383_AX_bus\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \Mult2~383_AY_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult2~383_BX_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \Mult2~383_BY_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Mult2~383_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult1~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult1~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult1~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult1~8_AX_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult1~8_AY_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Mult1~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult1~349_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult1~349_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult1~349_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult1~349_AX_bus\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \Mult1~349_AY_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult1~349_BX_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \Mult1~349_BY_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Mult1~349_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult0~8_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult0~8_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult0~8_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult0~8_AX_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult0~8_AY_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult0~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult0~452_ACLR_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Mult0~452_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult0~452_ENA_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Mult0~452_AX_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \Mult0~452_AY_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult0~452_BX_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \Mult0~452_BY_bus\ : std_logic_vector(16 DOWNTO 0);
SIGNAL \Mult0~452_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult0~793_AX_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \Mult0~793_AY_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \Mult0~793_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult4~8_resulta\ : std_logic;
SIGNAL \Mult4~9\ : std_logic;
SIGNAL \Mult4~10\ : std_logic;
SIGNAL \Mult4~11\ : std_logic;
SIGNAL \Mult4~12\ : std_logic;
SIGNAL \Mult4~13\ : std_logic;
SIGNAL \Mult4~14\ : std_logic;
SIGNAL \Mult4~17\ : std_logic;
SIGNAL \Mult4~18\ : std_logic;
SIGNAL \Mult4~19\ : std_logic;
SIGNAL \Mult4~20\ : std_logic;
SIGNAL \Mult4~21\ : std_logic;
SIGNAL \Mult4~22\ : std_logic;
SIGNAL \Mult4~23\ : std_logic;
SIGNAL \Mult4~24\ : std_logic;
SIGNAL \Mult4~25\ : std_logic;
SIGNAL \Mult4~26\ : std_logic;
SIGNAL \Mult4~27\ : std_logic;
SIGNAL \Mult4~28\ : std_logic;
SIGNAL \Mult4~29\ : std_logic;
SIGNAL \Mult4~30\ : std_logic;
SIGNAL \Mult4~31\ : std_logic;
SIGNAL \Mult4~32\ : std_logic;
SIGNAL \Mult4~33\ : std_logic;
SIGNAL \Mult4~34\ : std_logic;
SIGNAL \Mult4~35\ : std_logic;
SIGNAL \Mult4~36\ : std_logic;
SIGNAL \Mult4~37\ : std_logic;
SIGNAL \Mult4~38\ : std_logic;
SIGNAL \Mult4~39\ : std_logic;
SIGNAL \Mult4~40\ : std_logic;
SIGNAL \Mult4~41\ : std_logic;
SIGNAL \Mult4~42\ : std_logic;
SIGNAL \Mult4~43\ : std_logic;
SIGNAL \Mult4~44\ : std_logic;
SIGNAL \Mult4~45\ : std_logic;
SIGNAL \Mult4~46\ : std_logic;
SIGNAL \Mult4~47\ : std_logic;
SIGNAL \Mult4~48\ : std_logic;
SIGNAL \Mult4~49\ : std_logic;
SIGNAL \Mult4~50\ : std_logic;
SIGNAL \Mult4~51\ : std_logic;
SIGNAL \Mult4~52\ : std_logic;
SIGNAL \Mult4~53\ : std_logic;
SIGNAL \Mult4~54\ : std_logic;
SIGNAL \Mult4~55\ : std_logic;
SIGNAL \Mult4~56\ : std_logic;
SIGNAL \Mult4~57\ : std_logic;
SIGNAL \Mult4~58\ : std_logic;
SIGNAL \Mult4~59\ : std_logic;
SIGNAL \Mult4~60\ : std_logic;
SIGNAL \Mult4~348\ : std_logic;
SIGNAL \Mult4~349\ : std_logic;
SIGNAL \Mult4~350\ : std_logic;
SIGNAL \Mult4~351\ : std_logic;
SIGNAL \Mult4~352\ : std_logic;
SIGNAL \Mult4~353\ : std_logic;
SIGNAL \Mult4~354\ : std_logic;
SIGNAL \Mult4~355\ : std_logic;
SIGNAL \Mult4~356\ : std_logic;
SIGNAL \Mult4~357\ : std_logic;
SIGNAL \Mult4~358\ : std_logic;
SIGNAL \Mult4~359\ : std_logic;
SIGNAL \Mult4~360\ : std_logic;
SIGNAL \Mult4~361\ : std_logic;
SIGNAL \Mult4~362\ : std_logic;
SIGNAL \Mult4~363\ : std_logic;
SIGNAL \Mult4~364\ : std_logic;
SIGNAL \Mult4~365\ : std_logic;
SIGNAL \Mult4~366\ : std_logic;
SIGNAL \Mult4~367\ : std_logic;
SIGNAL \Mult4~368\ : std_logic;
SIGNAL \Mult4~369\ : std_logic;
SIGNAL \Mult4~370\ : std_logic;
SIGNAL \Mult4~371\ : std_logic;
SIGNAL \Mult4~372\ : std_logic;
SIGNAL \Mult4~373\ : std_logic;
SIGNAL \Mult4~374\ : std_logic;
SIGNAL \Mult4~375\ : std_logic;
SIGNAL \Mult4~376\ : std_logic;
SIGNAL \Mult4~377\ : std_logic;
SIGNAL \Mult4~378\ : std_logic;
SIGNAL \Mult4~379\ : std_logic;
SIGNAL \Mult4~380\ : std_logic;
SIGNAL \Mult4~381\ : std_logic;
SIGNAL \Mult4~382\ : std_logic;
SIGNAL \Mult4~383\ : std_logic;
SIGNAL \Mult4~384\ : std_logic;
SIGNAL \Mult4~385\ : std_logic;
SIGNAL \Mult4~386\ : std_logic;
SIGNAL \Mult4~387\ : std_logic;
SIGNAL \Mult4~388\ : std_logic;
SIGNAL \Mult4~389\ : std_logic;
SIGNAL \Mult4~390\ : std_logic;
SIGNAL \Mult4~391\ : std_logic;
SIGNAL \Mult4~392\ : std_logic;
SIGNAL \Mult4~393\ : std_logic;
SIGNAL \Mult4~394\ : std_logic;
SIGNAL \Mult4~395\ : std_logic;
SIGNAL \Mult4~396\ : std_logic;
SIGNAL \Mult4~397\ : std_logic;
SIGNAL \Mult4~398\ : std_logic;
SIGNAL \Mult4~399\ : std_logic;
SIGNAL \Mult4~400\ : std_logic;
SIGNAL \Mult4~401\ : std_logic;
SIGNAL \Mult4~402\ : std_logic;
SIGNAL \Mult4~403\ : std_logic;
SIGNAL \Mult4~404\ : std_logic;
SIGNAL \Mult4~405\ : std_logic;
SIGNAL \Mult4~406\ : std_logic;
SIGNAL \Mult4~407\ : std_logic;
SIGNAL \Mult4~408\ : std_logic;
SIGNAL \Mult4~409\ : std_logic;
SIGNAL \Mult3~22\ : std_logic;
SIGNAL \Mult3~23\ : std_logic;
SIGNAL \Mult3~24\ : std_logic;
SIGNAL \Mult3~25\ : std_logic;
SIGNAL \Mult3~26\ : std_logic;
SIGNAL \Mult3~27\ : std_logic;
SIGNAL \Mult3~28\ : std_logic;
SIGNAL \Mult3~29\ : std_logic;
SIGNAL \Mult3~30\ : std_logic;
SIGNAL \Mult3~31\ : std_logic;
SIGNAL \Mult3~32\ : std_logic;
SIGNAL \Mult3~33\ : std_logic;
SIGNAL \Mult3~34\ : std_logic;
SIGNAL \Mult3~35\ : std_logic;
SIGNAL \Mult3~36\ : std_logic;
SIGNAL \Mult3~37\ : std_logic;
SIGNAL \Mult3~38\ : std_logic;
SIGNAL \Mult3~39\ : std_logic;
SIGNAL \Mult3~40\ : std_logic;
SIGNAL \Mult3~41\ : std_logic;
SIGNAL \Mult3~42\ : std_logic;
SIGNAL \Mult3~43\ : std_logic;
SIGNAL \Mult3~44\ : std_logic;
SIGNAL \Mult3~45\ : std_logic;
SIGNAL \Mult3~46\ : std_logic;
SIGNAL \Mult3~47\ : std_logic;
SIGNAL \Mult3~48\ : std_logic;
SIGNAL \Mult3~49\ : std_logic;
SIGNAL \Mult3~50\ : std_logic;
SIGNAL \Mult3~51\ : std_logic;
SIGNAL \Mult3~52\ : std_logic;
SIGNAL \Mult3~53\ : std_logic;
SIGNAL \Mult2~22\ : std_logic;
SIGNAL \Mult2~23\ : std_logic;
SIGNAL \Mult2~24\ : std_logic;
SIGNAL \Mult2~25\ : std_logic;
SIGNAL \Mult2~26\ : std_logic;
SIGNAL \Mult2~27\ : std_logic;
SIGNAL \Mult2~28\ : std_logic;
SIGNAL \Mult2~29\ : std_logic;
SIGNAL \Mult2~30\ : std_logic;
SIGNAL \Mult2~31\ : std_logic;
SIGNAL \Mult2~32\ : std_logic;
SIGNAL \Mult2~33\ : std_logic;
SIGNAL \Mult2~34\ : std_logic;
SIGNAL \Mult2~35\ : std_logic;
SIGNAL \Mult2~36\ : std_logic;
SIGNAL \Mult2~37\ : std_logic;
SIGNAL \Mult2~38\ : std_logic;
SIGNAL \Mult2~39\ : std_logic;
SIGNAL \Mult2~40\ : std_logic;
SIGNAL \Mult2~41\ : std_logic;
SIGNAL \Mult2~42\ : std_logic;
SIGNAL \Mult2~43\ : std_logic;
SIGNAL \Mult2~44\ : std_logic;
SIGNAL \Mult2~45\ : std_logic;
SIGNAL \Mult2~46\ : std_logic;
SIGNAL \Mult2~47\ : std_logic;
SIGNAL \Mult2~48\ : std_logic;
SIGNAL \Mult2~49\ : std_logic;
SIGNAL \Mult2~50\ : std_logic;
SIGNAL \Mult2~51\ : std_logic;
SIGNAL \Mult2~52\ : std_logic;
SIGNAL \Mult2~53\ : std_logic;
SIGNAL \Mult3~397\ : std_logic;
SIGNAL \Mult3~398\ : std_logic;
SIGNAL \Mult3~399\ : std_logic;
SIGNAL \Mult3~400\ : std_logic;
SIGNAL \Mult3~401\ : std_logic;
SIGNAL \Mult3~402\ : std_logic;
SIGNAL \Mult3~403\ : std_logic;
SIGNAL \Mult3~404\ : std_logic;
SIGNAL \Mult3~405\ : std_logic;
SIGNAL \Mult3~406\ : std_logic;
SIGNAL \Mult3~407\ : std_logic;
SIGNAL \Mult3~408\ : std_logic;
SIGNAL \Mult3~409\ : std_logic;
SIGNAL \Mult3~410\ : std_logic;
SIGNAL \Mult3~411\ : std_logic;
SIGNAL \Mult3~412\ : std_logic;
SIGNAL \Mult3~413\ : std_logic;
SIGNAL \Mult3~414\ : std_logic;
SIGNAL \Mult3~415\ : std_logic;
SIGNAL \Mult3~416\ : std_logic;
SIGNAL \Mult3~417\ : std_logic;
SIGNAL \Mult3~418\ : std_logic;
SIGNAL \Mult3~419\ : std_logic;
SIGNAL \Mult3~420\ : std_logic;
SIGNAL \Mult3~421\ : std_logic;
SIGNAL \Mult3~422\ : std_logic;
SIGNAL \Mult3~423\ : std_logic;
SIGNAL \Mult3~424\ : std_logic;
SIGNAL \Mult3~425\ : std_logic;
SIGNAL \Mult3~426\ : std_logic;
SIGNAL \Mult3~427\ : std_logic;
SIGNAL \Mult3~428\ : std_logic;
SIGNAL \Mult3~429\ : std_logic;
SIGNAL \Mult3~430\ : std_logic;
SIGNAL \Mult3~431\ : std_logic;
SIGNAL \Mult3~432\ : std_logic;
SIGNAL \Mult3~433\ : std_logic;
SIGNAL \Mult3~434\ : std_logic;
SIGNAL \Mult3~435\ : std_logic;
SIGNAL \Mult3~436\ : std_logic;
SIGNAL \Mult3~437\ : std_logic;
SIGNAL \Mult3~438\ : std_logic;
SIGNAL \Mult3~439\ : std_logic;
SIGNAL \Mult3~440\ : std_logic;
SIGNAL \Mult3~441\ : std_logic;
SIGNAL \Mult3~442\ : std_logic;
SIGNAL \Mult3~443\ : std_logic;
SIGNAL \Mult3~444\ : std_logic;
SIGNAL \Mult3~445\ : std_logic;
SIGNAL \Mult3~446\ : std_logic;
SIGNAL \Mult2~397\ : std_logic;
SIGNAL \Mult2~398\ : std_logic;
SIGNAL \Mult2~399\ : std_logic;
SIGNAL \Mult2~400\ : std_logic;
SIGNAL \Mult2~401\ : std_logic;
SIGNAL \Mult2~402\ : std_logic;
SIGNAL \Mult2~403\ : std_logic;
SIGNAL \Mult2~404\ : std_logic;
SIGNAL \Mult2~405\ : std_logic;
SIGNAL \Mult2~406\ : std_logic;
SIGNAL \Mult2~407\ : std_logic;
SIGNAL \Mult2~408\ : std_logic;
SIGNAL \Mult2~409\ : std_logic;
SIGNAL \Mult2~410\ : std_logic;
SIGNAL \Mult2~411\ : std_logic;
SIGNAL \Mult2~412\ : std_logic;
SIGNAL \Mult2~413\ : std_logic;
SIGNAL \Mult2~414\ : std_logic;
SIGNAL \Mult2~415\ : std_logic;
SIGNAL \Mult2~416\ : std_logic;
SIGNAL \Mult2~417\ : std_logic;
SIGNAL \Mult2~418\ : std_logic;
SIGNAL \Mult2~419\ : std_logic;
SIGNAL \Mult2~420\ : std_logic;
SIGNAL \Mult2~421\ : std_logic;
SIGNAL \Mult2~422\ : std_logic;
SIGNAL \Mult2~423\ : std_logic;
SIGNAL \Mult2~424\ : std_logic;
SIGNAL \Mult2~425\ : std_logic;
SIGNAL \Mult2~426\ : std_logic;
SIGNAL \Mult2~427\ : std_logic;
SIGNAL \Mult2~428\ : std_logic;
SIGNAL \Mult2~429\ : std_logic;
SIGNAL \Mult2~430\ : std_logic;
SIGNAL \Mult2~431\ : std_logic;
SIGNAL \Mult2~432\ : std_logic;
SIGNAL \Mult2~433\ : std_logic;
SIGNAL \Mult2~434\ : std_logic;
SIGNAL \Mult2~435\ : std_logic;
SIGNAL \Mult2~436\ : std_logic;
SIGNAL \Mult2~437\ : std_logic;
SIGNAL \Mult2~438\ : std_logic;
SIGNAL \Mult2~439\ : std_logic;
SIGNAL \Mult2~440\ : std_logic;
SIGNAL \Mult2~441\ : std_logic;
SIGNAL \Mult2~442\ : std_logic;
SIGNAL \Mult2~443\ : std_logic;
SIGNAL \Mult2~444\ : std_logic;
SIGNAL \Mult2~445\ : std_logic;
SIGNAL \Mult2~446\ : std_logic;
SIGNAL \Mult1~8_resulta\ : std_logic;
SIGNAL \Mult1~9\ : std_logic;
SIGNAL \Mult1~10\ : std_logic;
SIGNAL \Mult1~43\ : std_logic;
SIGNAL \Mult1~44\ : std_logic;
SIGNAL \Mult1~45\ : std_logic;
SIGNAL \Mult1~46\ : std_logic;
SIGNAL \Mult1~47\ : std_logic;
SIGNAL \Mult1~48\ : std_logic;
SIGNAL \Mult1~49\ : std_logic;
SIGNAL \Mult1~50\ : std_logic;
SIGNAL \Mult1~51\ : std_logic;
SIGNAL \Mult1~52\ : std_logic;
SIGNAL \Mult1~53\ : std_logic;
SIGNAL \Mult1~54\ : std_logic;
SIGNAL \Mult1~55\ : std_logic;
SIGNAL \Mult1~56\ : std_logic;
SIGNAL \Mult1~57\ : std_logic;
SIGNAL \Mult1~58\ : std_logic;
SIGNAL \Mult1~59\ : std_logic;
SIGNAL \Mult1~60\ : std_logic;
SIGNAL \Mult1~61\ : std_logic;
SIGNAL \Mult1~62\ : std_logic;
SIGNAL \Mult1~63\ : std_logic;
SIGNAL \Mult1~64\ : std_logic;
SIGNAL \Mult1~65\ : std_logic;
SIGNAL \Mult1~66\ : std_logic;
SIGNAL \Mult1~67\ : std_logic;
SIGNAL \Mult1~68\ : std_logic;
SIGNAL \Mult1~69\ : std_logic;
SIGNAL \Mult1~70\ : std_logic;
SIGNAL \Mult1~71\ : std_logic;
SIGNAL \Mult1~366\ : std_logic;
SIGNAL \Mult1~367\ : std_logic;
SIGNAL \Mult1~368\ : std_logic;
SIGNAL \Mult1~369\ : std_logic;
SIGNAL \Mult1~370\ : std_logic;
SIGNAL \Mult1~371\ : std_logic;
SIGNAL \Mult1~372\ : std_logic;
SIGNAL \Mult1~373\ : std_logic;
SIGNAL \Mult1~374\ : std_logic;
SIGNAL \Mult1~375\ : std_logic;
SIGNAL \Mult1~376\ : std_logic;
SIGNAL \Mult1~377\ : std_logic;
SIGNAL \Mult1~378\ : std_logic;
SIGNAL \Mult1~379\ : std_logic;
SIGNAL \Mult1~380\ : std_logic;
SIGNAL \Mult1~381\ : std_logic;
SIGNAL \Mult1~382\ : std_logic;
SIGNAL \Mult1~383\ : std_logic;
SIGNAL \Mult1~384\ : std_logic;
SIGNAL \Mult1~385\ : std_logic;
SIGNAL \Mult1~386\ : std_logic;
SIGNAL \Mult1~387\ : std_logic;
SIGNAL \Mult1~388\ : std_logic;
SIGNAL \Mult1~389\ : std_logic;
SIGNAL \Mult1~390\ : std_logic;
SIGNAL \Mult1~391\ : std_logic;
SIGNAL \Mult1~392\ : std_logic;
SIGNAL \Mult1~393\ : std_logic;
SIGNAL \Mult1~394\ : std_logic;
SIGNAL \Mult1~395\ : std_logic;
SIGNAL \Mult1~396\ : std_logic;
SIGNAL \Mult1~397\ : std_logic;
SIGNAL \Mult1~398\ : std_logic;
SIGNAL \Mult1~399\ : std_logic;
SIGNAL \Mult1~400\ : std_logic;
SIGNAL \Mult1~401\ : std_logic;
SIGNAL \Mult1~402\ : std_logic;
SIGNAL \Mult1~403\ : std_logic;
SIGNAL \Mult1~404\ : std_logic;
SIGNAL \Mult1~405\ : std_logic;
SIGNAL \Mult1~406\ : std_logic;
SIGNAL \Mult1~407\ : std_logic;
SIGNAL \Mult1~408\ : std_logic;
SIGNAL \Mult1~409\ : std_logic;
SIGNAL \Mult1~410\ : std_logic;
SIGNAL \Mult1~411\ : std_logic;
SIGNAL \Mult1~412\ : std_logic;
SIGNAL \Mult0~8_resulta\ : std_logic;
SIGNAL \Mult0~9\ : std_logic;
SIGNAL \Mult0~10\ : std_logic;
SIGNAL \Mult0~11\ : std_logic;
SIGNAL \Mult0~12\ : std_logic;
SIGNAL \Mult0~13\ : std_logic;
SIGNAL \Mult0~14\ : std_logic;
SIGNAL \Mult0~15\ : std_logic;
SIGNAL \Mult0~16\ : std_logic;
SIGNAL \Mult0~17\ : std_logic;
SIGNAL \Mult0~18\ : std_logic;
SIGNAL \Mult0~19\ : std_logic;
SIGNAL \Mult0~20\ : std_logic;
SIGNAL \Mult0~39\ : std_logic;
SIGNAL \Mult0~40\ : std_logic;
SIGNAL \Mult0~41\ : std_logic;
SIGNAL \Mult0~42\ : std_logic;
SIGNAL \Mult0~43\ : std_logic;
SIGNAL \Mult0~44\ : std_logic;
SIGNAL \Mult0~45\ : std_logic;
SIGNAL \Mult0~46\ : std_logic;
SIGNAL \Mult0~47\ : std_logic;
SIGNAL \Mult0~48\ : std_logic;
SIGNAL \Mult0~49\ : std_logic;
SIGNAL \Mult0~50\ : std_logic;
SIGNAL \Mult0~51\ : std_logic;
SIGNAL \Mult0~52\ : std_logic;
SIGNAL \Mult0~53\ : std_logic;
SIGNAL \Mult0~54\ : std_logic;
SIGNAL \Mult0~55\ : std_logic;
SIGNAL \Mult0~56\ : std_logic;
SIGNAL \Mult0~57\ : std_logic;
SIGNAL \Mult0~58\ : std_logic;
SIGNAL \Mult0~59\ : std_logic;
SIGNAL \Mult0~60\ : std_logic;
SIGNAL \Mult0~61\ : std_logic;
SIGNAL \Mult0~62\ : std_logic;
SIGNAL \Mult0~63\ : std_logic;
SIGNAL \Mult0~64\ : std_logic;
SIGNAL \Mult0~65\ : std_logic;
SIGNAL \Mult0~66\ : std_logic;
SIGNAL \Mult0~479\ : std_logic;
SIGNAL \Mult0~480\ : std_logic;
SIGNAL \Mult0~481\ : std_logic;
SIGNAL \Mult0~482\ : std_logic;
SIGNAL \Mult0~483\ : std_logic;
SIGNAL \Mult0~484\ : std_logic;
SIGNAL \Mult0~485\ : std_logic;
SIGNAL \Mult0~486\ : std_logic;
SIGNAL \Mult0~487\ : std_logic;
SIGNAL \Mult0~488\ : std_logic;
SIGNAL \Mult0~489\ : std_logic;
SIGNAL \Mult0~490\ : std_logic;
SIGNAL \Mult0~491\ : std_logic;
SIGNAL \Mult0~492\ : std_logic;
SIGNAL \Mult0~493\ : std_logic;
SIGNAL \Mult0~494\ : std_logic;
SIGNAL \Mult0~495\ : std_logic;
SIGNAL \Mult0~496\ : std_logic;
SIGNAL \Mult0~497\ : std_logic;
SIGNAL \Mult0~498\ : std_logic;
SIGNAL \Mult0~499\ : std_logic;
SIGNAL \Mult0~500\ : std_logic;
SIGNAL \Mult0~501\ : std_logic;
SIGNAL \Mult0~502\ : std_logic;
SIGNAL \Mult0~503\ : std_logic;
SIGNAL \Mult0~504\ : std_logic;
SIGNAL \Mult0~505\ : std_logic;
SIGNAL \Mult0~506\ : std_logic;
SIGNAL \Mult0~507\ : std_logic;
SIGNAL \Mult0~508\ : std_logic;
SIGNAL \Mult0~509\ : std_logic;
SIGNAL \Mult0~510\ : std_logic;
SIGNAL \Mult0~511\ : std_logic;
SIGNAL \Mult0~512\ : std_logic;
SIGNAL \Mult0~513\ : std_logic;
SIGNAL \Mult0~514\ : std_logic;
SIGNAL \Mult0~515\ : std_logic;
SIGNAL \Mult0~802\ : std_logic;
SIGNAL \Mult0~803\ : std_logic;
SIGNAL \Mult0~804\ : std_logic;
SIGNAL \Mult0~805\ : std_logic;
SIGNAL \Mult0~806\ : std_logic;
SIGNAL \Mult0~807\ : std_logic;
SIGNAL \Mult0~808\ : std_logic;
SIGNAL \Mult0~809\ : std_logic;
SIGNAL \Mult0~810\ : std_logic;
SIGNAL \Mult0~811\ : std_logic;
SIGNAL \Mult0~812\ : std_logic;
SIGNAL \Mult0~813\ : std_logic;
SIGNAL \Mult0~814\ : std_logic;
SIGNAL \Mult0~815\ : std_logic;
SIGNAL \Mult0~816\ : std_logic;
SIGNAL \Mult0~817\ : std_logic;
SIGNAL \Mult0~818\ : std_logic;
SIGNAL \Mult0~819\ : std_logic;
SIGNAL \Mult0~820\ : std_logic;
SIGNAL \Mult0~821\ : std_logic;
SIGNAL \Mult0~822\ : std_logic;
SIGNAL \Mult0~823\ : std_logic;
SIGNAL \Mult0~824\ : std_logic;
SIGNAL \Mult0~825\ : std_logic;
SIGNAL \Mult0~826\ : std_logic;
SIGNAL \Mult0~827\ : std_logic;
SIGNAL \Mult0~828\ : std_logic;
SIGNAL \Mult0~829\ : std_logic;
SIGNAL \Mult0~830\ : std_logic;
SIGNAL \Mult0~831\ : std_logic;
SIGNAL \Mult0~832\ : std_logic;
SIGNAL \Mult0~833\ : std_logic;
SIGNAL \Mult0~834\ : std_logic;
SIGNAL \Mult0~835\ : std_logic;
SIGNAL \Mult0~836\ : std_logic;
SIGNAL \Mult0~837\ : std_logic;
SIGNAL \Mult0~838\ : std_logic;
SIGNAL \Mult0~839\ : std_logic;
SIGNAL \Mult0~840\ : std_logic;
SIGNAL \Mult0~841\ : std_logic;
SIGNAL \Mult0~842\ : std_logic;
SIGNAL \Mult0~843\ : std_logic;
SIGNAL \Mult0~844\ : std_logic;
SIGNAL \Mult0~845\ : std_logic;
SIGNAL \Mult0~846\ : std_logic;
SIGNAL \Mult0~847\ : std_logic;
SIGNAL \Mult0~848\ : std_logic;
SIGNAL \Mult0~849\ : std_logic;
SIGNAL \Mult0~850\ : std_logic;
SIGNAL \Mult0~851\ : std_logic;
SIGNAL \Mult0~852\ : std_logic;
SIGNAL \Mult0~853\ : std_logic;
SIGNAL \Mult0~854\ : std_logic;
SIGNAL \Mult0~855\ : std_logic;
SIGNAL \Mult0~856\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \angle[0]~input_o\ : std_logic;
SIGNAL \angle[1]~input_o\ : std_logic;
SIGNAL \angle[2]~input_o\ : std_logic;
SIGNAL \angle[3]~input_o\ : std_logic;
SIGNAL \angle[4]~input_o\ : std_logic;
SIGNAL \angle[5]~input_o\ : std_logic;
SIGNAL \angle[6]~input_o\ : std_logic;
SIGNAL \angle[7]~input_o\ : std_logic;
SIGNAL \angle[8]~input_o\ : std_logic;
SIGNAL \angle[9]~input_o\ : std_logic;
SIGNAL \angle[10]~input_o\ : std_logic;
SIGNAL \angle[11]~input_o\ : std_logic;
SIGNAL \angle[12]~input_o\ : std_logic;
SIGNAL \Mult0~21\ : std_logic;
SIGNAL \Mult0~452_resulta\ : std_logic;
SIGNAL \Mult0~337_sumout\ : std_logic;
SIGNAL \Mult0~22\ : std_logic;
SIGNAL \Mult0~453\ : std_logic;
SIGNAL \Mult0~338\ : std_logic;
SIGNAL \Mult0~341_sumout\ : std_logic;
SIGNAL \Mult0~23\ : std_logic;
SIGNAL \Mult0~454\ : std_logic;
SIGNAL \Mult0~342\ : std_logic;
SIGNAL \Mult0~345_sumout\ : std_logic;
SIGNAL \Mult0~24\ : std_logic;
SIGNAL \Mult0~455\ : std_logic;
SIGNAL \Mult0~346\ : std_logic;
SIGNAL \Mult0~349_sumout\ : std_logic;
SIGNAL \Mult0~456\ : std_logic;
SIGNAL \Mult0~25\ : std_logic;
SIGNAL \Mult0~350\ : std_logic;
SIGNAL \Mult0~353_sumout\ : std_logic;
SIGNAL \Mult0~26\ : std_logic;
SIGNAL \Mult0~457\ : std_logic;
SIGNAL \Mult0~354\ : std_logic;
SIGNAL \Mult0~357_sumout\ : std_logic;
SIGNAL \Mult0~27\ : std_logic;
SIGNAL \Mult0~458\ : std_logic;
SIGNAL \Mult0~358\ : std_logic;
SIGNAL \Mult0~361_sumout\ : std_logic;
SIGNAL \Mult0~28\ : std_logic;
SIGNAL \Mult0~459\ : std_logic;
SIGNAL \Mult0~362\ : std_logic;
SIGNAL \Mult0~365_sumout\ : std_logic;
SIGNAL \Mult0~460\ : std_logic;
SIGNAL \Mult0~29\ : std_logic;
SIGNAL \Mult0~366\ : std_logic;
SIGNAL \Mult0~369_sumout\ : std_logic;
SIGNAL \Mult0~30\ : std_logic;
SIGNAL \Mult0~461\ : std_logic;
SIGNAL \Mult0~370\ : std_logic;
SIGNAL \Mult0~373_sumout\ : std_logic;
SIGNAL \Mult0~31\ : std_logic;
SIGNAL \Mult0~462\ : std_logic;
SIGNAL \Mult0~374\ : std_logic;
SIGNAL \Mult0~377_sumout\ : std_logic;
SIGNAL \Mult0~463\ : std_logic;
SIGNAL \Mult0~32\ : std_logic;
SIGNAL \Mult0~378\ : std_logic;
SIGNAL \Mult0~381_sumout\ : std_logic;
SIGNAL \Mult0~33\ : std_logic;
SIGNAL \Mult0~464\ : std_logic;
SIGNAL \Mult0~382\ : std_logic;
SIGNAL \Mult0~385_sumout\ : std_logic;
SIGNAL \Mult1~24\ : std_logic;
SIGNAL \Mult1~23\ : std_logic;
SIGNAL \Mult1~22\ : std_logic;
SIGNAL \Mult1~21\ : std_logic;
SIGNAL \Mult1~20\ : std_logic;
SIGNAL \Mult1~19\ : std_logic;
SIGNAL \Mult1~18\ : std_logic;
SIGNAL \Mult1~17\ : std_logic;
SIGNAL \Mult1~16\ : std_logic;
SIGNAL \Mult1~15\ : std_logic;
SIGNAL \Mult1~14\ : std_logic;
SIGNAL \Mult1~13\ : std_logic;
SIGNAL \Mult1~12\ : std_logic;
SIGNAL \Mult1~11\ : std_logic;
SIGNAL \Add0~126_cout\ : std_logic;
SIGNAL \Add0~127\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~83\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~87\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~91\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~95\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~99\ : std_logic;
SIGNAL \Add0~102\ : std_logic;
SIGNAL \Add0~103\ : std_logic;
SIGNAL \Add0~106\ : std_logic;
SIGNAL \Add0~107\ : std_logic;
SIGNAL \Add0~110\ : std_logic;
SIGNAL \Add0~111\ : std_logic;
SIGNAL \Add0~114\ : std_logic;
SIGNAL \Add0~115\ : std_logic;
SIGNAL \Add0~118\ : std_logic;
SIGNAL \Add0~119\ : std_logic;
SIGNAL \Add0~122\ : std_logic;
SIGNAL \Add0~123\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~75\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Mult1~25\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Mult0~465\ : std_logic;
SIGNAL \Mult0~34\ : std_logic;
SIGNAL \Mult0~386\ : std_logic;
SIGNAL \Mult0~389_sumout\ : std_logic;
SIGNAL \Mult0~35\ : std_logic;
SIGNAL \Mult0~466\ : std_logic;
SIGNAL \Mult0~390\ : std_logic;
SIGNAL \Mult0~393_sumout\ : std_logic;
SIGNAL \Mult0~467\ : std_logic;
SIGNAL \Mult0~36\ : std_logic;
SIGNAL \Mult0~394\ : std_logic;
SIGNAL \Mult0~397_sumout\ : std_logic;
SIGNAL \Mult0~468\ : std_logic;
SIGNAL \Mult0~37\ : std_logic;
SIGNAL \Mult0~398\ : std_logic;
SIGNAL \Mult0~401_sumout\ : std_logic;
SIGNAL \Mult0~38\ : std_logic;
SIGNAL \Mult0~469\ : std_logic;
SIGNAL \Mult0~402\ : std_logic;
SIGNAL \Mult0~405_sumout\ : std_logic;
SIGNAL \Mult0~793_resulta\ : std_logic;
SIGNAL \Mult0~470\ : std_logic;
SIGNAL \Mult0~406\ : std_logic;
SIGNAL \Mult0~409_sumout\ : std_logic;
SIGNAL \Mult0~794\ : std_logic;
SIGNAL \Mult0~471\ : std_logic;
SIGNAL \Mult0~410\ : std_logic;
SIGNAL \Mult0~413_sumout\ : std_logic;
SIGNAL \Mult0~795\ : std_logic;
SIGNAL \Mult0~472\ : std_logic;
SIGNAL \Mult0~414\ : std_logic;
SIGNAL \Mult0~417_sumout\ : std_logic;
SIGNAL \Mult0~796\ : std_logic;
SIGNAL \Mult0~473\ : std_logic;
SIGNAL \Mult0~418\ : std_logic;
SIGNAL \Mult0~421_sumout\ : std_logic;
SIGNAL \Mult0~474\ : std_logic;
SIGNAL \Mult0~797\ : std_logic;
SIGNAL \Mult0~422\ : std_logic;
SIGNAL \Mult0~425_sumout\ : std_logic;
SIGNAL \Mult0~798\ : std_logic;
SIGNAL \Mult0~475\ : std_logic;
SIGNAL \Mult0~426\ : std_logic;
SIGNAL \Mult0~429_sumout\ : std_logic;
SIGNAL \Mult0~476\ : std_logic;
SIGNAL \Mult0~799\ : std_logic;
SIGNAL \Mult0~430\ : std_logic;
SIGNAL \Mult0~433_sumout\ : std_logic;
SIGNAL \Mult0~800\ : std_logic;
SIGNAL \Mult0~477\ : std_logic;
SIGNAL \Mult0~434\ : std_logic;
SIGNAL \Mult0~437_sumout\ : std_logic;
SIGNAL \Mult0~478\ : std_logic;
SIGNAL \Mult0~801\ : std_logic;
SIGNAL \Mult0~438\ : std_logic;
SIGNAL \Mult0~441_sumout\ : std_logic;
SIGNAL \Mult1~349_resulta\ : std_logic;
SIGNAL \Mult1~26\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Mult1~350\ : std_logic;
SIGNAL \Mult1~27\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Mult1~351\ : std_logic;
SIGNAL \Mult1~28\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Mult1~29\ : std_logic;
SIGNAL \Mult1~352\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Mult1~353\ : std_logic;
SIGNAL \Mult1~30\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Mult1~31\ : std_logic;
SIGNAL \Mult1~354\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Mult1~355\ : std_logic;
SIGNAL \Mult1~32\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Mult1~356\ : std_logic;
SIGNAL \Mult1~33\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \Mult1~34\ : std_logic;
SIGNAL \Mult1~357\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \Mult1~35\ : std_logic;
SIGNAL \Mult1~358\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \Mult1~359\ : std_logic;
SIGNAL \Mult1~36\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \Mult1~37\ : std_logic;
SIGNAL \Mult1~360\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \Mult1~361\ : std_logic;
SIGNAL \Mult1~38\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \Mult1~39\ : std_logic;
SIGNAL \Mult1~362\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \Mult1~40\ : std_logic;
SIGNAL \Mult1~363\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~63\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \Mult1~41\ : std_logic;
SIGNAL \Mult1~364\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~67\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \Mult1~365\ : std_logic;
SIGNAL \Mult1~42\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~71\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \Add0~101_sumout\ : std_logic;
SIGNAL \Add0~105_sumout\ : std_logic;
SIGNAL \Add0~109_sumout\ : std_logic;
SIGNAL \Add0~113_sumout\ : std_logic;
SIGNAL \Add0~117_sumout\ : std_logic;
SIGNAL \Add0~121_sumout\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \Mult2~383_resulta\ : std_logic;
SIGNAL \Mult2~8\ : std_logic;
SIGNAL \Mult2~324_sumout\ : std_logic;
SIGNAL \Mult2~9\ : std_logic;
SIGNAL \Mult2~384\ : std_logic;
SIGNAL \Mult2~325\ : std_logic;
SIGNAL \Mult2~328_sumout\ : std_logic;
SIGNAL \Mult2~385\ : std_logic;
SIGNAL \Mult2~10\ : std_logic;
SIGNAL \Mult2~329\ : std_logic;
SIGNAL \Mult2~332_sumout\ : std_logic;
SIGNAL \Mult2~386\ : std_logic;
SIGNAL \Mult2~11\ : std_logic;
SIGNAL \Mult2~333\ : std_logic;
SIGNAL \Mult2~336_sumout\ : std_logic;
SIGNAL \Mult2~387\ : std_logic;
SIGNAL \Mult2~12\ : std_logic;
SIGNAL \Mult2~337\ : std_logic;
SIGNAL \Mult2~340_sumout\ : std_logic;
SIGNAL \Mult2~13\ : std_logic;
SIGNAL \Mult2~388\ : std_logic;
SIGNAL \Mult2~341\ : std_logic;
SIGNAL \Mult2~344_sumout\ : std_logic;
SIGNAL \Mult2~14\ : std_logic;
SIGNAL \Mult2~389\ : std_logic;
SIGNAL \Mult2~345\ : std_logic;
SIGNAL \Mult2~348_sumout\ : std_logic;
SIGNAL \Mult2~15\ : std_logic;
SIGNAL \Mult2~390\ : std_logic;
SIGNAL \Mult2~349\ : std_logic;
SIGNAL \Mult2~352_sumout\ : std_logic;
SIGNAL \Mult2~391\ : std_logic;
SIGNAL \Mult2~16\ : std_logic;
SIGNAL \Mult2~353\ : std_logic;
SIGNAL \Mult2~356_sumout\ : std_logic;
SIGNAL \Mult2~392\ : std_logic;
SIGNAL \Mult2~17\ : std_logic;
SIGNAL \Mult2~357\ : std_logic;
SIGNAL \Mult2~360_sumout\ : std_logic;
SIGNAL \Mult2~18\ : std_logic;
SIGNAL \Mult2~393\ : std_logic;
SIGNAL \Mult2~361\ : std_logic;
SIGNAL \Mult2~364_sumout\ : std_logic;
SIGNAL \Mult2~19\ : std_logic;
SIGNAL \Mult2~394\ : std_logic;
SIGNAL \Mult2~365\ : std_logic;
SIGNAL \Mult2~368_sumout\ : std_logic;
SIGNAL \Mult2~20\ : std_logic;
SIGNAL \Mult2~395\ : std_logic;
SIGNAL \Mult2~369\ : std_logic;
SIGNAL \Mult2~372_sumout\ : std_logic;
SIGNAL \Add1~118_cout\ : std_logic;
SIGNAL \Add1~82\ : std_logic;
SIGNAL \Add1~86\ : std_logic;
SIGNAL \Add1~90\ : std_logic;
SIGNAL \Add1~94\ : std_logic;
SIGNAL \Add1~98\ : std_logic;
SIGNAL \Add1~102\ : std_logic;
SIGNAL \Add1~106\ : std_logic;
SIGNAL \Add1~110\ : std_logic;
SIGNAL \Add1~114\ : std_logic;
SIGNAL \Add1~74\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Mult3~8\ : std_logic;
SIGNAL \Mult2~396\ : std_logic;
SIGNAL \Mult2~21\ : std_logic;
SIGNAL \Mult2~373\ : std_logic;
SIGNAL \Mult2~717_sumout\ : std_logic;
SIGNAL \Mult3~383_resulta\ : std_logic;
SIGNAL \Mult3~324_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \Mult3~9\ : std_logic;
SIGNAL \Mult3~384\ : std_logic;
SIGNAL \Mult3~325\ : std_logic;
SIGNAL \Mult3~328_sumout\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \Mult3~10\ : std_logic;
SIGNAL \Mult3~385\ : std_logic;
SIGNAL \Mult3~329\ : std_logic;
SIGNAL \Mult3~332_sumout\ : std_logic;
SIGNAL \Add1~30\ : std_logic;
SIGNAL \Add1~33_sumout\ : std_logic;
SIGNAL \Mult3~386\ : std_logic;
SIGNAL \Mult3~11\ : std_logic;
SIGNAL \Mult3~333\ : std_logic;
SIGNAL \Mult3~336_sumout\ : std_logic;
SIGNAL \Add1~34\ : std_logic;
SIGNAL \Add1~37_sumout\ : std_logic;
SIGNAL \Mult3~12\ : std_logic;
SIGNAL \Mult3~387\ : std_logic;
SIGNAL \Mult3~337\ : std_logic;
SIGNAL \Mult3~340_sumout\ : std_logic;
SIGNAL \Add1~38\ : std_logic;
SIGNAL \Add1~41_sumout\ : std_logic;
SIGNAL \Mult3~388\ : std_logic;
SIGNAL \Mult3~13\ : std_logic;
SIGNAL \Mult3~341\ : std_logic;
SIGNAL \Mult3~344_sumout\ : std_logic;
SIGNAL \Add1~42\ : std_logic;
SIGNAL \Add1~45_sumout\ : std_logic;
SIGNAL \Mult3~14\ : std_logic;
SIGNAL \Mult3~389\ : std_logic;
SIGNAL \Mult3~345\ : std_logic;
SIGNAL \Mult3~348_sumout\ : std_logic;
SIGNAL \Add1~46\ : std_logic;
SIGNAL \Add1~49_sumout\ : std_logic;
SIGNAL \Mult3~390\ : std_logic;
SIGNAL \Mult3~15\ : std_logic;
SIGNAL \Mult3~349\ : std_logic;
SIGNAL \Mult3~352_sumout\ : std_logic;
SIGNAL \Add1~50\ : std_logic;
SIGNAL \Add1~53_sumout\ : std_logic;
SIGNAL \Mult3~16\ : std_logic;
SIGNAL \Mult3~391\ : std_logic;
SIGNAL \Mult3~353\ : std_logic;
SIGNAL \Mult3~356_sumout\ : std_logic;
SIGNAL \Add1~54\ : std_logic;
SIGNAL \Add1~57_sumout\ : std_logic;
SIGNAL \Mult3~17\ : std_logic;
SIGNAL \Mult3~392\ : std_logic;
SIGNAL \Mult3~357\ : std_logic;
SIGNAL \Mult3~360_sumout\ : std_logic;
SIGNAL \Add1~58\ : std_logic;
SIGNAL \Add1~61_sumout\ : std_logic;
SIGNAL \Mult3~393\ : std_logic;
SIGNAL \Mult3~18\ : std_logic;
SIGNAL \Mult3~361\ : std_logic;
SIGNAL \Mult3~364_sumout\ : std_logic;
SIGNAL \Add1~62\ : std_logic;
SIGNAL \Add1~65_sumout\ : std_logic;
SIGNAL \Mult3~19\ : std_logic;
SIGNAL \Mult3~394\ : std_logic;
SIGNAL \Mult3~365\ : std_logic;
SIGNAL \Mult3~368_sumout\ : std_logic;
SIGNAL \Add1~66\ : std_logic;
SIGNAL \Add1~69_sumout\ : std_logic;
SIGNAL \sine_out[0]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[0]~reg0_q\ : std_logic;
SIGNAL \sine_out[1]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[1]~reg0_q\ : std_logic;
SIGNAL \sine_out[2]~reg0_q\ : std_logic;
SIGNAL \sine_out[3]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[3]~reg0_q\ : std_logic;
SIGNAL \sine_out[4]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[4]~reg0_q\ : std_logic;
SIGNAL \sine_out[5]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[5]~reg0_q\ : std_logic;
SIGNAL \sine_out[6]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[6]~reg0_q\ : std_logic;
SIGNAL \sine_out[7]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[7]~reg0_q\ : std_logic;
SIGNAL \sine_out[8]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[8]~reg0_q\ : std_logic;
SIGNAL \sine_out[9]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[9]~reg0_q\ : std_logic;
SIGNAL \sine_out[10]~reg0feeder_combout\ : std_logic;
SIGNAL \sine_out[10]~reg0_q\ : std_logic;
SIGNAL \Mult4~15\ : std_logic;
SIGNAL \Mult3~395\ : std_logic;
SIGNAL \Mult3~20\ : std_logic;
SIGNAL \Mult3~369\ : std_logic;
SIGNAL \Mult3~717_sumout\ : std_logic;
SIGNAL \Add1~70\ : std_logic;
SIGNAL \Add1~77_sumout\ : std_logic;
SIGNAL \Mult3~396\ : std_logic;
SIGNAL \Mult3~21\ : std_logic;
SIGNAL \Mult3~718\ : std_logic;
SIGNAL \Mult3~372_sumout\ : std_logic;
SIGNAL \Add1~81_sumout\ : std_logic;
SIGNAL \Add1~85_sumout\ : std_logic;
SIGNAL \Add1~89_sumout\ : std_logic;
SIGNAL \Add1~93_sumout\ : std_logic;
SIGNAL \Add1~97_sumout\ : std_logic;
SIGNAL \Add1~101_sumout\ : std_logic;
SIGNAL \Add1~105_sumout\ : std_logic;
SIGNAL \Add1~109_sumout\ : std_logic;
SIGNAL \Add1~113_sumout\ : std_logic;
SIGNAL \Add1~73_sumout\ : std_logic;
SIGNAL \Mult4~346_resulta\ : std_logic;
SIGNAL \Mult4~331_sumout\ : std_logic;
SIGNAL \sine_out[11]~reg0_q\ : std_logic;
SIGNAL \Mult4~347\ : std_logic;
SIGNAL \Mult4~16\ : std_logic;
SIGNAL \Mult4~332\ : std_logic;
SIGNAL \Mult4~335_sumout\ : std_logic;
SIGNAL \sine_out[12]~reg0_q\ : std_logic;
SIGNAL result6 : std_logic_vector(31 DOWNTO 0);
SIGNAL result4 : std_logic_vector(31 DOWNTO 0);
SIGNAL result3 : std_logic_vector(31 DOWNTO 0);
SIGNAL result1 : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_Mult4~347\ : std_logic;
SIGNAL \ALT_INV_Mult4~346_resulta\ : std_logic;
SIGNAL \ALT_INV_Mult4~16\ : std_logic;
SIGNAL \ALT_INV_Mult4~15\ : std_logic;
SIGNAL ALT_INV_result6 : std_logic_vector(17 DOWNTO 7);
SIGNAL \ALT_INV_Mult3~344_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~340_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~336_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~332_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~328_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~324_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~21\ : std_logic;
SIGNAL \ALT_INV_Mult3~20\ : std_logic;
SIGNAL \ALT_INV_Mult3~19\ : std_logic;
SIGNAL \ALT_INV_Mult3~18\ : std_logic;
SIGNAL \ALT_INV_Mult3~17\ : std_logic;
SIGNAL \ALT_INV_Mult3~16\ : std_logic;
SIGNAL \ALT_INV_Mult3~15\ : std_logic;
SIGNAL \ALT_INV_Mult3~14\ : std_logic;
SIGNAL \ALT_INV_Mult3~13\ : std_logic;
SIGNAL \ALT_INV_Mult3~12\ : std_logic;
SIGNAL \ALT_INV_Mult3~11\ : std_logic;
SIGNAL \ALT_INV_Mult3~10\ : std_logic;
SIGNAL \ALT_INV_Mult3~9\ : std_logic;
SIGNAL \ALT_INV_Mult3~8\ : std_logic;
SIGNAL ALT_INV_result4 : std_logic_vector(17 DOWNTO 0);
SIGNAL \ALT_INV_Mult3~385\ : std_logic;
SIGNAL \ALT_INV_Mult3~384\ : std_logic;
SIGNAL \ALT_INV_Mult3~383_resulta\ : std_logic;
SIGNAL \ALT_INV_Mult2~21\ : std_logic;
SIGNAL \ALT_INV_Mult2~20\ : std_logic;
SIGNAL \ALT_INV_Mult2~19\ : std_logic;
SIGNAL \ALT_INV_Mult2~18\ : std_logic;
SIGNAL \ALT_INV_Mult2~17\ : std_logic;
SIGNAL \ALT_INV_Mult2~16\ : std_logic;
SIGNAL \ALT_INV_Mult2~15\ : std_logic;
SIGNAL \ALT_INV_Mult2~14\ : std_logic;
SIGNAL \ALT_INV_Mult2~13\ : std_logic;
SIGNAL \ALT_INV_Mult2~12\ : std_logic;
SIGNAL \ALT_INV_Mult2~11\ : std_logic;
SIGNAL \ALT_INV_Mult2~10\ : std_logic;
SIGNAL \ALT_INV_Mult2~9\ : std_logic;
SIGNAL \ALT_INV_Mult2~8\ : std_logic;
SIGNAL \ALT_INV_Mult3~372_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~368_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~364_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~360_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~356_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~352_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~348_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult2~391\ : std_logic;
SIGNAL \ALT_INV_Mult2~390\ : std_logic;
SIGNAL \ALT_INV_Mult2~389\ : std_logic;
SIGNAL \ALT_INV_Mult2~388\ : std_logic;
SIGNAL \ALT_INV_Mult2~387\ : std_logic;
SIGNAL \ALT_INV_Mult2~386\ : std_logic;
SIGNAL \ALT_INV_Mult2~385\ : std_logic;
SIGNAL \ALT_INV_Mult2~384\ : std_logic;
SIGNAL \ALT_INV_Mult2~383_resulta\ : std_logic;
SIGNAL \ALT_INV_Mult3~717_sumout\ : std_logic;
SIGNAL \ALT_INV_Mult3~396\ : std_logic;
SIGNAL \ALT_INV_Mult3~395\ : std_logic;
SIGNAL \ALT_INV_Mult3~394\ : std_logic;
SIGNAL \ALT_INV_Mult3~393\ : std_logic;
SIGNAL \ALT_INV_Mult3~392\ : std_logic;
SIGNAL \ALT_INV_Mult3~391\ : std_logic;
SIGNAL \ALT_INV_Mult3~390\ : std_logic;
SIGNAL \ALT_INV_Mult3~389\ : std_logic;
SIGNAL \ALT_INV_Mult3~388\ : std_logic;
SIGNAL \ALT_INV_Mult3~387\ : std_logic;
SIGNAL \ALT_INV_Mult3~386\ : std_logic;
SIGNAL \ALT_INV_Mult1~352\ : std_logic;
SIGNAL \ALT_INV_Mult1~351\ : std_logic;
SIGNAL \ALT_INV_Mult1~350\ : std_logic;
SIGNAL \ALT_INV_Mult1~349_resulta\ : std_logic;
SIGNAL \ALT_INV_Mult1~42\ : std_logic;
SIGNAL \ALT_INV_Mult1~41\ : std_logic;
SIGNAL \ALT_INV_Mult1~40\ : std_logic;
SIGNAL \ALT_INV_Mult1~39\ : std_logic;
SIGNAL \ALT_INV_Mult1~38\ : std_logic;
SIGNAL \ALT_INV_Mult1~37\ : std_logic;
SIGNAL \ALT_INV_Mult1~36\ : std_logic;
SIGNAL \ALT_INV_Mult1~35\ : std_logic;
SIGNAL \ALT_INV_Mult1~34\ : std_logic;
SIGNAL \ALT_INV_Mult1~33\ : std_logic;
SIGNAL \ALT_INV_Mult1~32\ : std_logic;
SIGNAL \ALT_INV_Mult1~31\ : std_logic;
SIGNAL \ALT_INV_Mult1~30\ : std_logic;
SIGNAL \ALT_INV_Mult1~29\ : std_logic;
SIGNAL \ALT_INV_Mult1~28\ : std_logic;
SIGNAL \ALT_INV_Mult1~27\ : std_logic;
SIGNAL \ALT_INV_Mult1~26\ : std_logic;
SIGNAL \ALT_INV_Mult1~25\ : std_logic;
SIGNAL \ALT_INV_Mult1~24\ : std_logic;
SIGNAL \ALT_INV_Mult1~23\ : std_logic;
SIGNAL \ALT_INV_Mult1~22\ : std_logic;
SIGNAL \ALT_INV_Mult1~21\ : std_logic;
SIGNAL \ALT_INV_Mult1~20\ : std_logic;
SIGNAL \ALT_INV_Mult1~19\ : std_logic;
SIGNAL \ALT_INV_Mult1~18\ : std_logic;
SIGNAL \ALT_INV_Mult1~17\ : std_logic;
SIGNAL \ALT_INV_Mult1~16\ : std_logic;
SIGNAL \ALT_INV_Mult1~15\ : std_logic;
SIGNAL \ALT_INV_Mult1~14\ : std_logic;
SIGNAL \ALT_INV_Mult1~13\ : std_logic;
SIGNAL \ALT_INV_Mult1~12\ : std_logic;
SIGNAL \ALT_INV_Mult1~11\ : std_logic;
SIGNAL \ALT_INV_Mult2~396\ : std_logic;
SIGNAL \ALT_INV_Mult2~395\ : std_logic;
SIGNAL \ALT_INV_Mult2~394\ : std_logic;
SIGNAL \ALT_INV_Mult2~393\ : std_logic;
SIGNAL \ALT_INV_Mult2~392\ : std_logic;
SIGNAL \ALT_INV_Mult0~34\ : std_logic;
SIGNAL \ALT_INV_Mult0~33\ : std_logic;
SIGNAL \ALT_INV_Mult0~32\ : std_logic;
SIGNAL \ALT_INV_Mult0~31\ : std_logic;
SIGNAL \ALT_INV_Mult0~30\ : std_logic;
SIGNAL \ALT_INV_Mult0~29\ : std_logic;
SIGNAL \ALT_INV_Mult0~28\ : std_logic;
SIGNAL \ALT_INV_Mult0~27\ : std_logic;
SIGNAL \ALT_INV_Mult0~26\ : std_logic;
SIGNAL \ALT_INV_Mult0~25\ : std_logic;
SIGNAL \ALT_INV_Mult0~24\ : std_logic;
SIGNAL \ALT_INV_Mult0~23\ : std_logic;
SIGNAL \ALT_INV_Mult0~22\ : std_logic;
SIGNAL \ALT_INV_Mult0~21\ : std_logic;
SIGNAL \ALT_INV_Mult1~365\ : std_logic;
SIGNAL \ALT_INV_Mult1~364\ : std_logic;
SIGNAL \ALT_INV_Mult1~363\ : std_logic;
SIGNAL \ALT_INV_Mult1~362\ : std_logic;
SIGNAL \ALT_INV_Mult1~361\ : std_logic;
SIGNAL \ALT_INV_Mult1~360\ : std_logic;
SIGNAL \ALT_INV_Mult1~359\ : std_logic;
SIGNAL \ALT_INV_Mult1~358\ : std_logic;
SIGNAL \ALT_INV_Mult1~357\ : std_logic;
SIGNAL \ALT_INV_Mult1~356\ : std_logic;
SIGNAL \ALT_INV_Mult1~355\ : std_logic;
SIGNAL \ALT_INV_Mult1~354\ : std_logic;
SIGNAL \ALT_INV_Mult1~353\ : std_logic;
SIGNAL \ALT_INV_Mult0~478\ : std_logic;
SIGNAL \ALT_INV_Mult0~477\ : std_logic;
SIGNAL \ALT_INV_Mult0~476\ : std_logic;
SIGNAL \ALT_INV_Mult0~475\ : std_logic;
SIGNAL \ALT_INV_Mult0~474\ : std_logic;
SIGNAL \ALT_INV_Mult0~473\ : std_logic;
SIGNAL \ALT_INV_Mult0~472\ : std_logic;
SIGNAL \ALT_INV_Mult0~471\ : std_logic;
SIGNAL \ALT_INV_Mult0~470\ : std_logic;
SIGNAL \ALT_INV_Mult0~469\ : std_logic;
SIGNAL \ALT_INV_Mult0~468\ : std_logic;
SIGNAL \ALT_INV_Mult0~467\ : std_logic;
SIGNAL \ALT_INV_Mult0~466\ : std_logic;
SIGNAL \ALT_INV_Mult0~465\ : std_logic;
SIGNAL \ALT_INV_Mult0~464\ : std_logic;
SIGNAL \ALT_INV_Mult0~463\ : std_logic;
SIGNAL \ALT_INV_Mult0~462\ : std_logic;
SIGNAL \ALT_INV_Mult0~461\ : std_logic;
SIGNAL \ALT_INV_Mult0~460\ : std_logic;
SIGNAL \ALT_INV_Mult0~459\ : std_logic;
SIGNAL \ALT_INV_Mult0~458\ : std_logic;
SIGNAL \ALT_INV_Mult0~457\ : std_logic;
SIGNAL \ALT_INV_Mult0~456\ : std_logic;
SIGNAL \ALT_INV_Mult0~455\ : std_logic;
SIGNAL \ALT_INV_Mult0~454\ : std_logic;
SIGNAL \ALT_INV_Mult0~453\ : std_logic;
SIGNAL \ALT_INV_Mult0~452_resulta\ : std_logic;
SIGNAL \ALT_INV_Mult0~38\ : std_logic;
SIGNAL \ALT_INV_Mult0~37\ : std_logic;
SIGNAL \ALT_INV_Mult0~36\ : std_logic;
SIGNAL \ALT_INV_Mult0~35\ : std_logic;
SIGNAL \ALT_INV_Mult0~801\ : std_logic;
SIGNAL \ALT_INV_Mult0~800\ : std_logic;
SIGNAL \ALT_INV_Mult0~799\ : std_logic;
SIGNAL \ALT_INV_Mult0~798\ : std_logic;
SIGNAL \ALT_INV_Mult0~797\ : std_logic;
SIGNAL \ALT_INV_Mult0~796\ : std_logic;
SIGNAL \ALT_INV_Mult0~795\ : std_logic;
SIGNAL \ALT_INV_Mult0~794\ : std_logic;
SIGNAL \ALT_INV_Mult0~793_resulta\ : std_logic;

BEGIN

ww_clk <= clk;
ww_angle <= angle;
sine_out <= ww_sine_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Mult4~8_ACLR_bus\ <= (gnd & gnd);

\Mult4~8_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult4~8_ENA_bus\ <= (vcc & vcc & vcc);

\Mult4~8_AX_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & \angle[3]~input_o\
& \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult4~8_AY_bus\ <= (\Add1~69_sumout\ & \Add1~65_sumout\ & \Add1~61_sumout\ & \Add1~57_sumout\ & \Add1~53_sumout\ & \Add1~49_sumout\ & \Add1~45_sumout\ & \Add1~41_sumout\ & \Add1~37_sumout\ & \Add1~33_sumout\ & \Add1~29_sumout\ & \Add1~25_sumout\ & 
\Add1~21_sumout\ & \Add1~17_sumout\ & \Add1~13_sumout\ & \Add1~9_sumout\ & \Add1~5_sumout\ & \Add1~1_sumout\);

\Mult4~8_resulta\ <= \Mult4~8_RESULTA_bus\(0);
\Mult4~9\ <= \Mult4~8_RESULTA_bus\(1);
\Mult4~10\ <= \Mult4~8_RESULTA_bus\(2);
\Mult4~11\ <= \Mult4~8_RESULTA_bus\(3);
\Mult4~12\ <= \Mult4~8_RESULTA_bus\(4);
\Mult4~13\ <= \Mult4~8_RESULTA_bus\(5);
\Mult4~14\ <= \Mult4~8_RESULTA_bus\(6);
result6(7) <= \Mult4~8_RESULTA_bus\(7);
result6(8) <= \Mult4~8_RESULTA_bus\(8);
result6(9) <= \Mult4~8_RESULTA_bus\(9);
result6(10) <= \Mult4~8_RESULTA_bus\(10);
result6(11) <= \Mult4~8_RESULTA_bus\(11);
result6(12) <= \Mult4~8_RESULTA_bus\(12);
result6(13) <= \Mult4~8_RESULTA_bus\(13);
result6(14) <= \Mult4~8_RESULTA_bus\(14);
result6(15) <= \Mult4~8_RESULTA_bus\(15);
result6(16) <= \Mult4~8_RESULTA_bus\(16);
result6(17) <= \Mult4~8_RESULTA_bus\(17);
\Mult4~15\ <= \Mult4~8_RESULTA_bus\(18);
\Mult4~16\ <= \Mult4~8_RESULTA_bus\(19);
\Mult4~17\ <= \Mult4~8_RESULTA_bus\(20);
\Mult4~18\ <= \Mult4~8_RESULTA_bus\(21);
\Mult4~19\ <= \Mult4~8_RESULTA_bus\(22);
\Mult4~20\ <= \Mult4~8_RESULTA_bus\(23);
\Mult4~21\ <= \Mult4~8_RESULTA_bus\(24);
\Mult4~22\ <= \Mult4~8_RESULTA_bus\(25);
\Mult4~23\ <= \Mult4~8_RESULTA_bus\(26);
\Mult4~24\ <= \Mult4~8_RESULTA_bus\(27);
\Mult4~25\ <= \Mult4~8_RESULTA_bus\(28);
\Mult4~26\ <= \Mult4~8_RESULTA_bus\(29);
\Mult4~27\ <= \Mult4~8_RESULTA_bus\(30);
\Mult4~28\ <= \Mult4~8_RESULTA_bus\(31);
\Mult4~29\ <= \Mult4~8_RESULTA_bus\(32);
\Mult4~30\ <= \Mult4~8_RESULTA_bus\(33);
\Mult4~31\ <= \Mult4~8_RESULTA_bus\(34);
\Mult4~32\ <= \Mult4~8_RESULTA_bus\(35);
\Mult4~33\ <= \Mult4~8_RESULTA_bus\(36);
\Mult4~34\ <= \Mult4~8_RESULTA_bus\(37);
\Mult4~35\ <= \Mult4~8_RESULTA_bus\(38);
\Mult4~36\ <= \Mult4~8_RESULTA_bus\(39);
\Mult4~37\ <= \Mult4~8_RESULTA_bus\(40);
\Mult4~38\ <= \Mult4~8_RESULTA_bus\(41);
\Mult4~39\ <= \Mult4~8_RESULTA_bus\(42);
\Mult4~40\ <= \Mult4~8_RESULTA_bus\(43);
\Mult4~41\ <= \Mult4~8_RESULTA_bus\(44);
\Mult4~42\ <= \Mult4~8_RESULTA_bus\(45);
\Mult4~43\ <= \Mult4~8_RESULTA_bus\(46);
\Mult4~44\ <= \Mult4~8_RESULTA_bus\(47);
\Mult4~45\ <= \Mult4~8_RESULTA_bus\(48);
\Mult4~46\ <= \Mult4~8_RESULTA_bus\(49);
\Mult4~47\ <= \Mult4~8_RESULTA_bus\(50);
\Mult4~48\ <= \Mult4~8_RESULTA_bus\(51);
\Mult4~49\ <= \Mult4~8_RESULTA_bus\(52);
\Mult4~50\ <= \Mult4~8_RESULTA_bus\(53);
\Mult4~51\ <= \Mult4~8_RESULTA_bus\(54);
\Mult4~52\ <= \Mult4~8_RESULTA_bus\(55);
\Mult4~53\ <= \Mult4~8_RESULTA_bus\(56);
\Mult4~54\ <= \Mult4~8_RESULTA_bus\(57);
\Mult4~55\ <= \Mult4~8_RESULTA_bus\(58);
\Mult4~56\ <= \Mult4~8_RESULTA_bus\(59);
\Mult4~57\ <= \Mult4~8_RESULTA_bus\(60);
\Mult4~58\ <= \Mult4~8_RESULTA_bus\(61);
\Mult4~59\ <= \Mult4~8_RESULTA_bus\(62);
\Mult4~60\ <= \Mult4~8_RESULTA_bus\(63);

\Mult4~346_ACLR_bus\ <= (gnd & gnd);

\Mult4~346_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult4~346_ENA_bus\ <= (vcc & vcc & vcc);

\Mult4~346_AX_bus\ <= (\Add1~73_sumout\ & \Add1~113_sumout\ & \Add1~109_sumout\ & \Add1~105_sumout\ & \Add1~101_sumout\ & \Add1~97_sumout\ & \Add1~93_sumout\ & \Add1~89_sumout\ & \Add1~85_sumout\ & \Add1~81_sumout\ & result4(1) & NOT result4(0) & NOT 
\Mult3~372_sumout\ & \Add1~77_sumout\);

\Mult4~346_AY_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & 
\angle[3]~input_o\ & \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult4~346_BX_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Mult4~346_BY_bus\ <= (\Add1~69_sumout\ & \Add1~65_sumout\ & \Add1~61_sumout\ & \Add1~57_sumout\ & \Add1~53_sumout\ & \Add1~49_sumout\ & \Add1~45_sumout\ & \Add1~41_sumout\ & \Add1~37_sumout\ & \Add1~33_sumout\ & \Add1~29_sumout\ & \Add1~25_sumout\ & 
\Add1~21_sumout\ & \Add1~17_sumout\ & \Add1~13_sumout\ & \Add1~9_sumout\ & \Add1~5_sumout\ & \Add1~1_sumout\);

\Mult4~346_resulta\ <= \Mult4~346_RESULTA_bus\(0);
\Mult4~347\ <= \Mult4~346_RESULTA_bus\(1);
\Mult4~348\ <= \Mult4~346_RESULTA_bus\(2);
\Mult4~349\ <= \Mult4~346_RESULTA_bus\(3);
\Mult4~350\ <= \Mult4~346_RESULTA_bus\(4);
\Mult4~351\ <= \Mult4~346_RESULTA_bus\(5);
\Mult4~352\ <= \Mult4~346_RESULTA_bus\(6);
\Mult4~353\ <= \Mult4~346_RESULTA_bus\(7);
\Mult4~354\ <= \Mult4~346_RESULTA_bus\(8);
\Mult4~355\ <= \Mult4~346_RESULTA_bus\(9);
\Mult4~356\ <= \Mult4~346_RESULTA_bus\(10);
\Mult4~357\ <= \Mult4~346_RESULTA_bus\(11);
\Mult4~358\ <= \Mult4~346_RESULTA_bus\(12);
\Mult4~359\ <= \Mult4~346_RESULTA_bus\(13);
\Mult4~360\ <= \Mult4~346_RESULTA_bus\(14);
\Mult4~361\ <= \Mult4~346_RESULTA_bus\(15);
\Mult4~362\ <= \Mult4~346_RESULTA_bus\(16);
\Mult4~363\ <= \Mult4~346_RESULTA_bus\(17);
\Mult4~364\ <= \Mult4~346_RESULTA_bus\(18);
\Mult4~365\ <= \Mult4~346_RESULTA_bus\(19);
\Mult4~366\ <= \Mult4~346_RESULTA_bus\(20);
\Mult4~367\ <= \Mult4~346_RESULTA_bus\(21);
\Mult4~368\ <= \Mult4~346_RESULTA_bus\(22);
\Mult4~369\ <= \Mult4~346_RESULTA_bus\(23);
\Mult4~370\ <= \Mult4~346_RESULTA_bus\(24);
\Mult4~371\ <= \Mult4~346_RESULTA_bus\(25);
\Mult4~372\ <= \Mult4~346_RESULTA_bus\(26);
\Mult4~373\ <= \Mult4~346_RESULTA_bus\(27);
\Mult4~374\ <= \Mult4~346_RESULTA_bus\(28);
\Mult4~375\ <= \Mult4~346_RESULTA_bus\(29);
\Mult4~376\ <= \Mult4~346_RESULTA_bus\(30);
\Mult4~377\ <= \Mult4~346_RESULTA_bus\(31);
\Mult4~378\ <= \Mult4~346_RESULTA_bus\(32);
\Mult4~379\ <= \Mult4~346_RESULTA_bus\(33);
\Mult4~380\ <= \Mult4~346_RESULTA_bus\(34);
\Mult4~381\ <= \Mult4~346_RESULTA_bus\(35);
\Mult4~382\ <= \Mult4~346_RESULTA_bus\(36);
\Mult4~383\ <= \Mult4~346_RESULTA_bus\(37);
\Mult4~384\ <= \Mult4~346_RESULTA_bus\(38);
\Mult4~385\ <= \Mult4~346_RESULTA_bus\(39);
\Mult4~386\ <= \Mult4~346_RESULTA_bus\(40);
\Mult4~387\ <= \Mult4~346_RESULTA_bus\(41);
\Mult4~388\ <= \Mult4~346_RESULTA_bus\(42);
\Mult4~389\ <= \Mult4~346_RESULTA_bus\(43);
\Mult4~390\ <= \Mult4~346_RESULTA_bus\(44);
\Mult4~391\ <= \Mult4~346_RESULTA_bus\(45);
\Mult4~392\ <= \Mult4~346_RESULTA_bus\(46);
\Mult4~393\ <= \Mult4~346_RESULTA_bus\(47);
\Mult4~394\ <= \Mult4~346_RESULTA_bus\(48);
\Mult4~395\ <= \Mult4~346_RESULTA_bus\(49);
\Mult4~396\ <= \Mult4~346_RESULTA_bus\(50);
\Mult4~397\ <= \Mult4~346_RESULTA_bus\(51);
\Mult4~398\ <= \Mult4~346_RESULTA_bus\(52);
\Mult4~399\ <= \Mult4~346_RESULTA_bus\(53);
\Mult4~400\ <= \Mult4~346_RESULTA_bus\(54);
\Mult4~401\ <= \Mult4~346_RESULTA_bus\(55);
\Mult4~402\ <= \Mult4~346_RESULTA_bus\(56);
\Mult4~403\ <= \Mult4~346_RESULTA_bus\(57);
\Mult4~404\ <= \Mult4~346_RESULTA_bus\(58);
\Mult4~405\ <= \Mult4~346_RESULTA_bus\(59);
\Mult4~406\ <= \Mult4~346_RESULTA_bus\(60);
\Mult4~407\ <= \Mult4~346_RESULTA_bus\(61);
\Mult4~408\ <= \Mult4~346_RESULTA_bus\(62);
\Mult4~409\ <= \Mult4~346_RESULTA_bus\(63);

\Mult3~mult_llmac_ACLR_bus\ <= (gnd & gnd);

\Mult3~mult_llmac_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult3~mult_llmac_ENA_bus\ <= (vcc & vcc & vcc);

\Mult3~mult_llmac_AX_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & 
\angle[3]~input_o\ & \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult3~mult_llmac_AY_bus\ <= (\Mult2~372_sumout\ & \Mult2~368_sumout\ & \Mult2~364_sumout\ & \Mult2~360_sumout\ & \Mult2~356_sumout\ & \Mult2~352_sumout\ & \Mult2~348_sumout\ & \Mult2~344_sumout\ & \Mult2~340_sumout\ & \Mult2~336_sumout\ & 
\Mult2~332_sumout\ & \Mult2~328_sumout\ & \Mult2~324_sumout\ & result3(17) & result3(16) & result3(15) & result3(14) & result3(13));

result4(0) <= \Mult3~mult_llmac_RESULTA_bus\(0);
result4(1) <= \Mult3~mult_llmac_RESULTA_bus\(1);
result4(2) <= \Mult3~mult_llmac_RESULTA_bus\(2);
result4(3) <= \Mult3~mult_llmac_RESULTA_bus\(3);
result4(4) <= \Mult3~mult_llmac_RESULTA_bus\(4);
result4(5) <= \Mult3~mult_llmac_RESULTA_bus\(5);
result4(6) <= \Mult3~mult_llmac_RESULTA_bus\(6);
result4(7) <= \Mult3~mult_llmac_RESULTA_bus\(7);
result4(8) <= \Mult3~mult_llmac_RESULTA_bus\(8);
result4(9) <= \Mult3~mult_llmac_RESULTA_bus\(9);
result4(10) <= \Mult3~mult_llmac_RESULTA_bus\(10);
result4(11) <= \Mult3~mult_llmac_RESULTA_bus\(11);
result4(12) <= \Mult3~mult_llmac_RESULTA_bus\(12);
result4(13) <= \Mult3~mult_llmac_RESULTA_bus\(13);
result4(14) <= \Mult3~mult_llmac_RESULTA_bus\(14);
result4(15) <= \Mult3~mult_llmac_RESULTA_bus\(15);
result4(16) <= \Mult3~mult_llmac_RESULTA_bus\(16);
result4(17) <= \Mult3~mult_llmac_RESULTA_bus\(17);
\Mult3~8\ <= \Mult3~mult_llmac_RESULTA_bus\(18);
\Mult3~9\ <= \Mult3~mult_llmac_RESULTA_bus\(19);
\Mult3~10\ <= \Mult3~mult_llmac_RESULTA_bus\(20);
\Mult3~11\ <= \Mult3~mult_llmac_RESULTA_bus\(21);
\Mult3~12\ <= \Mult3~mult_llmac_RESULTA_bus\(22);
\Mult3~13\ <= \Mult3~mult_llmac_RESULTA_bus\(23);
\Mult3~14\ <= \Mult3~mult_llmac_RESULTA_bus\(24);
\Mult3~15\ <= \Mult3~mult_llmac_RESULTA_bus\(25);
\Mult3~16\ <= \Mult3~mult_llmac_RESULTA_bus\(26);
\Mult3~17\ <= \Mult3~mult_llmac_RESULTA_bus\(27);
\Mult3~18\ <= \Mult3~mult_llmac_RESULTA_bus\(28);
\Mult3~19\ <= \Mult3~mult_llmac_RESULTA_bus\(29);
\Mult3~20\ <= \Mult3~mult_llmac_RESULTA_bus\(30);
\Mult3~21\ <= \Mult3~mult_llmac_RESULTA_bus\(31);
\Mult3~22\ <= \Mult3~mult_llmac_RESULTA_bus\(32);
\Mult3~23\ <= \Mult3~mult_llmac_RESULTA_bus\(33);
\Mult3~24\ <= \Mult3~mult_llmac_RESULTA_bus\(34);
\Mult3~25\ <= \Mult3~mult_llmac_RESULTA_bus\(35);
\Mult3~26\ <= \Mult3~mult_llmac_RESULTA_bus\(36);
\Mult3~27\ <= \Mult3~mult_llmac_RESULTA_bus\(37);
\Mult3~28\ <= \Mult3~mult_llmac_RESULTA_bus\(38);
\Mult3~29\ <= \Mult3~mult_llmac_RESULTA_bus\(39);
\Mult3~30\ <= \Mult3~mult_llmac_RESULTA_bus\(40);
\Mult3~31\ <= \Mult3~mult_llmac_RESULTA_bus\(41);
\Mult3~32\ <= \Mult3~mult_llmac_RESULTA_bus\(42);
\Mult3~33\ <= \Mult3~mult_llmac_RESULTA_bus\(43);
\Mult3~34\ <= \Mult3~mult_llmac_RESULTA_bus\(44);
\Mult3~35\ <= \Mult3~mult_llmac_RESULTA_bus\(45);
\Mult3~36\ <= \Mult3~mult_llmac_RESULTA_bus\(46);
\Mult3~37\ <= \Mult3~mult_llmac_RESULTA_bus\(47);
\Mult3~38\ <= \Mult3~mult_llmac_RESULTA_bus\(48);
\Mult3~39\ <= \Mult3~mult_llmac_RESULTA_bus\(49);
\Mult3~40\ <= \Mult3~mult_llmac_RESULTA_bus\(50);
\Mult3~41\ <= \Mult3~mult_llmac_RESULTA_bus\(51);
\Mult3~42\ <= \Mult3~mult_llmac_RESULTA_bus\(52);
\Mult3~43\ <= \Mult3~mult_llmac_RESULTA_bus\(53);
\Mult3~44\ <= \Mult3~mult_llmac_RESULTA_bus\(54);
\Mult3~45\ <= \Mult3~mult_llmac_RESULTA_bus\(55);
\Mult3~46\ <= \Mult3~mult_llmac_RESULTA_bus\(56);
\Mult3~47\ <= \Mult3~mult_llmac_RESULTA_bus\(57);
\Mult3~48\ <= \Mult3~mult_llmac_RESULTA_bus\(58);
\Mult3~49\ <= \Mult3~mult_llmac_RESULTA_bus\(59);
\Mult3~50\ <= \Mult3~mult_llmac_RESULTA_bus\(60);
\Mult3~51\ <= \Mult3~mult_llmac_RESULTA_bus\(61);
\Mult3~52\ <= \Mult3~mult_llmac_RESULTA_bus\(62);
\Mult3~53\ <= \Mult3~mult_llmac_RESULTA_bus\(63);

\Mult2~mult_llmac_ACLR_bus\ <= (gnd & gnd);

\Mult2~mult_llmac_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult2~mult_llmac_ENA_bus\ <= (vcc & vcc & vcc);

\Mult2~mult_llmac_AX_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & 
\angle[3]~input_o\ & \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult2~mult_llmac_AY_bus\ <= (\Add0~69_sumout\ & \Add0~65_sumout\ & \Add0~61_sumout\ & \Add0~57_sumout\ & \Add0~53_sumout\ & \Add0~49_sumout\ & \Add0~45_sumout\ & \Add0~41_sumout\ & \Add0~37_sumout\ & \Add0~33_sumout\ & \Add0~29_sumout\ & \Add0~25_sumout\
& \Add0~21_sumout\ & \Add0~17_sumout\ & \Add0~13_sumout\ & \Add0~9_sumout\ & \Add0~5_sumout\ & \Add0~1_sumout\);

result3(0) <= \Mult2~mult_llmac_RESULTA_bus\(0);
result3(1) <= \Mult2~mult_llmac_RESULTA_bus\(1);
result3(2) <= \Mult2~mult_llmac_RESULTA_bus\(2);
result3(3) <= \Mult2~mult_llmac_RESULTA_bus\(3);
result3(4) <= \Mult2~mult_llmac_RESULTA_bus\(4);
result3(5) <= \Mult2~mult_llmac_RESULTA_bus\(5);
result3(6) <= \Mult2~mult_llmac_RESULTA_bus\(6);
result3(7) <= \Mult2~mult_llmac_RESULTA_bus\(7);
result3(8) <= \Mult2~mult_llmac_RESULTA_bus\(8);
result3(9) <= \Mult2~mult_llmac_RESULTA_bus\(9);
result3(10) <= \Mult2~mult_llmac_RESULTA_bus\(10);
result3(11) <= \Mult2~mult_llmac_RESULTA_bus\(11);
result3(12) <= \Mult2~mult_llmac_RESULTA_bus\(12);
result3(13) <= \Mult2~mult_llmac_RESULTA_bus\(13);
result3(14) <= \Mult2~mult_llmac_RESULTA_bus\(14);
result3(15) <= \Mult2~mult_llmac_RESULTA_bus\(15);
result3(16) <= \Mult2~mult_llmac_RESULTA_bus\(16);
result3(17) <= \Mult2~mult_llmac_RESULTA_bus\(17);
\Mult2~8\ <= \Mult2~mult_llmac_RESULTA_bus\(18);
\Mult2~9\ <= \Mult2~mult_llmac_RESULTA_bus\(19);
\Mult2~10\ <= \Mult2~mult_llmac_RESULTA_bus\(20);
\Mult2~11\ <= \Mult2~mult_llmac_RESULTA_bus\(21);
\Mult2~12\ <= \Mult2~mult_llmac_RESULTA_bus\(22);
\Mult2~13\ <= \Mult2~mult_llmac_RESULTA_bus\(23);
\Mult2~14\ <= \Mult2~mult_llmac_RESULTA_bus\(24);
\Mult2~15\ <= \Mult2~mult_llmac_RESULTA_bus\(25);
\Mult2~16\ <= \Mult2~mult_llmac_RESULTA_bus\(26);
\Mult2~17\ <= \Mult2~mult_llmac_RESULTA_bus\(27);
\Mult2~18\ <= \Mult2~mult_llmac_RESULTA_bus\(28);
\Mult2~19\ <= \Mult2~mult_llmac_RESULTA_bus\(29);
\Mult2~20\ <= \Mult2~mult_llmac_RESULTA_bus\(30);
\Mult2~21\ <= \Mult2~mult_llmac_RESULTA_bus\(31);
\Mult2~22\ <= \Mult2~mult_llmac_RESULTA_bus\(32);
\Mult2~23\ <= \Mult2~mult_llmac_RESULTA_bus\(33);
\Mult2~24\ <= \Mult2~mult_llmac_RESULTA_bus\(34);
\Mult2~25\ <= \Mult2~mult_llmac_RESULTA_bus\(35);
\Mult2~26\ <= \Mult2~mult_llmac_RESULTA_bus\(36);
\Mult2~27\ <= \Mult2~mult_llmac_RESULTA_bus\(37);
\Mult2~28\ <= \Mult2~mult_llmac_RESULTA_bus\(38);
\Mult2~29\ <= \Mult2~mult_llmac_RESULTA_bus\(39);
\Mult2~30\ <= \Mult2~mult_llmac_RESULTA_bus\(40);
\Mult2~31\ <= \Mult2~mult_llmac_RESULTA_bus\(41);
\Mult2~32\ <= \Mult2~mult_llmac_RESULTA_bus\(42);
\Mult2~33\ <= \Mult2~mult_llmac_RESULTA_bus\(43);
\Mult2~34\ <= \Mult2~mult_llmac_RESULTA_bus\(44);
\Mult2~35\ <= \Mult2~mult_llmac_RESULTA_bus\(45);
\Mult2~36\ <= \Mult2~mult_llmac_RESULTA_bus\(46);
\Mult2~37\ <= \Mult2~mult_llmac_RESULTA_bus\(47);
\Mult2~38\ <= \Mult2~mult_llmac_RESULTA_bus\(48);
\Mult2~39\ <= \Mult2~mult_llmac_RESULTA_bus\(49);
\Mult2~40\ <= \Mult2~mult_llmac_RESULTA_bus\(50);
\Mult2~41\ <= \Mult2~mult_llmac_RESULTA_bus\(51);
\Mult2~42\ <= \Mult2~mult_llmac_RESULTA_bus\(52);
\Mult2~43\ <= \Mult2~mult_llmac_RESULTA_bus\(53);
\Mult2~44\ <= \Mult2~mult_llmac_RESULTA_bus\(54);
\Mult2~45\ <= \Mult2~mult_llmac_RESULTA_bus\(55);
\Mult2~46\ <= \Mult2~mult_llmac_RESULTA_bus\(56);
\Mult2~47\ <= \Mult2~mult_llmac_RESULTA_bus\(57);
\Mult2~48\ <= \Mult2~mult_llmac_RESULTA_bus\(58);
\Mult2~49\ <= \Mult2~mult_llmac_RESULTA_bus\(59);
\Mult2~50\ <= \Mult2~mult_llmac_RESULTA_bus\(60);
\Mult2~51\ <= \Mult2~mult_llmac_RESULTA_bus\(61);
\Mult2~52\ <= \Mult2~mult_llmac_RESULTA_bus\(62);
\Mult2~53\ <= \Mult2~mult_llmac_RESULTA_bus\(63);

\Mult3~383_ACLR_bus\ <= (gnd & gnd);

\Mult3~383_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult3~383_ENA_bus\ <= (vcc & vcc & vcc);

\Mult3~383_AX_bus\ <= (result3(12) & result3(11) & result3(10) & result3(9) & result3(8) & result3(7) & result3(6) & result3(5) & result3(4) & result3(3) & result3(2) & result3(1) & result3(0) & \Mult2~717_sumout\);

\Mult3~383_AY_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & 
\angle[3]~input_o\ & \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult3~383_BX_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Mult3~383_BY_bus\ <= (\Mult2~372_sumout\ & \Mult2~368_sumout\ & \Mult2~364_sumout\ & \Mult2~360_sumout\ & \Mult2~356_sumout\ & \Mult2~352_sumout\ & \Mult2~348_sumout\ & \Mult2~344_sumout\ & \Mult2~340_sumout\ & \Mult2~336_sumout\ & \Mult2~332_sumout\ & 
\Mult2~328_sumout\ & \Mult2~324_sumout\ & result3(17) & result3(16) & result3(15) & result3(14) & result3(13));

\Mult3~383_resulta\ <= \Mult3~383_RESULTA_bus\(0);
\Mult3~384\ <= \Mult3~383_RESULTA_bus\(1);
\Mult3~385\ <= \Mult3~383_RESULTA_bus\(2);
\Mult3~386\ <= \Mult3~383_RESULTA_bus\(3);
\Mult3~387\ <= \Mult3~383_RESULTA_bus\(4);
\Mult3~388\ <= \Mult3~383_RESULTA_bus\(5);
\Mult3~389\ <= \Mult3~383_RESULTA_bus\(6);
\Mult3~390\ <= \Mult3~383_RESULTA_bus\(7);
\Mult3~391\ <= \Mult3~383_RESULTA_bus\(8);
\Mult3~392\ <= \Mult3~383_RESULTA_bus\(9);
\Mult3~393\ <= \Mult3~383_RESULTA_bus\(10);
\Mult3~394\ <= \Mult3~383_RESULTA_bus\(11);
\Mult3~395\ <= \Mult3~383_RESULTA_bus\(12);
\Mult3~396\ <= \Mult3~383_RESULTA_bus\(13);
\Mult3~397\ <= \Mult3~383_RESULTA_bus\(14);
\Mult3~398\ <= \Mult3~383_RESULTA_bus\(15);
\Mult3~399\ <= \Mult3~383_RESULTA_bus\(16);
\Mult3~400\ <= \Mult3~383_RESULTA_bus\(17);
\Mult3~401\ <= \Mult3~383_RESULTA_bus\(18);
\Mult3~402\ <= \Mult3~383_RESULTA_bus\(19);
\Mult3~403\ <= \Mult3~383_RESULTA_bus\(20);
\Mult3~404\ <= \Mult3~383_RESULTA_bus\(21);
\Mult3~405\ <= \Mult3~383_RESULTA_bus\(22);
\Mult3~406\ <= \Mult3~383_RESULTA_bus\(23);
\Mult3~407\ <= \Mult3~383_RESULTA_bus\(24);
\Mult3~408\ <= \Mult3~383_RESULTA_bus\(25);
\Mult3~409\ <= \Mult3~383_RESULTA_bus\(26);
\Mult3~410\ <= \Mult3~383_RESULTA_bus\(27);
\Mult3~411\ <= \Mult3~383_RESULTA_bus\(28);
\Mult3~412\ <= \Mult3~383_RESULTA_bus\(29);
\Mult3~413\ <= \Mult3~383_RESULTA_bus\(30);
\Mult3~414\ <= \Mult3~383_RESULTA_bus\(31);
\Mult3~415\ <= \Mult3~383_RESULTA_bus\(32);
\Mult3~416\ <= \Mult3~383_RESULTA_bus\(33);
\Mult3~417\ <= \Mult3~383_RESULTA_bus\(34);
\Mult3~418\ <= \Mult3~383_RESULTA_bus\(35);
\Mult3~419\ <= \Mult3~383_RESULTA_bus\(36);
\Mult3~420\ <= \Mult3~383_RESULTA_bus\(37);
\Mult3~421\ <= \Mult3~383_RESULTA_bus\(38);
\Mult3~422\ <= \Mult3~383_RESULTA_bus\(39);
\Mult3~423\ <= \Mult3~383_RESULTA_bus\(40);
\Mult3~424\ <= \Mult3~383_RESULTA_bus\(41);
\Mult3~425\ <= \Mult3~383_RESULTA_bus\(42);
\Mult3~426\ <= \Mult3~383_RESULTA_bus\(43);
\Mult3~427\ <= \Mult3~383_RESULTA_bus\(44);
\Mult3~428\ <= \Mult3~383_RESULTA_bus\(45);
\Mult3~429\ <= \Mult3~383_RESULTA_bus\(46);
\Mult3~430\ <= \Mult3~383_RESULTA_bus\(47);
\Mult3~431\ <= \Mult3~383_RESULTA_bus\(48);
\Mult3~432\ <= \Mult3~383_RESULTA_bus\(49);
\Mult3~433\ <= \Mult3~383_RESULTA_bus\(50);
\Mult3~434\ <= \Mult3~383_RESULTA_bus\(51);
\Mult3~435\ <= \Mult3~383_RESULTA_bus\(52);
\Mult3~436\ <= \Mult3~383_RESULTA_bus\(53);
\Mult3~437\ <= \Mult3~383_RESULTA_bus\(54);
\Mult3~438\ <= \Mult3~383_RESULTA_bus\(55);
\Mult3~439\ <= \Mult3~383_RESULTA_bus\(56);
\Mult3~440\ <= \Mult3~383_RESULTA_bus\(57);
\Mult3~441\ <= \Mult3~383_RESULTA_bus\(58);
\Mult3~442\ <= \Mult3~383_RESULTA_bus\(59);
\Mult3~443\ <= \Mult3~383_RESULTA_bus\(60);
\Mult3~444\ <= \Mult3~383_RESULTA_bus\(61);
\Mult3~445\ <= \Mult3~383_RESULTA_bus\(62);
\Mult3~446\ <= \Mult3~383_RESULTA_bus\(63);

\Mult2~383_ACLR_bus\ <= (gnd & gnd);

\Mult2~383_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult2~383_ENA_bus\ <= (vcc & vcc & vcc);

\Mult2~383_AX_bus\ <= (\Add0~73_sumout\ & \Add0~121_sumout\ & \Add0~117_sumout\ & \Add0~113_sumout\ & \Add0~109_sumout\ & \Add0~105_sumout\ & \Add0~101_sumout\ & \Add0~97_sumout\ & \Add0~93_sumout\ & \Add0~89_sumout\ & \Add0~85_sumout\ & \Add0~81_sumout\
& \Mult1~11\ & \Add0~77_sumout\);

\Mult2~383_AY_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & 
\angle[3]~input_o\ & \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult2~383_BX_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Mult2~383_BY_bus\ <= (\Add0~69_sumout\ & \Add0~65_sumout\ & \Add0~61_sumout\ & \Add0~57_sumout\ & \Add0~53_sumout\ & \Add0~49_sumout\ & \Add0~45_sumout\ & \Add0~41_sumout\ & \Add0~37_sumout\ & \Add0~33_sumout\ & \Add0~29_sumout\ & \Add0~25_sumout\ & 
\Add0~21_sumout\ & \Add0~17_sumout\ & \Add0~13_sumout\ & \Add0~9_sumout\ & \Add0~5_sumout\ & \Add0~1_sumout\);

\Mult2~383_resulta\ <= \Mult2~383_RESULTA_bus\(0);
\Mult2~384\ <= \Mult2~383_RESULTA_bus\(1);
\Mult2~385\ <= \Mult2~383_RESULTA_bus\(2);
\Mult2~386\ <= \Mult2~383_RESULTA_bus\(3);
\Mult2~387\ <= \Mult2~383_RESULTA_bus\(4);
\Mult2~388\ <= \Mult2~383_RESULTA_bus\(5);
\Mult2~389\ <= \Mult2~383_RESULTA_bus\(6);
\Mult2~390\ <= \Mult2~383_RESULTA_bus\(7);
\Mult2~391\ <= \Mult2~383_RESULTA_bus\(8);
\Mult2~392\ <= \Mult2~383_RESULTA_bus\(9);
\Mult2~393\ <= \Mult2~383_RESULTA_bus\(10);
\Mult2~394\ <= \Mult2~383_RESULTA_bus\(11);
\Mult2~395\ <= \Mult2~383_RESULTA_bus\(12);
\Mult2~396\ <= \Mult2~383_RESULTA_bus\(13);
\Mult2~397\ <= \Mult2~383_RESULTA_bus\(14);
\Mult2~398\ <= \Mult2~383_RESULTA_bus\(15);
\Mult2~399\ <= \Mult2~383_RESULTA_bus\(16);
\Mult2~400\ <= \Mult2~383_RESULTA_bus\(17);
\Mult2~401\ <= \Mult2~383_RESULTA_bus\(18);
\Mult2~402\ <= \Mult2~383_RESULTA_bus\(19);
\Mult2~403\ <= \Mult2~383_RESULTA_bus\(20);
\Mult2~404\ <= \Mult2~383_RESULTA_bus\(21);
\Mult2~405\ <= \Mult2~383_RESULTA_bus\(22);
\Mult2~406\ <= \Mult2~383_RESULTA_bus\(23);
\Mult2~407\ <= \Mult2~383_RESULTA_bus\(24);
\Mult2~408\ <= \Mult2~383_RESULTA_bus\(25);
\Mult2~409\ <= \Mult2~383_RESULTA_bus\(26);
\Mult2~410\ <= \Mult2~383_RESULTA_bus\(27);
\Mult2~411\ <= \Mult2~383_RESULTA_bus\(28);
\Mult2~412\ <= \Mult2~383_RESULTA_bus\(29);
\Mult2~413\ <= \Mult2~383_RESULTA_bus\(30);
\Mult2~414\ <= \Mult2~383_RESULTA_bus\(31);
\Mult2~415\ <= \Mult2~383_RESULTA_bus\(32);
\Mult2~416\ <= \Mult2~383_RESULTA_bus\(33);
\Mult2~417\ <= \Mult2~383_RESULTA_bus\(34);
\Mult2~418\ <= \Mult2~383_RESULTA_bus\(35);
\Mult2~419\ <= \Mult2~383_RESULTA_bus\(36);
\Mult2~420\ <= \Mult2~383_RESULTA_bus\(37);
\Mult2~421\ <= \Mult2~383_RESULTA_bus\(38);
\Mult2~422\ <= \Mult2~383_RESULTA_bus\(39);
\Mult2~423\ <= \Mult2~383_RESULTA_bus\(40);
\Mult2~424\ <= \Mult2~383_RESULTA_bus\(41);
\Mult2~425\ <= \Mult2~383_RESULTA_bus\(42);
\Mult2~426\ <= \Mult2~383_RESULTA_bus\(43);
\Mult2~427\ <= \Mult2~383_RESULTA_bus\(44);
\Mult2~428\ <= \Mult2~383_RESULTA_bus\(45);
\Mult2~429\ <= \Mult2~383_RESULTA_bus\(46);
\Mult2~430\ <= \Mult2~383_RESULTA_bus\(47);
\Mult2~431\ <= \Mult2~383_RESULTA_bus\(48);
\Mult2~432\ <= \Mult2~383_RESULTA_bus\(49);
\Mult2~433\ <= \Mult2~383_RESULTA_bus\(50);
\Mult2~434\ <= \Mult2~383_RESULTA_bus\(51);
\Mult2~435\ <= \Mult2~383_RESULTA_bus\(52);
\Mult2~436\ <= \Mult2~383_RESULTA_bus\(53);
\Mult2~437\ <= \Mult2~383_RESULTA_bus\(54);
\Mult2~438\ <= \Mult2~383_RESULTA_bus\(55);
\Mult2~439\ <= \Mult2~383_RESULTA_bus\(56);
\Mult2~440\ <= \Mult2~383_RESULTA_bus\(57);
\Mult2~441\ <= \Mult2~383_RESULTA_bus\(58);
\Mult2~442\ <= \Mult2~383_RESULTA_bus\(59);
\Mult2~443\ <= \Mult2~383_RESULTA_bus\(60);
\Mult2~444\ <= \Mult2~383_RESULTA_bus\(61);
\Mult2~445\ <= \Mult2~383_RESULTA_bus\(62);
\Mult2~446\ <= \Mult2~383_RESULTA_bus\(63);

\Mult1~8_ACLR_bus\ <= (gnd & gnd);

\Mult1~8_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult1~8_ENA_bus\ <= (vcc & vcc & vcc);

\Mult1~8_AX_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & \angle[3]~input_o\
& \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult1~8_AY_bus\ <= (\Mult0~385_sumout\ & \Mult0~381_sumout\ & \Mult0~377_sumout\ & \Mult0~373_sumout\ & \Mult0~369_sumout\ & \Mult0~365_sumout\ & \Mult0~361_sumout\ & \Mult0~357_sumout\ & \Mult0~353_sumout\ & \Mult0~349_sumout\ & \Mult0~345_sumout\ & 
\Mult0~341_sumout\ & \Mult0~337_sumout\ & result1(4) & result1(3) & result1(2) & result1(1) & result1(0));

\Mult1~8_resulta\ <= \Mult1~8_RESULTA_bus\(0);
\Mult1~9\ <= \Mult1~8_RESULTA_bus\(1);
\Mult1~10\ <= \Mult1~8_RESULTA_bus\(2);
\Mult1~11\ <= \Mult1~8_RESULTA_bus\(3);
\Mult1~12\ <= \Mult1~8_RESULTA_bus\(4);
\Mult1~13\ <= \Mult1~8_RESULTA_bus\(5);
\Mult1~14\ <= \Mult1~8_RESULTA_bus\(6);
\Mult1~15\ <= \Mult1~8_RESULTA_bus\(7);
\Mult1~16\ <= \Mult1~8_RESULTA_bus\(8);
\Mult1~17\ <= \Mult1~8_RESULTA_bus\(9);
\Mult1~18\ <= \Mult1~8_RESULTA_bus\(10);
\Mult1~19\ <= \Mult1~8_RESULTA_bus\(11);
\Mult1~20\ <= \Mult1~8_RESULTA_bus\(12);
\Mult1~21\ <= \Mult1~8_RESULTA_bus\(13);
\Mult1~22\ <= \Mult1~8_RESULTA_bus\(14);
\Mult1~23\ <= \Mult1~8_RESULTA_bus\(15);
\Mult1~24\ <= \Mult1~8_RESULTA_bus\(16);
\Mult1~25\ <= \Mult1~8_RESULTA_bus\(17);
\Mult1~26\ <= \Mult1~8_RESULTA_bus\(18);
\Mult1~27\ <= \Mult1~8_RESULTA_bus\(19);
\Mult1~28\ <= \Mult1~8_RESULTA_bus\(20);
\Mult1~29\ <= \Mult1~8_RESULTA_bus\(21);
\Mult1~30\ <= \Mult1~8_RESULTA_bus\(22);
\Mult1~31\ <= \Mult1~8_RESULTA_bus\(23);
\Mult1~32\ <= \Mult1~8_RESULTA_bus\(24);
\Mult1~33\ <= \Mult1~8_RESULTA_bus\(25);
\Mult1~34\ <= \Mult1~8_RESULTA_bus\(26);
\Mult1~35\ <= \Mult1~8_RESULTA_bus\(27);
\Mult1~36\ <= \Mult1~8_RESULTA_bus\(28);
\Mult1~37\ <= \Mult1~8_RESULTA_bus\(29);
\Mult1~38\ <= \Mult1~8_RESULTA_bus\(30);
\Mult1~39\ <= \Mult1~8_RESULTA_bus\(31);
\Mult1~40\ <= \Mult1~8_RESULTA_bus\(32);
\Mult1~41\ <= \Mult1~8_RESULTA_bus\(33);
\Mult1~42\ <= \Mult1~8_RESULTA_bus\(34);
\Mult1~43\ <= \Mult1~8_RESULTA_bus\(35);
\Mult1~44\ <= \Mult1~8_RESULTA_bus\(36);
\Mult1~45\ <= \Mult1~8_RESULTA_bus\(37);
\Mult1~46\ <= \Mult1~8_RESULTA_bus\(38);
\Mult1~47\ <= \Mult1~8_RESULTA_bus\(39);
\Mult1~48\ <= \Mult1~8_RESULTA_bus\(40);
\Mult1~49\ <= \Mult1~8_RESULTA_bus\(41);
\Mult1~50\ <= \Mult1~8_RESULTA_bus\(42);
\Mult1~51\ <= \Mult1~8_RESULTA_bus\(43);
\Mult1~52\ <= \Mult1~8_RESULTA_bus\(44);
\Mult1~53\ <= \Mult1~8_RESULTA_bus\(45);
\Mult1~54\ <= \Mult1~8_RESULTA_bus\(46);
\Mult1~55\ <= \Mult1~8_RESULTA_bus\(47);
\Mult1~56\ <= \Mult1~8_RESULTA_bus\(48);
\Mult1~57\ <= \Mult1~8_RESULTA_bus\(49);
\Mult1~58\ <= \Mult1~8_RESULTA_bus\(50);
\Mult1~59\ <= \Mult1~8_RESULTA_bus\(51);
\Mult1~60\ <= \Mult1~8_RESULTA_bus\(52);
\Mult1~61\ <= \Mult1~8_RESULTA_bus\(53);
\Mult1~62\ <= \Mult1~8_RESULTA_bus\(54);
\Mult1~63\ <= \Mult1~8_RESULTA_bus\(55);
\Mult1~64\ <= \Mult1~8_RESULTA_bus\(56);
\Mult1~65\ <= \Mult1~8_RESULTA_bus\(57);
\Mult1~66\ <= \Mult1~8_RESULTA_bus\(58);
\Mult1~67\ <= \Mult1~8_RESULTA_bus\(59);
\Mult1~68\ <= \Mult1~8_RESULTA_bus\(60);
\Mult1~69\ <= \Mult1~8_RESULTA_bus\(61);
\Mult1~70\ <= \Mult1~8_RESULTA_bus\(62);
\Mult1~71\ <= \Mult1~8_RESULTA_bus\(63);

\Mult1~349_ACLR_bus\ <= (gnd & gnd);

\Mult1~349_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult1~349_ENA_bus\ <= (vcc & vcc & vcc);

\Mult1~349_AX_bus\ <= (\Mult0~441_sumout\ & \Mult0~437_sumout\ & \Mult0~433_sumout\ & \Mult0~429_sumout\ & \Mult0~425_sumout\ & \Mult0~421_sumout\ & \Mult0~417_sumout\ & \Mult0~413_sumout\ & \Mult0~409_sumout\ & \Mult0~405_sumout\ & \Mult0~401_sumout\ & 
\Mult0~397_sumout\ & \Mult0~393_sumout\ & \Mult0~389_sumout\);

\Mult1~349_AY_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & 
\angle[3]~input_o\ & \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult1~349_BX_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Mult1~349_BY_bus\ <= (\Mult0~385_sumout\ & \Mult0~381_sumout\ & \Mult0~377_sumout\ & \Mult0~373_sumout\ & \Mult0~369_sumout\ & \Mult0~365_sumout\ & \Mult0~361_sumout\ & \Mult0~357_sumout\ & \Mult0~353_sumout\ & \Mult0~349_sumout\ & \Mult0~345_sumout\ & 
\Mult0~341_sumout\ & \Mult0~337_sumout\ & result1(4) & result1(3) & result1(2) & result1(1) & result1(0));

\Mult1~349_resulta\ <= \Mult1~349_RESULTA_bus\(0);
\Mult1~350\ <= \Mult1~349_RESULTA_bus\(1);
\Mult1~351\ <= \Mult1~349_RESULTA_bus\(2);
\Mult1~352\ <= \Mult1~349_RESULTA_bus\(3);
\Mult1~353\ <= \Mult1~349_RESULTA_bus\(4);
\Mult1~354\ <= \Mult1~349_RESULTA_bus\(5);
\Mult1~355\ <= \Mult1~349_RESULTA_bus\(6);
\Mult1~356\ <= \Mult1~349_RESULTA_bus\(7);
\Mult1~357\ <= \Mult1~349_RESULTA_bus\(8);
\Mult1~358\ <= \Mult1~349_RESULTA_bus\(9);
\Mult1~359\ <= \Mult1~349_RESULTA_bus\(10);
\Mult1~360\ <= \Mult1~349_RESULTA_bus\(11);
\Mult1~361\ <= \Mult1~349_RESULTA_bus\(12);
\Mult1~362\ <= \Mult1~349_RESULTA_bus\(13);
\Mult1~363\ <= \Mult1~349_RESULTA_bus\(14);
\Mult1~364\ <= \Mult1~349_RESULTA_bus\(15);
\Mult1~365\ <= \Mult1~349_RESULTA_bus\(16);
\Mult1~366\ <= \Mult1~349_RESULTA_bus\(17);
\Mult1~367\ <= \Mult1~349_RESULTA_bus\(18);
\Mult1~368\ <= \Mult1~349_RESULTA_bus\(19);
\Mult1~369\ <= \Mult1~349_RESULTA_bus\(20);
\Mult1~370\ <= \Mult1~349_RESULTA_bus\(21);
\Mult1~371\ <= \Mult1~349_RESULTA_bus\(22);
\Mult1~372\ <= \Mult1~349_RESULTA_bus\(23);
\Mult1~373\ <= \Mult1~349_RESULTA_bus\(24);
\Mult1~374\ <= \Mult1~349_RESULTA_bus\(25);
\Mult1~375\ <= \Mult1~349_RESULTA_bus\(26);
\Mult1~376\ <= \Mult1~349_RESULTA_bus\(27);
\Mult1~377\ <= \Mult1~349_RESULTA_bus\(28);
\Mult1~378\ <= \Mult1~349_RESULTA_bus\(29);
\Mult1~379\ <= \Mult1~349_RESULTA_bus\(30);
\Mult1~380\ <= \Mult1~349_RESULTA_bus\(31);
\Mult1~381\ <= \Mult1~349_RESULTA_bus\(32);
\Mult1~382\ <= \Mult1~349_RESULTA_bus\(33);
\Mult1~383\ <= \Mult1~349_RESULTA_bus\(34);
\Mult1~384\ <= \Mult1~349_RESULTA_bus\(35);
\Mult1~385\ <= \Mult1~349_RESULTA_bus\(36);
\Mult1~386\ <= \Mult1~349_RESULTA_bus\(37);
\Mult1~387\ <= \Mult1~349_RESULTA_bus\(38);
\Mult1~388\ <= \Mult1~349_RESULTA_bus\(39);
\Mult1~389\ <= \Mult1~349_RESULTA_bus\(40);
\Mult1~390\ <= \Mult1~349_RESULTA_bus\(41);
\Mult1~391\ <= \Mult1~349_RESULTA_bus\(42);
\Mult1~392\ <= \Mult1~349_RESULTA_bus\(43);
\Mult1~393\ <= \Mult1~349_RESULTA_bus\(44);
\Mult1~394\ <= \Mult1~349_RESULTA_bus\(45);
\Mult1~395\ <= \Mult1~349_RESULTA_bus\(46);
\Mult1~396\ <= \Mult1~349_RESULTA_bus\(47);
\Mult1~397\ <= \Mult1~349_RESULTA_bus\(48);
\Mult1~398\ <= \Mult1~349_RESULTA_bus\(49);
\Mult1~399\ <= \Mult1~349_RESULTA_bus\(50);
\Mult1~400\ <= \Mult1~349_RESULTA_bus\(51);
\Mult1~401\ <= \Mult1~349_RESULTA_bus\(52);
\Mult1~402\ <= \Mult1~349_RESULTA_bus\(53);
\Mult1~403\ <= \Mult1~349_RESULTA_bus\(54);
\Mult1~404\ <= \Mult1~349_RESULTA_bus\(55);
\Mult1~405\ <= \Mult1~349_RESULTA_bus\(56);
\Mult1~406\ <= \Mult1~349_RESULTA_bus\(57);
\Mult1~407\ <= \Mult1~349_RESULTA_bus\(58);
\Mult1~408\ <= \Mult1~349_RESULTA_bus\(59);
\Mult1~409\ <= \Mult1~349_RESULTA_bus\(60);
\Mult1~410\ <= \Mult1~349_RESULTA_bus\(61);
\Mult1~411\ <= \Mult1~349_RESULTA_bus\(62);
\Mult1~412\ <= \Mult1~349_RESULTA_bus\(63);

\Mult0~8_ACLR_bus\ <= (gnd & gnd);

\Mult0~8_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult0~8_ENA_bus\ <= (vcc & vcc & vcc);

\Mult0~8_AX_bus\ <= (gnd & gnd & vcc & vcc & vcc & gnd & vcc & vcc & gnd & gnd & vcc & gnd & gnd & gnd & vcc & gnd & vcc);

\Mult0~8_AY_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & \angle[3]~input_o\
& \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult0~8_resulta\ <= \Mult0~8_RESULTA_bus\(0);
\Mult0~9\ <= \Mult0~8_RESULTA_bus\(1);
\Mult0~10\ <= \Mult0~8_RESULTA_bus\(2);
\Mult0~11\ <= \Mult0~8_RESULTA_bus\(3);
\Mult0~12\ <= \Mult0~8_RESULTA_bus\(4);
\Mult0~13\ <= \Mult0~8_RESULTA_bus\(5);
\Mult0~14\ <= \Mult0~8_RESULTA_bus\(6);
\Mult0~15\ <= \Mult0~8_RESULTA_bus\(7);
\Mult0~16\ <= \Mult0~8_RESULTA_bus\(8);
\Mult0~17\ <= \Mult0~8_RESULTA_bus\(9);
\Mult0~18\ <= \Mult0~8_RESULTA_bus\(10);
\Mult0~19\ <= \Mult0~8_RESULTA_bus\(11);
\Mult0~20\ <= \Mult0~8_RESULTA_bus\(12);
result1(0) <= \Mult0~8_RESULTA_bus\(13);
result1(1) <= \Mult0~8_RESULTA_bus\(14);
result1(2) <= \Mult0~8_RESULTA_bus\(15);
result1(3) <= \Mult0~8_RESULTA_bus\(16);
result1(4) <= \Mult0~8_RESULTA_bus\(17);
\Mult0~21\ <= \Mult0~8_RESULTA_bus\(18);
\Mult0~22\ <= \Mult0~8_RESULTA_bus\(19);
\Mult0~23\ <= \Mult0~8_RESULTA_bus\(20);
\Mult0~24\ <= \Mult0~8_RESULTA_bus\(21);
\Mult0~25\ <= \Mult0~8_RESULTA_bus\(22);
\Mult0~26\ <= \Mult0~8_RESULTA_bus\(23);
\Mult0~27\ <= \Mult0~8_RESULTA_bus\(24);
\Mult0~28\ <= \Mult0~8_RESULTA_bus\(25);
\Mult0~29\ <= \Mult0~8_RESULTA_bus\(26);
\Mult0~30\ <= \Mult0~8_RESULTA_bus\(27);
\Mult0~31\ <= \Mult0~8_RESULTA_bus\(28);
\Mult0~32\ <= \Mult0~8_RESULTA_bus\(29);
\Mult0~33\ <= \Mult0~8_RESULTA_bus\(30);
\Mult0~34\ <= \Mult0~8_RESULTA_bus\(31);
\Mult0~35\ <= \Mult0~8_RESULTA_bus\(32);
\Mult0~36\ <= \Mult0~8_RESULTA_bus\(33);
\Mult0~37\ <= \Mult0~8_RESULTA_bus\(34);
\Mult0~38\ <= \Mult0~8_RESULTA_bus\(35);
\Mult0~39\ <= \Mult0~8_RESULTA_bus\(36);
\Mult0~40\ <= \Mult0~8_RESULTA_bus\(37);
\Mult0~41\ <= \Mult0~8_RESULTA_bus\(38);
\Mult0~42\ <= \Mult0~8_RESULTA_bus\(39);
\Mult0~43\ <= \Mult0~8_RESULTA_bus\(40);
\Mult0~44\ <= \Mult0~8_RESULTA_bus\(41);
\Mult0~45\ <= \Mult0~8_RESULTA_bus\(42);
\Mult0~46\ <= \Mult0~8_RESULTA_bus\(43);
\Mult0~47\ <= \Mult0~8_RESULTA_bus\(44);
\Mult0~48\ <= \Mult0~8_RESULTA_bus\(45);
\Mult0~49\ <= \Mult0~8_RESULTA_bus\(46);
\Mult0~50\ <= \Mult0~8_RESULTA_bus\(47);
\Mult0~51\ <= \Mult0~8_RESULTA_bus\(48);
\Mult0~52\ <= \Mult0~8_RESULTA_bus\(49);
\Mult0~53\ <= \Mult0~8_RESULTA_bus\(50);
\Mult0~54\ <= \Mult0~8_RESULTA_bus\(51);
\Mult0~55\ <= \Mult0~8_RESULTA_bus\(52);
\Mult0~56\ <= \Mult0~8_RESULTA_bus\(53);
\Mult0~57\ <= \Mult0~8_RESULTA_bus\(54);
\Mult0~58\ <= \Mult0~8_RESULTA_bus\(55);
\Mult0~59\ <= \Mult0~8_RESULTA_bus\(56);
\Mult0~60\ <= \Mult0~8_RESULTA_bus\(57);
\Mult0~61\ <= \Mult0~8_RESULTA_bus\(58);
\Mult0~62\ <= \Mult0~8_RESULTA_bus\(59);
\Mult0~63\ <= \Mult0~8_RESULTA_bus\(60);
\Mult0~64\ <= \Mult0~8_RESULTA_bus\(61);
\Mult0~65\ <= \Mult0~8_RESULTA_bus\(62);
\Mult0~66\ <= \Mult0~8_RESULTA_bus\(63);

\Mult0~452_ACLR_bus\ <= (gnd & gnd);

\Mult0~452_CLK_bus\ <= (gnd & gnd & \clk~inputCLKENA0_outclk\);

\Mult0~452_ENA_bus\ <= (vcc & vcc & vcc);

\Mult0~452_AX_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Mult0~452_AY_bus\ <= (gnd & gnd & vcc & vcc & vcc & gnd & vcc & vcc & gnd & gnd & vcc & gnd & gnd & gnd & vcc & gnd & vcc);

\Mult0~452_BX_bus\(0) <= vcc;

\Mult0~452_BY_bus\ <= (gnd & gnd & gnd & gnd & \angle[12]~input_o\ & \angle[11]~input_o\ & \angle[10]~input_o\ & \angle[9]~input_o\ & \angle[8]~input_o\ & \angle[7]~input_o\ & \angle[6]~input_o\ & \angle[5]~input_o\ & \angle[4]~input_o\ & 
\angle[3]~input_o\ & \angle[2]~input_o\ & \angle[1]~input_o\ & \angle[0]~input_o\);

\Mult0~452_resulta\ <= \Mult0~452_RESULTA_bus\(0);
\Mult0~453\ <= \Mult0~452_RESULTA_bus\(1);
\Mult0~454\ <= \Mult0~452_RESULTA_bus\(2);
\Mult0~455\ <= \Mult0~452_RESULTA_bus\(3);
\Mult0~456\ <= \Mult0~452_RESULTA_bus\(4);
\Mult0~457\ <= \Mult0~452_RESULTA_bus\(5);
\Mult0~458\ <= \Mult0~452_RESULTA_bus\(6);
\Mult0~459\ <= \Mult0~452_RESULTA_bus\(7);
\Mult0~460\ <= \Mult0~452_RESULTA_bus\(8);
\Mult0~461\ <= \Mult0~452_RESULTA_bus\(9);
\Mult0~462\ <= \Mult0~452_RESULTA_bus\(10);
\Mult0~463\ <= \Mult0~452_RESULTA_bus\(11);
\Mult0~464\ <= \Mult0~452_RESULTA_bus\(12);
\Mult0~465\ <= \Mult0~452_RESULTA_bus\(13);
\Mult0~466\ <= \Mult0~452_RESULTA_bus\(14);
\Mult0~467\ <= \Mult0~452_RESULTA_bus\(15);
\Mult0~468\ <= \Mult0~452_RESULTA_bus\(16);
\Mult0~469\ <= \Mult0~452_RESULTA_bus\(17);
\Mult0~470\ <= \Mult0~452_RESULTA_bus\(18);
\Mult0~471\ <= \Mult0~452_RESULTA_bus\(19);
\Mult0~472\ <= \Mult0~452_RESULTA_bus\(20);
\Mult0~473\ <= \Mult0~452_RESULTA_bus\(21);
\Mult0~474\ <= \Mult0~452_RESULTA_bus\(22);
\Mult0~475\ <= \Mult0~452_RESULTA_bus\(23);
\Mult0~476\ <= \Mult0~452_RESULTA_bus\(24);
\Mult0~477\ <= \Mult0~452_RESULTA_bus\(25);
\Mult0~478\ <= \Mult0~452_RESULTA_bus\(26);
\Mult0~479\ <= \Mult0~452_RESULTA_bus\(27);
\Mult0~480\ <= \Mult0~452_RESULTA_bus\(28);
\Mult0~481\ <= \Mult0~452_RESULTA_bus\(29);
\Mult0~482\ <= \Mult0~452_RESULTA_bus\(30);
\Mult0~483\ <= \Mult0~452_RESULTA_bus\(31);
\Mult0~484\ <= \Mult0~452_RESULTA_bus\(32);
\Mult0~485\ <= \Mult0~452_RESULTA_bus\(33);
\Mult0~486\ <= \Mult0~452_RESULTA_bus\(34);
\Mult0~487\ <= \Mult0~452_RESULTA_bus\(35);
\Mult0~488\ <= \Mult0~452_RESULTA_bus\(36);
\Mult0~489\ <= \Mult0~452_RESULTA_bus\(37);
\Mult0~490\ <= \Mult0~452_RESULTA_bus\(38);
\Mult0~491\ <= \Mult0~452_RESULTA_bus\(39);
\Mult0~492\ <= \Mult0~452_RESULTA_bus\(40);
\Mult0~493\ <= \Mult0~452_RESULTA_bus\(41);
\Mult0~494\ <= \Mult0~452_RESULTA_bus\(42);
\Mult0~495\ <= \Mult0~452_RESULTA_bus\(43);
\Mult0~496\ <= \Mult0~452_RESULTA_bus\(44);
\Mult0~497\ <= \Mult0~452_RESULTA_bus\(45);
\Mult0~498\ <= \Mult0~452_RESULTA_bus\(46);
\Mult0~499\ <= \Mult0~452_RESULTA_bus\(47);
\Mult0~500\ <= \Mult0~452_RESULTA_bus\(48);
\Mult0~501\ <= \Mult0~452_RESULTA_bus\(49);
\Mult0~502\ <= \Mult0~452_RESULTA_bus\(50);
\Mult0~503\ <= \Mult0~452_RESULTA_bus\(51);
\Mult0~504\ <= \Mult0~452_RESULTA_bus\(52);
\Mult0~505\ <= \Mult0~452_RESULTA_bus\(53);
\Mult0~506\ <= \Mult0~452_RESULTA_bus\(54);
\Mult0~507\ <= \Mult0~452_RESULTA_bus\(55);
\Mult0~508\ <= \Mult0~452_RESULTA_bus\(56);
\Mult0~509\ <= \Mult0~452_RESULTA_bus\(57);
\Mult0~510\ <= \Mult0~452_RESULTA_bus\(58);
\Mult0~511\ <= \Mult0~452_RESULTA_bus\(59);
\Mult0~512\ <= \Mult0~452_RESULTA_bus\(60);
\Mult0~513\ <= \Mult0~452_RESULTA_bus\(61);
\Mult0~514\ <= \Mult0~452_RESULTA_bus\(62);
\Mult0~515\ <= \Mult0~452_RESULTA_bus\(63);

\Mult0~793_AX_bus\(0) <= vcc;

\Mult0~793_AY_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Mult0~793_resulta\ <= \Mult0~793_RESULTA_bus\(0);
\Mult0~794\ <= \Mult0~793_RESULTA_bus\(1);
\Mult0~795\ <= \Mult0~793_RESULTA_bus\(2);
\Mult0~796\ <= \Mult0~793_RESULTA_bus\(3);
\Mult0~797\ <= \Mult0~793_RESULTA_bus\(4);
\Mult0~798\ <= \Mult0~793_RESULTA_bus\(5);
\Mult0~799\ <= \Mult0~793_RESULTA_bus\(6);
\Mult0~800\ <= \Mult0~793_RESULTA_bus\(7);
\Mult0~801\ <= \Mult0~793_RESULTA_bus\(8);
\Mult0~802\ <= \Mult0~793_RESULTA_bus\(9);
\Mult0~803\ <= \Mult0~793_RESULTA_bus\(10);
\Mult0~804\ <= \Mult0~793_RESULTA_bus\(11);
\Mult0~805\ <= \Mult0~793_RESULTA_bus\(12);
\Mult0~806\ <= \Mult0~793_RESULTA_bus\(13);
\Mult0~807\ <= \Mult0~793_RESULTA_bus\(14);
\Mult0~808\ <= \Mult0~793_RESULTA_bus\(15);
\Mult0~809\ <= \Mult0~793_RESULTA_bus\(16);
\Mult0~810\ <= \Mult0~793_RESULTA_bus\(17);
\Mult0~811\ <= \Mult0~793_RESULTA_bus\(18);
\Mult0~812\ <= \Mult0~793_RESULTA_bus\(19);
\Mult0~813\ <= \Mult0~793_RESULTA_bus\(20);
\Mult0~814\ <= \Mult0~793_RESULTA_bus\(21);
\Mult0~815\ <= \Mult0~793_RESULTA_bus\(22);
\Mult0~816\ <= \Mult0~793_RESULTA_bus\(23);
\Mult0~817\ <= \Mult0~793_RESULTA_bus\(24);
\Mult0~818\ <= \Mult0~793_RESULTA_bus\(25);
\Mult0~819\ <= \Mult0~793_RESULTA_bus\(26);
\Mult0~820\ <= \Mult0~793_RESULTA_bus\(27);
\Mult0~821\ <= \Mult0~793_RESULTA_bus\(28);
\Mult0~822\ <= \Mult0~793_RESULTA_bus\(29);
\Mult0~823\ <= \Mult0~793_RESULTA_bus\(30);
\Mult0~824\ <= \Mult0~793_RESULTA_bus\(31);
\Mult0~825\ <= \Mult0~793_RESULTA_bus\(32);
\Mult0~826\ <= \Mult0~793_RESULTA_bus\(33);
\Mult0~827\ <= \Mult0~793_RESULTA_bus\(34);
\Mult0~828\ <= \Mult0~793_RESULTA_bus\(35);
\Mult0~829\ <= \Mult0~793_RESULTA_bus\(36);
\Mult0~830\ <= \Mult0~793_RESULTA_bus\(37);
\Mult0~831\ <= \Mult0~793_RESULTA_bus\(38);
\Mult0~832\ <= \Mult0~793_RESULTA_bus\(39);
\Mult0~833\ <= \Mult0~793_RESULTA_bus\(40);
\Mult0~834\ <= \Mult0~793_RESULTA_bus\(41);
\Mult0~835\ <= \Mult0~793_RESULTA_bus\(42);
\Mult0~836\ <= \Mult0~793_RESULTA_bus\(43);
\Mult0~837\ <= \Mult0~793_RESULTA_bus\(44);
\Mult0~838\ <= \Mult0~793_RESULTA_bus\(45);
\Mult0~839\ <= \Mult0~793_RESULTA_bus\(46);
\Mult0~840\ <= \Mult0~793_RESULTA_bus\(47);
\Mult0~841\ <= \Mult0~793_RESULTA_bus\(48);
\Mult0~842\ <= \Mult0~793_RESULTA_bus\(49);
\Mult0~843\ <= \Mult0~793_RESULTA_bus\(50);
\Mult0~844\ <= \Mult0~793_RESULTA_bus\(51);
\Mult0~845\ <= \Mult0~793_RESULTA_bus\(52);
\Mult0~846\ <= \Mult0~793_RESULTA_bus\(53);
\Mult0~847\ <= \Mult0~793_RESULTA_bus\(54);
\Mult0~848\ <= \Mult0~793_RESULTA_bus\(55);
\Mult0~849\ <= \Mult0~793_RESULTA_bus\(56);
\Mult0~850\ <= \Mult0~793_RESULTA_bus\(57);
\Mult0~851\ <= \Mult0~793_RESULTA_bus\(58);
\Mult0~852\ <= \Mult0~793_RESULTA_bus\(59);
\Mult0~853\ <= \Mult0~793_RESULTA_bus\(60);
\Mult0~854\ <= \Mult0~793_RESULTA_bus\(61);
\Mult0~855\ <= \Mult0~793_RESULTA_bus\(62);
\Mult0~856\ <= \Mult0~793_RESULTA_bus\(63);
\ALT_INV_Mult4~347\ <= NOT \Mult4~347\;
\ALT_INV_Mult4~346_resulta\ <= NOT \Mult4~346_resulta\;
\ALT_INV_Mult4~16\ <= NOT \Mult4~16\;
\ALT_INV_Mult4~15\ <= NOT \Mult4~15\;
ALT_INV_result6(17) <= NOT result6(17);
ALT_INV_result6(16) <= NOT result6(16);
ALT_INV_result6(15) <= NOT result6(15);
ALT_INV_result6(14) <= NOT result6(14);
ALT_INV_result6(13) <= NOT result6(13);
ALT_INV_result6(12) <= NOT result6(12);
ALT_INV_result6(11) <= NOT result6(11);
ALT_INV_result6(10) <= NOT result6(10);
ALT_INV_result6(8) <= NOT result6(8);
ALT_INV_result6(7) <= NOT result6(7);
\ALT_INV_Mult3~344_sumout\ <= NOT \Mult3~344_sumout\;
\ALT_INV_Mult3~340_sumout\ <= NOT \Mult3~340_sumout\;
\ALT_INV_Mult3~336_sumout\ <= NOT \Mult3~336_sumout\;
\ALT_INV_Mult3~332_sumout\ <= NOT \Mult3~332_sumout\;
\ALT_INV_Mult3~328_sumout\ <= NOT \Mult3~328_sumout\;
\ALT_INV_Mult3~324_sumout\ <= NOT \Mult3~324_sumout\;
\ALT_INV_Mult3~21\ <= NOT \Mult3~21\;
\ALT_INV_Mult3~20\ <= NOT \Mult3~20\;
\ALT_INV_Mult3~19\ <= NOT \Mult3~19\;
\ALT_INV_Mult3~18\ <= NOT \Mult3~18\;
\ALT_INV_Mult3~17\ <= NOT \Mult3~17\;
\ALT_INV_Mult3~16\ <= NOT \Mult3~16\;
\ALT_INV_Mult3~15\ <= NOT \Mult3~15\;
\ALT_INV_Mult3~14\ <= NOT \Mult3~14\;
\ALT_INV_Mult3~13\ <= NOT \Mult3~13\;
\ALT_INV_Mult3~12\ <= NOT \Mult3~12\;
\ALT_INV_Mult3~11\ <= NOT \Mult3~11\;
\ALT_INV_Mult3~10\ <= NOT \Mult3~10\;
\ALT_INV_Mult3~9\ <= NOT \Mult3~9\;
\ALT_INV_Mult3~8\ <= NOT \Mult3~8\;
ALT_INV_result4(17) <= NOT result4(17);
ALT_INV_result4(16) <= NOT result4(16);
ALT_INV_result4(15) <= NOT result4(15);
ALT_INV_result4(14) <= NOT result4(14);
ALT_INV_result4(13) <= NOT result4(13);
ALT_INV_result4(12) <= NOT result4(12);
ALT_INV_result4(11) <= NOT result4(11);
ALT_INV_result4(10) <= NOT result4(10);
ALT_INV_result4(9) <= NOT result4(9);
ALT_INV_result4(8) <= NOT result4(8);
ALT_INV_result4(7) <= NOT result4(7);
ALT_INV_result4(6) <= NOT result4(6);
ALT_INV_result4(5) <= NOT result4(5);
ALT_INV_result4(4) <= NOT result4(4);
ALT_INV_result4(3) <= NOT result4(3);
ALT_INV_result4(2) <= NOT result4(2);
ALT_INV_result4(1) <= NOT result4(1);
ALT_INV_result4(0) <= NOT result4(0);
\ALT_INV_Mult3~385\ <= NOT \Mult3~385\;
\ALT_INV_Mult3~384\ <= NOT \Mult3~384\;
\ALT_INV_Mult3~383_resulta\ <= NOT \Mult3~383_resulta\;
\ALT_INV_Mult2~21\ <= NOT \Mult2~21\;
\ALT_INV_Mult2~20\ <= NOT \Mult2~20\;
\ALT_INV_Mult2~19\ <= NOT \Mult2~19\;
\ALT_INV_Mult2~18\ <= NOT \Mult2~18\;
\ALT_INV_Mult2~17\ <= NOT \Mult2~17\;
\ALT_INV_Mult2~16\ <= NOT \Mult2~16\;
\ALT_INV_Mult2~15\ <= NOT \Mult2~15\;
\ALT_INV_Mult2~14\ <= NOT \Mult2~14\;
\ALT_INV_Mult2~13\ <= NOT \Mult2~13\;
\ALT_INV_Mult2~12\ <= NOT \Mult2~12\;
\ALT_INV_Mult2~11\ <= NOT \Mult2~11\;
\ALT_INV_Mult2~10\ <= NOT \Mult2~10\;
\ALT_INV_Mult2~9\ <= NOT \Mult2~9\;
\ALT_INV_Mult2~8\ <= NOT \Mult2~8\;
\ALT_INV_Mult3~372_sumout\ <= NOT \Mult3~372_sumout\;
\ALT_INV_Mult3~368_sumout\ <= NOT \Mult3~368_sumout\;
\ALT_INV_Mult3~364_sumout\ <= NOT \Mult3~364_sumout\;
\ALT_INV_Mult3~360_sumout\ <= NOT \Mult3~360_sumout\;
\ALT_INV_Mult3~356_sumout\ <= NOT \Mult3~356_sumout\;
\ALT_INV_Mult3~352_sumout\ <= NOT \Mult3~352_sumout\;
\ALT_INV_Mult3~348_sumout\ <= NOT \Mult3~348_sumout\;
\ALT_INV_Mult2~391\ <= NOT \Mult2~391\;
\ALT_INV_Mult2~390\ <= NOT \Mult2~390\;
\ALT_INV_Mult2~389\ <= NOT \Mult2~389\;
\ALT_INV_Mult2~388\ <= NOT \Mult2~388\;
\ALT_INV_Mult2~387\ <= NOT \Mult2~387\;
\ALT_INV_Mult2~386\ <= NOT \Mult2~386\;
\ALT_INV_Mult2~385\ <= NOT \Mult2~385\;
\ALT_INV_Mult2~384\ <= NOT \Mult2~384\;
\ALT_INV_Mult2~383_resulta\ <= NOT \Mult2~383_resulta\;
\ALT_INV_Mult3~717_sumout\ <= NOT \Mult3~717_sumout\;
\ALT_INV_Mult3~396\ <= NOT \Mult3~396\;
\ALT_INV_Mult3~395\ <= NOT \Mult3~395\;
\ALT_INV_Mult3~394\ <= NOT \Mult3~394\;
\ALT_INV_Mult3~393\ <= NOT \Mult3~393\;
\ALT_INV_Mult3~392\ <= NOT \Mult3~392\;
\ALT_INV_Mult3~391\ <= NOT \Mult3~391\;
\ALT_INV_Mult3~390\ <= NOT \Mult3~390\;
\ALT_INV_Mult3~389\ <= NOT \Mult3~389\;
\ALT_INV_Mult3~388\ <= NOT \Mult3~388\;
\ALT_INV_Mult3~387\ <= NOT \Mult3~387\;
\ALT_INV_Mult3~386\ <= NOT \Mult3~386\;
\ALT_INV_Mult1~352\ <= NOT \Mult1~352\;
\ALT_INV_Mult1~351\ <= NOT \Mult1~351\;
\ALT_INV_Mult1~350\ <= NOT \Mult1~350\;
\ALT_INV_Mult1~349_resulta\ <= NOT \Mult1~349_resulta\;
\ALT_INV_Mult1~42\ <= NOT \Mult1~42\;
\ALT_INV_Mult1~41\ <= NOT \Mult1~41\;
\ALT_INV_Mult1~40\ <= NOT \Mult1~40\;
\ALT_INV_Mult1~39\ <= NOT \Mult1~39\;
\ALT_INV_Mult1~38\ <= NOT \Mult1~38\;
\ALT_INV_Mult1~37\ <= NOT \Mult1~37\;
\ALT_INV_Mult1~36\ <= NOT \Mult1~36\;
\ALT_INV_Mult1~35\ <= NOT \Mult1~35\;
\ALT_INV_Mult1~34\ <= NOT \Mult1~34\;
\ALT_INV_Mult1~33\ <= NOT \Mult1~33\;
\ALT_INV_Mult1~32\ <= NOT \Mult1~32\;
\ALT_INV_Mult1~31\ <= NOT \Mult1~31\;
\ALT_INV_Mult1~30\ <= NOT \Mult1~30\;
\ALT_INV_Mult1~29\ <= NOT \Mult1~29\;
\ALT_INV_Mult1~28\ <= NOT \Mult1~28\;
\ALT_INV_Mult1~27\ <= NOT \Mult1~27\;
\ALT_INV_Mult1~26\ <= NOT \Mult1~26\;
\ALT_INV_Mult1~25\ <= NOT \Mult1~25\;
\ALT_INV_Mult1~24\ <= NOT \Mult1~24\;
\ALT_INV_Mult1~23\ <= NOT \Mult1~23\;
\ALT_INV_Mult1~22\ <= NOT \Mult1~22\;
\ALT_INV_Mult1~21\ <= NOT \Mult1~21\;
\ALT_INV_Mult1~20\ <= NOT \Mult1~20\;
\ALT_INV_Mult1~19\ <= NOT \Mult1~19\;
\ALT_INV_Mult1~18\ <= NOT \Mult1~18\;
\ALT_INV_Mult1~17\ <= NOT \Mult1~17\;
\ALT_INV_Mult1~16\ <= NOT \Mult1~16\;
\ALT_INV_Mult1~15\ <= NOT \Mult1~15\;
\ALT_INV_Mult1~14\ <= NOT \Mult1~14\;
\ALT_INV_Mult1~13\ <= NOT \Mult1~13\;
\ALT_INV_Mult1~12\ <= NOT \Mult1~12\;
\ALT_INV_Mult1~11\ <= NOT \Mult1~11\;
\ALT_INV_Mult2~396\ <= NOT \Mult2~396\;
\ALT_INV_Mult2~395\ <= NOT \Mult2~395\;
\ALT_INV_Mult2~394\ <= NOT \Mult2~394\;
\ALT_INV_Mult2~393\ <= NOT \Mult2~393\;
\ALT_INV_Mult2~392\ <= NOT \Mult2~392\;
\ALT_INV_Mult0~34\ <= NOT \Mult0~34\;
\ALT_INV_Mult0~33\ <= NOT \Mult0~33\;
\ALT_INV_Mult0~32\ <= NOT \Mult0~32\;
\ALT_INV_Mult0~31\ <= NOT \Mult0~31\;
\ALT_INV_Mult0~30\ <= NOT \Mult0~30\;
\ALT_INV_Mult0~29\ <= NOT \Mult0~29\;
\ALT_INV_Mult0~28\ <= NOT \Mult0~28\;
\ALT_INV_Mult0~27\ <= NOT \Mult0~27\;
\ALT_INV_Mult0~26\ <= NOT \Mult0~26\;
\ALT_INV_Mult0~25\ <= NOT \Mult0~25\;
\ALT_INV_Mult0~24\ <= NOT \Mult0~24\;
\ALT_INV_Mult0~23\ <= NOT \Mult0~23\;
\ALT_INV_Mult0~22\ <= NOT \Mult0~22\;
\ALT_INV_Mult0~21\ <= NOT \Mult0~21\;
\ALT_INV_Mult1~365\ <= NOT \Mult1~365\;
\ALT_INV_Mult1~364\ <= NOT \Mult1~364\;
\ALT_INV_Mult1~363\ <= NOT \Mult1~363\;
\ALT_INV_Mult1~362\ <= NOT \Mult1~362\;
\ALT_INV_Mult1~361\ <= NOT \Mult1~361\;
\ALT_INV_Mult1~360\ <= NOT \Mult1~360\;
\ALT_INV_Mult1~359\ <= NOT \Mult1~359\;
\ALT_INV_Mult1~358\ <= NOT \Mult1~358\;
\ALT_INV_Mult1~357\ <= NOT \Mult1~357\;
\ALT_INV_Mult1~356\ <= NOT \Mult1~356\;
\ALT_INV_Mult1~355\ <= NOT \Mult1~355\;
\ALT_INV_Mult1~354\ <= NOT \Mult1~354\;
\ALT_INV_Mult1~353\ <= NOT \Mult1~353\;
\ALT_INV_Mult0~478\ <= NOT \Mult0~478\;
\ALT_INV_Mult0~477\ <= NOT \Mult0~477\;
\ALT_INV_Mult0~476\ <= NOT \Mult0~476\;
\ALT_INV_Mult0~475\ <= NOT \Mult0~475\;
\ALT_INV_Mult0~474\ <= NOT \Mult0~474\;
\ALT_INV_Mult0~473\ <= NOT \Mult0~473\;
\ALT_INV_Mult0~472\ <= NOT \Mult0~472\;
\ALT_INV_Mult0~471\ <= NOT \Mult0~471\;
\ALT_INV_Mult0~470\ <= NOT \Mult0~470\;
\ALT_INV_Mult0~469\ <= NOT \Mult0~469\;
\ALT_INV_Mult0~468\ <= NOT \Mult0~468\;
\ALT_INV_Mult0~467\ <= NOT \Mult0~467\;
\ALT_INV_Mult0~466\ <= NOT \Mult0~466\;
\ALT_INV_Mult0~465\ <= NOT \Mult0~465\;
\ALT_INV_Mult0~464\ <= NOT \Mult0~464\;
\ALT_INV_Mult0~463\ <= NOT \Mult0~463\;
\ALT_INV_Mult0~462\ <= NOT \Mult0~462\;
\ALT_INV_Mult0~461\ <= NOT \Mult0~461\;
\ALT_INV_Mult0~460\ <= NOT \Mult0~460\;
\ALT_INV_Mult0~459\ <= NOT \Mult0~459\;
\ALT_INV_Mult0~458\ <= NOT \Mult0~458\;
\ALT_INV_Mult0~457\ <= NOT \Mult0~457\;
\ALT_INV_Mult0~456\ <= NOT \Mult0~456\;
\ALT_INV_Mult0~455\ <= NOT \Mult0~455\;
\ALT_INV_Mult0~454\ <= NOT \Mult0~454\;
\ALT_INV_Mult0~453\ <= NOT \Mult0~453\;
\ALT_INV_Mult0~452_resulta\ <= NOT \Mult0~452_resulta\;
\ALT_INV_Mult0~38\ <= NOT \Mult0~38\;
\ALT_INV_Mult0~37\ <= NOT \Mult0~37\;
\ALT_INV_Mult0~36\ <= NOT \Mult0~36\;
\ALT_INV_Mult0~35\ <= NOT \Mult0~35\;
\ALT_INV_Mult0~801\ <= NOT \Mult0~801\;
\ALT_INV_Mult0~800\ <= NOT \Mult0~800\;
\ALT_INV_Mult0~799\ <= NOT \Mult0~799\;
\ALT_INV_Mult0~798\ <= NOT \Mult0~798\;
\ALT_INV_Mult0~797\ <= NOT \Mult0~797\;
\ALT_INV_Mult0~796\ <= NOT \Mult0~796\;
\ALT_INV_Mult0~795\ <= NOT \Mult0~795\;
\ALT_INV_Mult0~794\ <= NOT \Mult0~794\;
\ALT_INV_Mult0~793_resulta\ <= NOT \Mult0~793_resulta\;

-- Location: IOOBUF_X18_Y0_N59
\sine_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(0));

-- Location: IOOBUF_X22_Y0_N36
\sine_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(1));

-- Location: IOOBUF_X22_Y0_N53
\sine_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(2));

-- Location: IOOBUF_X26_Y0_N76
\sine_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(3));

-- Location: IOOBUF_X24_Y0_N19
\sine_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[4]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(4));

-- Location: IOOBUF_X22_Y0_N19
\sine_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[5]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(5));

-- Location: IOOBUF_X18_Y0_N42
\sine_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[6]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(6));

-- Location: IOOBUF_X18_Y0_N93
\sine_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[7]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(7));

-- Location: IOOBUF_X24_Y0_N2
\sine_out[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[8]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(8));

-- Location: IOOBUF_X18_Y0_N76
\sine_out[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[9]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(9));

-- Location: IOOBUF_X22_Y0_N2
\sine_out[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[10]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(10));

-- Location: IOOBUF_X24_Y0_N36
\sine_out[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[11]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(11));

-- Location: IOOBUF_X16_Y0_N36
\sine_out[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sine_out[12]~reg0_q\,
	devoe => ww_devoe,
	o => ww_sine_out(12));

-- Location: IOIBUF_X89_Y25_N21
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X34_Y0_N41
\angle[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(0),
	o => \angle[0]~input_o\);

-- Location: IOIBUF_X26_Y0_N41
\angle[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(1),
	o => \angle[1]~input_o\);

-- Location: IOIBUF_X20_Y0_N1
\angle[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(2),
	o => \angle[2]~input_o\);

-- Location: IOIBUF_X26_Y0_N58
\angle[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(3),
	o => \angle[3]~input_o\);

-- Location: IOIBUF_X32_Y0_N52
\angle[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(4),
	o => \angle[4]~input_o\);

-- Location: IOIBUF_X26_Y0_N92
\angle[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(5),
	o => \angle[5]~input_o\);

-- Location: IOIBUF_X20_Y0_N35
\angle[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(6),
	o => \angle[6]~input_o\);

-- Location: IOIBUF_X28_Y0_N18
\angle[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(7),
	o => \angle[7]~input_o\);

-- Location: IOIBUF_X28_Y0_N35
\angle[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(8),
	o => \angle[8]~input_o\);

-- Location: IOIBUF_X24_Y0_N52
\angle[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(9),
	o => \angle[9]~input_o\);

-- Location: IOIBUF_X20_Y0_N52
\angle[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(10),
	o => \angle[10]~input_o\);

-- Location: IOIBUF_X20_Y0_N18
\angle[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(11),
	o => \angle[11]~input_o\);

-- Location: IOIBUF_X30_Y0_N18
\angle[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_angle(12),
	o => \angle[12]~input_o\);

-- Location: DSP_X32_Y2_N0
\Mult0~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 17,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 17,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_full",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult0~8_ACLR_bus\,
	clk => \Mult0~8_CLK_bus\,
	ena => \Mult0~8_ENA_bus\,
	ax => \Mult0~8_AX_bus\,
	ay => \Mult0~8_AY_bus\,
	resulta => \Mult0~8_RESULTA_bus\);

-- Location: DSP_X32_Y4_N0
\Mult0~452\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 13,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 17,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	bx_width => 1,
	by_clock => "0",
	by_use_scan_in => "false",
	by_width => 17,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_sumof2",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult0~452_ACLR_bus\,
	clk => \Mult0~452_CLK_bus\,
	ena => \Mult0~452_ENA_bus\,
	ax => \Mult0~452_AX_bus\,
	ay => \Mult0~452_AY_bus\,
	bx => \Mult0~452_BX_bus\,
	by => \Mult0~452_BY_bus\,
	resulta => \Mult0~452_RESULTA_bus\);

-- Location: LABCELL_X31_Y5_N30
\Mult0~337\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~337_sumout\ = SUM(( \Mult0~452_resulta\ ) + ( \Mult0~21\ ) + ( !VCC ))
-- \Mult0~338\ = CARRY(( \Mult0~452_resulta\ ) + ( \Mult0~21\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~21\,
	datad => \ALT_INV_Mult0~452_resulta\,
	cin => GND,
	sumout => \Mult0~337_sumout\,
	cout => \Mult0~338\);

-- Location: LABCELL_X31_Y5_N33
\Mult0~341\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~341_sumout\ = SUM(( \Mult0~453\ ) + ( \Mult0~22\ ) + ( \Mult0~338\ ))
-- \Mult0~342\ = CARRY(( \Mult0~453\ ) + ( \Mult0~22\ ) + ( \Mult0~338\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~22\,
	datad => \ALT_INV_Mult0~453\,
	cin => \Mult0~338\,
	sumout => \Mult0~341_sumout\,
	cout => \Mult0~342\);

-- Location: LABCELL_X31_Y5_N36
\Mult0~345\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~345_sumout\ = SUM(( \Mult0~454\ ) + ( \Mult0~23\ ) + ( \Mult0~342\ ))
-- \Mult0~346\ = CARRY(( \Mult0~454\ ) + ( \Mult0~23\ ) + ( \Mult0~342\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~23\,
	datad => \ALT_INV_Mult0~454\,
	cin => \Mult0~342\,
	sumout => \Mult0~345_sumout\,
	cout => \Mult0~346\);

-- Location: LABCELL_X31_Y5_N39
\Mult0~349\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~349_sumout\ = SUM(( \Mult0~455\ ) + ( \Mult0~24\ ) + ( \Mult0~346\ ))
-- \Mult0~350\ = CARRY(( \Mult0~455\ ) + ( \Mult0~24\ ) + ( \Mult0~346\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult0~24\,
	datad => \ALT_INV_Mult0~455\,
	cin => \Mult0~346\,
	sumout => \Mult0~349_sumout\,
	cout => \Mult0~350\);

-- Location: LABCELL_X31_Y5_N42
\Mult0~353\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~353_sumout\ = SUM(( \Mult0~25\ ) + ( \Mult0~456\ ) + ( \Mult0~350\ ))
-- \Mult0~354\ = CARRY(( \Mult0~25\ ) + ( \Mult0~456\ ) + ( \Mult0~350\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~456\,
	datad => \ALT_INV_Mult0~25\,
	cin => \Mult0~350\,
	sumout => \Mult0~353_sumout\,
	cout => \Mult0~354\);

-- Location: LABCELL_X31_Y5_N45
\Mult0~357\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~357_sumout\ = SUM(( \Mult0~457\ ) + ( \Mult0~26\ ) + ( \Mult0~354\ ))
-- \Mult0~358\ = CARRY(( \Mult0~457\ ) + ( \Mult0~26\ ) + ( \Mult0~354\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult0~26\,
	datad => \ALT_INV_Mult0~457\,
	cin => \Mult0~354\,
	sumout => \Mult0~357_sumout\,
	cout => \Mult0~358\);

-- Location: LABCELL_X31_Y5_N48
\Mult0~361\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~361_sumout\ = SUM(( \Mult0~27\ ) + ( \Mult0~458\ ) + ( \Mult0~358\ ))
-- \Mult0~362\ = CARRY(( \Mult0~27\ ) + ( \Mult0~458\ ) + ( \Mult0~358\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~27\,
	dataf => \ALT_INV_Mult0~458\,
	cin => \Mult0~358\,
	sumout => \Mult0~361_sumout\,
	cout => \Mult0~362\);

-- Location: LABCELL_X31_Y5_N51
\Mult0~365\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~365_sumout\ = SUM(( \Mult0~459\ ) + ( \Mult0~28\ ) + ( \Mult0~362\ ))
-- \Mult0~366\ = CARRY(( \Mult0~459\ ) + ( \Mult0~28\ ) + ( \Mult0~362\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~28\,
	datad => \ALT_INV_Mult0~459\,
	cin => \Mult0~362\,
	sumout => \Mult0~365_sumout\,
	cout => \Mult0~366\);

-- Location: LABCELL_X31_Y5_N54
\Mult0~369\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~369_sumout\ = SUM(( \Mult0~29\ ) + ( \Mult0~460\ ) + ( \Mult0~366\ ))
-- \Mult0~370\ = CARRY(( \Mult0~29\ ) + ( \Mult0~460\ ) + ( \Mult0~366\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~460\,
	datad => \ALT_INV_Mult0~29\,
	cin => \Mult0~366\,
	sumout => \Mult0~369_sumout\,
	cout => \Mult0~370\);

-- Location: LABCELL_X31_Y5_N57
\Mult0~373\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~373_sumout\ = SUM(( \Mult0~461\ ) + ( \Mult0~30\ ) + ( \Mult0~370\ ))
-- \Mult0~374\ = CARRY(( \Mult0~461\ ) + ( \Mult0~30\ ) + ( \Mult0~370\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~30\,
	datad => \ALT_INV_Mult0~461\,
	cin => \Mult0~370\,
	sumout => \Mult0~373_sumout\,
	cout => \Mult0~374\);

-- Location: LABCELL_X31_Y4_N0
\Mult0~377\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~377_sumout\ = SUM(( \Mult0~462\ ) + ( \Mult0~31\ ) + ( \Mult0~374\ ))
-- \Mult0~378\ = CARRY(( \Mult0~462\ ) + ( \Mult0~31\ ) + ( \Mult0~374\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~31\,
	datad => \ALT_INV_Mult0~462\,
	cin => \Mult0~374\,
	sumout => \Mult0~377_sumout\,
	cout => \Mult0~378\);

-- Location: LABCELL_X31_Y4_N3
\Mult0~381\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~381_sumout\ = SUM(( \Mult0~32\ ) + ( \Mult0~463\ ) + ( \Mult0~378\ ))
-- \Mult0~382\ = CARRY(( \Mult0~32\ ) + ( \Mult0~463\ ) + ( \Mult0~378\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~463\,
	datad => \ALT_INV_Mult0~32\,
	cin => \Mult0~378\,
	sumout => \Mult0~381_sumout\,
	cout => \Mult0~382\);

-- Location: LABCELL_X31_Y4_N6
\Mult0~385\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~385_sumout\ = SUM(( \Mult0~464\ ) + ( \Mult0~33\ ) + ( \Mult0~382\ ))
-- \Mult0~386\ = CARRY(( \Mult0~464\ ) + ( \Mult0~33\ ) + ( \Mult0~382\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~33\,
	datac => \ALT_INV_Mult0~464\,
	cin => \Mult0~382\,
	sumout => \Mult0~385_sumout\,
	cout => \Mult0~386\);

-- Location: DSP_X32_Y8_N0
\Mult1~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 17,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 18,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_full",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult1~8_ACLR_bus\,
	clk => \Mult1~8_CLK_bus\,
	ena => \Mult1~8_ENA_bus\,
	ax => \Mult1~8_AX_bus\,
	ay => \Mult1~8_AY_bus\,
	resulta => \Mult1~8_RESULTA_bus\);

-- Location: LABCELL_X31_Y8_N0
\Add0~126\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~126_cout\ = CARRY(( \Mult1~11\ ) + ( !VCC ) + ( !VCC ))
-- \Add0~127\ = SHARE(!\Mult1~11\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult1~11\,
	cin => GND,
	sharein => GND,
	cout => \Add0~126_cout\,
	shareout => \Add0~127\);

-- Location: LABCELL_X31_Y8_N3
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( !\Mult1~12\ ) + ( \Add0~127\ ) + ( \Add0~126_cout\ ))
-- \Add0~82\ = CARRY(( !\Mult1~12\ ) + ( \Add0~127\ ) + ( \Add0~126_cout\ ))
-- \Add0~83\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult1~12\,
	cin => \Add0~126_cout\,
	sharein => \Add0~127\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\,
	shareout => \Add0~83\);

-- Location: LABCELL_X31_Y8_N6
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( !\Mult1~13\ ) + ( \Add0~83\ ) + ( \Add0~82\ ))
-- \Add0~86\ = CARRY(( !\Mult1~13\ ) + ( \Add0~83\ ) + ( \Add0~82\ ))
-- \Add0~87\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult1~13\,
	cin => \Add0~82\,
	sharein => \Add0~83\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\,
	shareout => \Add0~87\);

-- Location: LABCELL_X31_Y8_N9
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( !\Mult1~14\ ) + ( \Add0~87\ ) + ( \Add0~86\ ))
-- \Add0~90\ = CARRY(( !\Mult1~14\ ) + ( \Add0~87\ ) + ( \Add0~86\ ))
-- \Add0~91\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult1~14\,
	cin => \Add0~86\,
	sharein => \Add0~87\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\,
	shareout => \Add0~91\);

-- Location: LABCELL_X31_Y8_N12
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( \Mult1~15\ ) + ( \Add0~91\ ) + ( \Add0~90\ ))
-- \Add0~94\ = CARRY(( \Mult1~15\ ) + ( \Add0~91\ ) + ( \Add0~90\ ))
-- \Add0~95\ = SHARE(!\Mult1~15\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000111100001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~15\,
	cin => \Add0~90\,
	sharein => \Add0~91\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\,
	shareout => \Add0~95\);

-- Location: LABCELL_X31_Y8_N15
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( !\Mult1~16\ ) + ( \Add0~95\ ) + ( \Add0~94\ ))
-- \Add0~98\ = CARRY(( !\Mult1~16\ ) + ( \Add0~95\ ) + ( \Add0~94\ ))
-- \Add0~99\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001010101010101010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult1~16\,
	cin => \Add0~94\,
	sharein => \Add0~95\,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\,
	shareout => \Add0~99\);

-- Location: LABCELL_X31_Y8_N18
\Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~101_sumout\ = SUM(( \Mult1~17\ ) + ( \Add0~99\ ) + ( \Add0~98\ ))
-- \Add0~102\ = CARRY(( \Mult1~17\ ) + ( \Add0~99\ ) + ( \Add0~98\ ))
-- \Add0~103\ = SHARE(!\Mult1~17\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000111100001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~17\,
	cin => \Add0~98\,
	sharein => \Add0~99\,
	sumout => \Add0~101_sumout\,
	cout => \Add0~102\,
	shareout => \Add0~103\);

-- Location: LABCELL_X31_Y8_N21
\Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~105_sumout\ = SUM(( \Mult1~18\ ) + ( \Add0~103\ ) + ( \Add0~102\ ))
-- \Add0~106\ = CARRY(( \Mult1~18\ ) + ( \Add0~103\ ) + ( \Add0~102\ ))
-- \Add0~107\ = SHARE(!\Mult1~18\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000111100001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~18\,
	cin => \Add0~102\,
	sharein => \Add0~103\,
	sumout => \Add0~105_sumout\,
	cout => \Add0~106\,
	shareout => \Add0~107\);

-- Location: LABCELL_X31_Y8_N24
\Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~109_sumout\ = SUM(( !\Mult1~19\ ) + ( \Add0~107\ ) + ( \Add0~106\ ))
-- \Add0~110\ = CARRY(( !\Mult1~19\ ) + ( \Add0~107\ ) + ( \Add0~106\ ))
-- \Add0~111\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult1~19\,
	cin => \Add0~106\,
	sharein => \Add0~107\,
	sumout => \Add0~109_sumout\,
	cout => \Add0~110\,
	shareout => \Add0~111\);

-- Location: LABCELL_X31_Y8_N27
\Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~113_sumout\ = SUM(( \Mult1~20\ ) + ( \Add0~111\ ) + ( \Add0~110\ ))
-- \Add0~114\ = CARRY(( \Mult1~20\ ) + ( \Add0~111\ ) + ( \Add0~110\ ))
-- \Add0~115\ = SHARE(!\Mult1~20\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000111100001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~20\,
	cin => \Add0~110\,
	sharein => \Add0~111\,
	sumout => \Add0~113_sumout\,
	cout => \Add0~114\,
	shareout => \Add0~115\);

-- Location: LABCELL_X31_Y8_N30
\Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~117_sumout\ = SUM(( \Mult1~21\ ) + ( \Add0~115\ ) + ( \Add0~114\ ))
-- \Add0~118\ = CARRY(( \Mult1~21\ ) + ( \Add0~115\ ) + ( \Add0~114\ ))
-- \Add0~119\ = SHARE(!\Mult1~21\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult1~21\,
	cin => \Add0~114\,
	sharein => \Add0~115\,
	sumout => \Add0~117_sumout\,
	cout => \Add0~118\,
	shareout => \Add0~119\);

-- Location: LABCELL_X31_Y8_N33
\Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~121_sumout\ = SUM(( !\Mult1~22\ ) + ( \Add0~119\ ) + ( \Add0~118\ ))
-- \Add0~122\ = CARRY(( !\Mult1~22\ ) + ( \Add0~119\ ) + ( \Add0~118\ ))
-- \Add0~123\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult1~22\,
	cin => \Add0~118\,
	sharein => \Add0~119\,
	sumout => \Add0~121_sumout\,
	cout => \Add0~122\,
	shareout => \Add0~123\);

-- Location: LABCELL_X31_Y8_N36
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( \Mult1~23\ ) + ( \Add0~123\ ) + ( \Add0~122\ ))
-- \Add0~74\ = CARRY(( \Mult1~23\ ) + ( \Add0~123\ ) + ( \Add0~122\ ))
-- \Add0~75\ = SHARE(!\Mult1~23\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000011001100110011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult1~23\,
	cin => \Add0~122\,
	sharein => \Add0~123\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\,
	shareout => \Add0~75\);

-- Location: LABCELL_X31_Y8_N39
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( !\Mult1~24\ ) + ( \Add0~75\ ) + ( \Add0~74\ ))
-- \Add0~2\ = CARRY(( !\Mult1~24\ ) + ( \Add0~75\ ) + ( \Add0~74\ ))
-- \Add0~3\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult1~24\,
	cin => \Add0~74\,
	sharein => \Add0~75\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\,
	shareout => \Add0~3\);

-- Location: LABCELL_X31_Y8_N42
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( \Mult1~25\ ) + ( \Add0~3\ ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( \Mult1~25\ ) + ( \Add0~3\ ) + ( \Add0~2\ ))
-- \Add0~7\ = SHARE(!\Mult1~25\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult1~25\,
	cin => \Add0~2\,
	sharein => \Add0~3\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\,
	shareout => \Add0~7\);

-- Location: LABCELL_X31_Y4_N9
\Mult0~389\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~389_sumout\ = SUM(( \Mult0~34\ ) + ( \Mult0~465\ ) + ( \Mult0~386\ ))
-- \Mult0~390\ = CARRY(( \Mult0~34\ ) + ( \Mult0~465\ ) + ( \Mult0~386\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~465\,
	datad => \ALT_INV_Mult0~34\,
	cin => \Mult0~386\,
	sumout => \Mult0~389_sumout\,
	cout => \Mult0~390\);

-- Location: LABCELL_X31_Y4_N12
\Mult0~393\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~393_sumout\ = SUM(( \Mult0~466\ ) + ( \Mult0~35\ ) + ( \Mult0~390\ ))
-- \Mult0~394\ = CARRY(( \Mult0~466\ ) + ( \Mult0~35\ ) + ( \Mult0~390\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult0~35\,
	datac => \ALT_INV_Mult0~466\,
	cin => \Mult0~390\,
	sumout => \Mult0~393_sumout\,
	cout => \Mult0~394\);

-- Location: LABCELL_X31_Y4_N15
\Mult0~397\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~397_sumout\ = SUM(( \Mult0~36\ ) + ( \Mult0~467\ ) + ( \Mult0~394\ ))
-- \Mult0~398\ = CARRY(( \Mult0~36\ ) + ( \Mult0~467\ ) + ( \Mult0~394\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~467\,
	datad => \ALT_INV_Mult0~36\,
	cin => \Mult0~394\,
	sumout => \Mult0~397_sumout\,
	cout => \Mult0~398\);

-- Location: LABCELL_X31_Y4_N18
\Mult0~401\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~401_sumout\ = SUM(( \Mult0~37\ ) + ( \Mult0~468\ ) + ( \Mult0~398\ ))
-- \Mult0~402\ = CARRY(( \Mult0~37\ ) + ( \Mult0~468\ ) + ( \Mult0~398\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~468\,
	datad => \ALT_INV_Mult0~37\,
	cin => \Mult0~398\,
	sumout => \Mult0~401_sumout\,
	cout => \Mult0~402\);

-- Location: LABCELL_X31_Y4_N21
\Mult0~405\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~405_sumout\ = SUM(( \Mult0~469\ ) + ( \Mult0~38\ ) + ( \Mult0~402\ ))
-- \Mult0~406\ = CARRY(( \Mult0~469\ ) + ( \Mult0~38\ ) + ( \Mult0~402\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~38\,
	datad => \ALT_INV_Mult0~469\,
	cin => \Mult0~402\,
	sumout => \Mult0~405_sumout\,
	cout => \Mult0~406\);

-- Location: DSP_X20_Y12_N0
\Mult0~793\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 1,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 13,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_full",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	ax => \Mult0~793_AX_bus\,
	ay => \Mult0~793_AY_bus\,
	resulta => \Mult0~793_RESULTA_bus\);

-- Location: LABCELL_X31_Y4_N24
\Mult0~409\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~409_sumout\ = SUM(( \Mult0~470\ ) + ( \Mult0~793_resulta\ ) + ( \Mult0~406\ ))
-- \Mult0~410\ = CARRY(( \Mult0~470\ ) + ( \Mult0~793_resulta\ ) + ( \Mult0~406\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~793_resulta\,
	datad => \ALT_INV_Mult0~470\,
	cin => \Mult0~406\,
	sumout => \Mult0~409_sumout\,
	cout => \Mult0~410\);

-- Location: LABCELL_X31_Y4_N27
\Mult0~413\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~413_sumout\ = SUM(( \Mult0~471\ ) + ( \Mult0~794\ ) + ( \Mult0~410\ ))
-- \Mult0~414\ = CARRY(( \Mult0~471\ ) + ( \Mult0~794\ ) + ( \Mult0~410\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult0~794\,
	datad => \ALT_INV_Mult0~471\,
	cin => \Mult0~410\,
	sumout => \Mult0~413_sumout\,
	cout => \Mult0~414\);

-- Location: LABCELL_X31_Y4_N30
\Mult0~417\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~417_sumout\ = SUM(( \Mult0~472\ ) + ( \Mult0~795\ ) + ( \Mult0~414\ ))
-- \Mult0~418\ = CARRY(( \Mult0~472\ ) + ( \Mult0~795\ ) + ( \Mult0~414\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~795\,
	datad => \ALT_INV_Mult0~472\,
	cin => \Mult0~414\,
	sumout => \Mult0~417_sumout\,
	cout => \Mult0~418\);

-- Location: LABCELL_X31_Y4_N33
\Mult0~421\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~421_sumout\ = SUM(( \Mult0~473\ ) + ( \Mult0~796\ ) + ( \Mult0~418\ ))
-- \Mult0~422\ = CARRY(( \Mult0~473\ ) + ( \Mult0~796\ ) + ( \Mult0~418\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult0~796\,
	datad => \ALT_INV_Mult0~473\,
	cin => \Mult0~418\,
	sumout => \Mult0~421_sumout\,
	cout => \Mult0~422\);

-- Location: LABCELL_X31_Y4_N36
\Mult0~425\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~425_sumout\ = SUM(( \Mult0~474\ ) + ( \Mult0~797\ ) + ( \Mult0~422\ ))
-- \Mult0~426\ = CARRY(( \Mult0~474\ ) + ( \Mult0~797\ ) + ( \Mult0~422\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~474\,
	datac => \ALT_INV_Mult0~797\,
	cin => \Mult0~422\,
	sumout => \Mult0~425_sumout\,
	cout => \Mult0~426\);

-- Location: LABCELL_X31_Y4_N39
\Mult0~429\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~429_sumout\ = SUM(( \Mult0~475\ ) + ( \Mult0~798\ ) + ( \Mult0~426\ ))
-- \Mult0~430\ = CARRY(( \Mult0~475\ ) + ( \Mult0~798\ ) + ( \Mult0~426\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult0~798\,
	datad => \ALT_INV_Mult0~475\,
	cin => \Mult0~426\,
	sumout => \Mult0~429_sumout\,
	cout => \Mult0~430\);

-- Location: LABCELL_X31_Y4_N42
\Mult0~433\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~433_sumout\ = SUM(( \Mult0~799\ ) + ( \Mult0~476\ ) + ( \Mult0~430\ ))
-- \Mult0~434\ = CARRY(( \Mult0~799\ ) + ( \Mult0~476\ ) + ( \Mult0~430\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~476\,
	datad => \ALT_INV_Mult0~799\,
	cin => \Mult0~430\,
	sumout => \Mult0~433_sumout\,
	cout => \Mult0~434\);

-- Location: LABCELL_X31_Y4_N45
\Mult0~437\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~437_sumout\ = SUM(( \Mult0~477\ ) + ( \Mult0~800\ ) + ( \Mult0~434\ ))
-- \Mult0~438\ = CARRY(( \Mult0~477\ ) + ( \Mult0~800\ ) + ( \Mult0~434\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult0~800\,
	datad => \ALT_INV_Mult0~477\,
	cin => \Mult0~434\,
	sumout => \Mult0~437_sumout\,
	cout => \Mult0~438\);

-- Location: LABCELL_X31_Y4_N48
\Mult0~441\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult0~441_sumout\ = SUM(( \Mult0~478\ ) + ( \Mult0~801\ ) + ( \Mult0~438\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~478\,
	dataf => \ALT_INV_Mult0~801\,
	cin => \Mult0~438\,
	sumout => \Mult0~441_sumout\);

-- Location: DSP_X32_Y6_N0
\Mult1~349\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 14,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 17,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	bx_width => 13,
	by_clock => "none",
	by_use_scan_in => "false",
	by_width => 18,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_sumof2",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult1~349_ACLR_bus\,
	clk => \Mult1~349_CLK_bus\,
	ena => \Mult1~349_ENA_bus\,
	ax => \Mult1~349_AX_bus\,
	ay => \Mult1~349_AY_bus\,
	bx => \Mult1~349_BX_bus\,
	by => \Mult1~349_BY_bus\,
	resulta => \Mult1~349_RESULTA_bus\);

-- Location: LABCELL_X31_Y8_N45
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( !\Mult1~349_resulta\ $ (!\Mult1~26\) ) + ( \Add0~7\ ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( !\Mult1~349_resulta\ $ (!\Mult1~26\) ) + ( \Add0~7\ ) + ( \Add0~6\ ))
-- \Add0~11\ = SHARE((!\Mult1~349_resulta\ & !\Mult1~26\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100000000000000000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~349_resulta\,
	datad => \ALT_INV_Mult1~26\,
	cin => \Add0~6\,
	sharein => \Add0~7\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\,
	shareout => \Add0~11\);

-- Location: LABCELL_X31_Y8_N48
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( !\Mult1~350\ $ (!\Mult1~27\) ) + ( \Add0~11\ ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( !\Mult1~350\ $ (!\Mult1~27\) ) + ( \Add0~11\ ) + ( \Add0~10\ ))
-- \Add0~15\ = SHARE((!\Mult1~350\ & !\Mult1~27\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100000000000000000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~350\,
	datad => \ALT_INV_Mult1~27\,
	cin => \Add0~10\,
	sharein => \Add0~11\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\,
	shareout => \Add0~15\);

-- Location: LABCELL_X31_Y8_N51
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( !\Mult1~351\ $ (\Mult1~28\) ) + ( \Add0~15\ ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( !\Mult1~351\ $ (\Mult1~28\) ) + ( \Add0~15\ ) + ( \Add0~14\ ))
-- \Add0~19\ = SHARE((!\Mult1~351\) # (!\Mult1~28\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~351\,
	datad => \ALT_INV_Mult1~28\,
	cin => \Add0~14\,
	sharein => \Add0~15\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\,
	shareout => \Add0~19\);

-- Location: LABCELL_X31_Y8_N54
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( !\Mult1~29\ $ (!\Mult1~352\) ) + ( \Add0~19\ ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( !\Mult1~29\ $ (!\Mult1~352\) ) + ( \Add0~19\ ) + ( \Add0~18\ ))
-- \Add0~23\ = SHARE((!\Mult1~29\ & !\Mult1~352\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110000001100000000000000000000000011110000111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult1~29\,
	datac => \ALT_INV_Mult1~352\,
	cin => \Add0~18\,
	sharein => \Add0~19\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\,
	shareout => \Add0~23\);

-- Location: LABCELL_X31_Y8_N57
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( !\Mult1~353\ $ (!\Mult1~30\) ) + ( \Add0~23\ ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( !\Mult1~353\ $ (!\Mult1~30\) ) + ( \Add0~23\ ) + ( \Add0~22\ ))
-- \Add0~27\ = SHARE((!\Mult1~353\ & !\Mult1~30\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100000000000000000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~353\,
	datad => \ALT_INV_Mult1~30\,
	cin => \Add0~22\,
	sharein => \Add0~23\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\,
	shareout => \Add0~27\);

-- Location: LABCELL_X31_Y7_N0
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( !\Mult1~31\ $ (\Mult1~354\) ) + ( \Add0~27\ ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( !\Mult1~31\ $ (\Mult1~354\) ) + ( \Add0~27\ ) + ( \Add0~26\ ))
-- \Add0~31\ = SHARE((!\Mult1~31\) # (!\Mult1~354\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~31\,
	datad => \ALT_INV_Mult1~354\,
	cin => \Add0~26\,
	sharein => \Add0~27\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\,
	shareout => \Add0~31\);

-- Location: LABCELL_X31_Y7_N3
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( !\Mult1~355\ $ (\Mult1~32\) ) + ( \Add0~31\ ) + ( \Add0~30\ ))
-- \Add0~34\ = CARRY(( !\Mult1~355\ $ (\Mult1~32\) ) + ( \Add0~31\ ) + ( \Add0~30\ ))
-- \Add0~35\ = SHARE((!\Mult1~355\) # (!\Mult1~32\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111001111110000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult1~355\,
	datac => \ALT_INV_Mult1~32\,
	cin => \Add0~30\,
	sharein => \Add0~31\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\,
	shareout => \Add0~35\);

-- Location: LABCELL_X31_Y7_N6
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( !\Mult1~356\ $ (!\Mult1~33\) ) + ( \Add0~35\ ) + ( \Add0~34\ ))
-- \Add0~38\ = CARRY(( !\Mult1~356\ $ (!\Mult1~33\) ) + ( \Add0~35\ ) + ( \Add0~34\ ))
-- \Add0~39\ = SHARE((!\Mult1~356\ & !\Mult1~33\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100000000000000000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~356\,
	datad => \ALT_INV_Mult1~33\,
	cin => \Add0~34\,
	sharein => \Add0~35\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\,
	shareout => \Add0~39\);

-- Location: LABCELL_X31_Y7_N9
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( !\Mult1~34\ $ (\Mult1~357\) ) + ( \Add0~39\ ) + ( \Add0~38\ ))
-- \Add0~42\ = CARRY(( !\Mult1~34\ $ (\Mult1~357\) ) + ( \Add0~39\ ) + ( \Add0~38\ ))
-- \Add0~43\ = SHARE((!\Mult1~34\) # (!\Mult1~357\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011101110111000000000000000001001100110011001",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult1~34\,
	datab => \ALT_INV_Mult1~357\,
	cin => \Add0~38\,
	sharein => \Add0~39\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\,
	shareout => \Add0~43\);

-- Location: LABCELL_X31_Y7_N12
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( !\Mult1~35\ $ (\Mult1~358\) ) + ( \Add0~43\ ) + ( \Add0~42\ ))
-- \Add0~46\ = CARRY(( !\Mult1~35\ $ (\Mult1~358\) ) + ( \Add0~43\ ) + ( \Add0~42\ ))
-- \Add0~47\ = SHARE((!\Mult1~35\) # (!\Mult1~358\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111001111110000000000000000001100001111000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult1~35\,
	datac => \ALT_INV_Mult1~358\,
	cin => \Add0~42\,
	sharein => \Add0~43\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\,
	shareout => \Add0~47\);

-- Location: LABCELL_X31_Y7_N15
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( !\Mult1~359\ $ (\Mult1~36\) ) + ( \Add0~47\ ) + ( \Add0~46\ ))
-- \Add0~50\ = CARRY(( !\Mult1~359\ $ (\Mult1~36\) ) + ( \Add0~47\ ) + ( \Add0~46\ ))
-- \Add0~51\ = SHARE((!\Mult1~359\) # (!\Mult1~36\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111010101000000000000000001010101001010101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult1~359\,
	datad => \ALT_INV_Mult1~36\,
	cin => \Add0~46\,
	sharein => \Add0~47\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\,
	shareout => \Add0~51\);

-- Location: LABCELL_X31_Y7_N18
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( !\Mult1~37\ $ (!\Mult1~360\) ) + ( \Add0~51\ ) + ( \Add0~50\ ))
-- \Add0~54\ = CARRY(( !\Mult1~37\ $ (!\Mult1~360\) ) + ( \Add0~51\ ) + ( \Add0~50\ ))
-- \Add0~55\ = SHARE((!\Mult1~37\ & !\Mult1~360\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011000000000000000000000000000011001111001100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult1~37\,
	datad => \ALT_INV_Mult1~360\,
	cin => \Add0~50\,
	sharein => \Add0~51\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\,
	shareout => \Add0~55\);

-- Location: LABCELL_X31_Y7_N21
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( !\Mult1~361\ $ (!\Mult1~38\) ) + ( \Add0~55\ ) + ( \Add0~54\ ))
-- \Add0~58\ = CARRY(( !\Mult1~361\ $ (!\Mult1~38\) ) + ( \Add0~55\ ) + ( \Add0~54\ ))
-- \Add0~59\ = SHARE((!\Mult1~361\ & !\Mult1~38\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010100000000000000000000000000101010110101010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult1~361\,
	datad => \ALT_INV_Mult1~38\,
	cin => \Add0~54\,
	sharein => \Add0~55\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\,
	shareout => \Add0~59\);

-- Location: LABCELL_X31_Y7_N24
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( !\Mult1~39\ $ (!\Mult1~362\) ) + ( \Add0~59\ ) + ( \Add0~58\ ))
-- \Add0~62\ = CARRY(( !\Mult1~39\ $ (!\Mult1~362\) ) + ( \Add0~59\ ) + ( \Add0~58\ ))
-- \Add0~63\ = SHARE((!\Mult1~39\ & !\Mult1~362\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011000000000000000000000000000011001111001100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult1~39\,
	datad => \ALT_INV_Mult1~362\,
	cin => \Add0~58\,
	sharein => \Add0~59\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\,
	shareout => \Add0~63\);

-- Location: LABCELL_X31_Y7_N27
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( !\Mult1~40\ $ (\Mult1~363\) ) + ( \Add0~63\ ) + ( \Add0~62\ ))
-- \Add0~66\ = CARRY(( !\Mult1~40\ $ (\Mult1~363\) ) + ( \Add0~63\ ) + ( \Add0~62\ ))
-- \Add0~67\ = SHARE((!\Mult1~40\) # (!\Mult1~363\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111000000000000000000001111000000001111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~40\,
	datad => \ALT_INV_Mult1~363\,
	cin => \Add0~62\,
	sharein => \Add0~63\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\,
	shareout => \Add0~67\);

-- Location: LABCELL_X31_Y7_N30
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( !\Mult1~41\ $ (!\Mult1~364\) ) + ( \Add0~67\ ) + ( \Add0~66\ ))
-- \Add0~70\ = CARRY(( !\Mult1~41\ $ (!\Mult1~364\) ) + ( \Add0~67\ ) + ( \Add0~66\ ))
-- \Add0~71\ = SHARE((!\Mult1~41\ & !\Mult1~364\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100000000000000000000000000000000111111110000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult1~41\,
	datad => \ALT_INV_Mult1~364\,
	cin => \Add0~66\,
	sharein => \Add0~67\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\,
	shareout => \Add0~71\);

-- Location: DSP_X32_Y10_N0
\Mult2~mult_llmac\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 17,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 18,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_full",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult2~mult_llmac_ACLR_bus\,
	clk => \Mult2~mult_llmac_CLK_bus\,
	ena => \Mult2~mult_llmac_ENA_bus\,
	ax => \Mult2~mult_llmac_AX_bus\,
	ay => \Mult2~mult_llmac_AY_bus\,
	resulta => \Mult2~mult_llmac_RESULTA_bus\);

-- Location: LABCELL_X31_Y7_N33
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( !\Mult1~365\ $ (\Mult1~42\) ) + ( \Add0~71\ ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010101001010101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult1~365\,
	datad => \ALT_INV_Mult1~42\,
	cin => \Add0~70\,
	sharein => \Add0~71\,
	sumout => \Add0~77_sumout\);

-- Location: DSP_X20_Y8_N0
\Mult2~383\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 14,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 17,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	bx_width => 13,
	by_clock => "none",
	by_use_scan_in => "false",
	by_width => 18,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_sumof2",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult2~383_ACLR_bus\,
	clk => \Mult2~383_CLK_bus\,
	ena => \Mult2~383_ENA_bus\,
	ax => \Mult2~383_AX_bus\,
	ay => \Mult2~383_AY_bus\,
	bx => \Mult2~383_BX_bus\,
	by => \Mult2~383_BY_bus\,
	resulta => \Mult2~383_RESULTA_bus\);

-- Location: MLABCELL_X21_Y8_N0
\Mult2~324\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~324_sumout\ = SUM(( \Mult2~8\ ) + ( \Mult2~383_resulta\ ) + ( !VCC ))
-- \Mult2~325\ = CARRY(( \Mult2~8\ ) + ( \Mult2~383_resulta\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~383_resulta\,
	datad => \ALT_INV_Mult2~8\,
	cin => GND,
	sumout => \Mult2~324_sumout\,
	cout => \Mult2~325\);

-- Location: MLABCELL_X21_Y8_N3
\Mult2~328\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~328_sumout\ = SUM(( \Mult2~384\ ) + ( \Mult2~9\ ) + ( \Mult2~325\ ))
-- \Mult2~329\ = CARRY(( \Mult2~384\ ) + ( \Mult2~9\ ) + ( \Mult2~325\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~9\,
	datad => \ALT_INV_Mult2~384\,
	cin => \Mult2~325\,
	sumout => \Mult2~328_sumout\,
	cout => \Mult2~329\);

-- Location: MLABCELL_X21_Y8_N6
\Mult2~332\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~332_sumout\ = SUM(( \Mult2~10\ ) + ( \Mult2~385\ ) + ( \Mult2~329\ ))
-- \Mult2~333\ = CARRY(( \Mult2~10\ ) + ( \Mult2~385\ ) + ( \Mult2~329\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~385\,
	datad => \ALT_INV_Mult2~10\,
	cin => \Mult2~329\,
	sumout => \Mult2~332_sumout\,
	cout => \Mult2~333\);

-- Location: MLABCELL_X21_Y8_N9
\Mult2~336\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~336_sumout\ = SUM(( \Mult2~11\ ) + ( \Mult2~386\ ) + ( \Mult2~333\ ))
-- \Mult2~337\ = CARRY(( \Mult2~11\ ) + ( \Mult2~386\ ) + ( \Mult2~333\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~386\,
	datad => \ALT_INV_Mult2~11\,
	cin => \Mult2~333\,
	sumout => \Mult2~336_sumout\,
	cout => \Mult2~337\);

-- Location: MLABCELL_X21_Y8_N12
\Mult2~340\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~340_sumout\ = SUM(( \Mult2~12\ ) + ( \Mult2~387\ ) + ( \Mult2~337\ ))
-- \Mult2~341\ = CARRY(( \Mult2~12\ ) + ( \Mult2~387\ ) + ( \Mult2~337\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~387\,
	datad => \ALT_INV_Mult2~12\,
	cin => \Mult2~337\,
	sumout => \Mult2~340_sumout\,
	cout => \Mult2~341\);

-- Location: MLABCELL_X21_Y8_N15
\Mult2~344\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~344_sumout\ = SUM(( \Mult2~388\ ) + ( \Mult2~13\ ) + ( \Mult2~341\ ))
-- \Mult2~345\ = CARRY(( \Mult2~388\ ) + ( \Mult2~13\ ) + ( \Mult2~341\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~13\,
	datad => \ALT_INV_Mult2~388\,
	cin => \Mult2~341\,
	sumout => \Mult2~344_sumout\,
	cout => \Mult2~345\);

-- Location: MLABCELL_X21_Y8_N18
\Mult2~348\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~348_sumout\ = SUM(( \Mult2~389\ ) + ( \Mult2~14\ ) + ( \Mult2~345\ ))
-- \Mult2~349\ = CARRY(( \Mult2~389\ ) + ( \Mult2~14\ ) + ( \Mult2~345\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~14\,
	datad => \ALT_INV_Mult2~389\,
	cin => \Mult2~345\,
	sumout => \Mult2~348_sumout\,
	cout => \Mult2~349\);

-- Location: MLABCELL_X21_Y8_N21
\Mult2~352\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~352_sumout\ = SUM(( \Mult2~390\ ) + ( \Mult2~15\ ) + ( \Mult2~349\ ))
-- \Mult2~353\ = CARRY(( \Mult2~390\ ) + ( \Mult2~15\ ) + ( \Mult2~349\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~15\,
	datad => \ALT_INV_Mult2~390\,
	cin => \Mult2~349\,
	sumout => \Mult2~352_sumout\,
	cout => \Mult2~353\);

-- Location: MLABCELL_X21_Y8_N24
\Mult2~356\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~356_sumout\ = SUM(( \Mult2~16\ ) + ( \Mult2~391\ ) + ( \Mult2~353\ ))
-- \Mult2~357\ = CARRY(( \Mult2~16\ ) + ( \Mult2~391\ ) + ( \Mult2~353\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~391\,
	datad => \ALT_INV_Mult2~16\,
	cin => \Mult2~353\,
	sumout => \Mult2~356_sumout\,
	cout => \Mult2~357\);

-- Location: MLABCELL_X21_Y8_N27
\Mult2~360\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~360_sumout\ = SUM(( \Mult2~17\ ) + ( \Mult2~392\ ) + ( \Mult2~357\ ))
-- \Mult2~361\ = CARRY(( \Mult2~17\ ) + ( \Mult2~392\ ) + ( \Mult2~357\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~392\,
	datad => \ALT_INV_Mult2~17\,
	cin => \Mult2~357\,
	sumout => \Mult2~360_sumout\,
	cout => \Mult2~361\);

-- Location: MLABCELL_X21_Y8_N30
\Mult2~364\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~364_sumout\ = SUM(( \Mult2~393\ ) + ( \Mult2~18\ ) + ( \Mult2~361\ ))
-- \Mult2~365\ = CARRY(( \Mult2~393\ ) + ( \Mult2~18\ ) + ( \Mult2~361\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~18\,
	datad => \ALT_INV_Mult2~393\,
	cin => \Mult2~361\,
	sumout => \Mult2~364_sumout\,
	cout => \Mult2~365\);

-- Location: MLABCELL_X21_Y8_N33
\Mult2~368\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~368_sumout\ = SUM(( \Mult2~394\ ) + ( \Mult2~19\ ) + ( \Mult2~365\ ))
-- \Mult2~369\ = CARRY(( \Mult2~394\ ) + ( \Mult2~19\ ) + ( \Mult2~365\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~19\,
	datad => \ALT_INV_Mult2~394\,
	cin => \Mult2~365\,
	sumout => \Mult2~368_sumout\,
	cout => \Mult2~369\);

-- Location: MLABCELL_X21_Y8_N36
\Mult2~372\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~372_sumout\ = SUM(( \Mult2~395\ ) + ( \Mult2~20\ ) + ( \Mult2~369\ ))
-- \Mult2~373\ = CARRY(( \Mult2~395\ ) + ( \Mult2~20\ ) + ( \Mult2~369\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~20\,
	datad => \ALT_INV_Mult2~395\,
	cin => \Mult2~369\,
	sumout => \Mult2~372_sumout\,
	cout => \Mult2~373\);

-- Location: DSP_X20_Y6_N0
\Mult3~mult_llmac\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 17,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 18,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_full",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult3~mult_llmac_ACLR_bus\,
	clk => \Mult3~mult_llmac_CLK_bus\,
	ena => \Mult3~mult_llmac_ENA_bus\,
	ax => \Mult3~mult_llmac_AX_bus\,
	ay => \Mult3~mult_llmac_AY_bus\,
	resulta => \Mult3~mult_llmac_RESULTA_bus\);

-- Location: MLABCELL_X21_Y6_N0
\Add1~118\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~118_cout\ = CARRY(( !result4(1) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_result4(1),
	cin => GND,
	cout => \Add1~118_cout\);

-- Location: MLABCELL_X21_Y6_N3
\Add1~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~81_sumout\ = SUM(( !result4(2) ) + ( VCC ) + ( \Add1~118_cout\ ))
-- \Add1~82\ = CARRY(( !result4(2) ) + ( VCC ) + ( \Add1~118_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_result4(2),
	cin => \Add1~118_cout\,
	sumout => \Add1~81_sumout\,
	cout => \Add1~82\);

-- Location: MLABCELL_X21_Y6_N6
\Add1~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~85_sumout\ = SUM(( !result4(3) ) + ( GND ) + ( \Add1~82\ ))
-- \Add1~86\ = CARRY(( !result4(3) ) + ( GND ) + ( \Add1~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_result4(3),
	cin => \Add1~82\,
	sumout => \Add1~85_sumout\,
	cout => \Add1~86\);

-- Location: MLABCELL_X21_Y6_N9
\Add1~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~89_sumout\ = SUM(( !result4(4) ) + ( GND ) + ( \Add1~86\ ))
-- \Add1~90\ = CARRY(( !result4(4) ) + ( GND ) + ( \Add1~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_result4(4),
	cin => \Add1~86\,
	sumout => \Add1~89_sumout\,
	cout => \Add1~90\);

-- Location: MLABCELL_X21_Y6_N12
\Add1~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~93_sumout\ = SUM(( !result4(5) ) + ( VCC ) + ( \Add1~90\ ))
-- \Add1~94\ = CARRY(( !result4(5) ) + ( VCC ) + ( \Add1~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_result4(5),
	cin => \Add1~90\,
	sumout => \Add1~93_sumout\,
	cout => \Add1~94\);

-- Location: MLABCELL_X21_Y6_N15
\Add1~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~97_sumout\ = SUM(( !result4(6) ) + ( GND ) + ( \Add1~94\ ))
-- \Add1~98\ = CARRY(( !result4(6) ) + ( GND ) + ( \Add1~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_result4(6),
	cin => \Add1~94\,
	sumout => \Add1~97_sumout\,
	cout => \Add1~98\);

-- Location: MLABCELL_X21_Y6_N18
\Add1~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~101_sumout\ = SUM(( !result4(7) ) + ( GND ) + ( \Add1~98\ ))
-- \Add1~102\ = CARRY(( !result4(7) ) + ( GND ) + ( \Add1~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_result4(7),
	cin => \Add1~98\,
	sumout => \Add1~101_sumout\,
	cout => \Add1~102\);

-- Location: MLABCELL_X21_Y6_N21
\Add1~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~105_sumout\ = SUM(( !result4(8) ) + ( VCC ) + ( \Add1~102\ ))
-- \Add1~106\ = CARRY(( !result4(8) ) + ( VCC ) + ( \Add1~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_result4(8),
	cin => \Add1~102\,
	sumout => \Add1~105_sumout\,
	cout => \Add1~106\);

-- Location: MLABCELL_X21_Y6_N24
\Add1~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~109_sumout\ = SUM(( !result4(9) ) + ( GND ) + ( \Add1~106\ ))
-- \Add1~110\ = CARRY(( !result4(9) ) + ( GND ) + ( \Add1~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_result4(9),
	cin => \Add1~106\,
	sumout => \Add1~109_sumout\,
	cout => \Add1~110\);

-- Location: MLABCELL_X21_Y6_N27
\Add1~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~113_sumout\ = SUM(( !result4(10) ) + ( VCC ) + ( \Add1~110\ ))
-- \Add1~114\ = CARRY(( !result4(10) ) + ( VCC ) + ( \Add1~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_result4(10),
	cin => \Add1~110\,
	sumout => \Add1~113_sumout\,
	cout => \Add1~114\);

-- Location: MLABCELL_X21_Y6_N30
\Add1~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~73_sumout\ = SUM(( !result4(11) ) + ( GND ) + ( \Add1~114\ ))
-- \Add1~74\ = CARRY(( !result4(11) ) + ( GND ) + ( \Add1~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_result4(11),
	cin => \Add1~114\,
	sumout => \Add1~73_sumout\,
	cout => \Add1~74\);

-- Location: MLABCELL_X21_Y6_N33
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( !result4(12) ) + ( GND ) + ( \Add1~74\ ))
-- \Add1~2\ = CARRY(( !result4(12) ) + ( GND ) + ( \Add1~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_result4(12),
	cin => \Add1~74\,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: MLABCELL_X21_Y6_N36
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( !result4(13) ) + ( GND ) + ( \Add1~2\ ))
-- \Add1~6\ = CARRY(( !result4(13) ) + ( GND ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_result4(13),
	cin => \Add1~2\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: MLABCELL_X21_Y6_N39
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( !result4(14) ) + ( VCC ) + ( \Add1~6\ ))
-- \Add1~10\ = CARRY(( !result4(14) ) + ( VCC ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_result4(14),
	cin => \Add1~6\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: MLABCELL_X21_Y6_N42
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( !result4(15) ) + ( GND ) + ( \Add1~10\ ))
-- \Add1~14\ = CARRY(( !result4(15) ) + ( GND ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_result4(15),
	cin => \Add1~10\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: MLABCELL_X21_Y6_N45
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( !result4(16) ) + ( GND ) + ( \Add1~14\ ))
-- \Add1~18\ = CARRY(( !result4(16) ) + ( GND ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_result4(16),
	cin => \Add1~14\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: MLABCELL_X21_Y6_N48
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( !result4(17) ) + ( VCC ) + ( \Add1~18\ ))
-- \Add1~22\ = CARRY(( !result4(17) ) + ( VCC ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_result4(17),
	cin => \Add1~18\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: MLABCELL_X21_Y8_N39
\Mult2~717\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult2~717_sumout\ = SUM(( \Mult2~21\ ) + ( \Mult2~396\ ) + ( \Mult2~373\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult2~396\,
	datad => \ALT_INV_Mult2~21\,
	cin => \Mult2~373\,
	sumout => \Mult2~717_sumout\);

-- Location: DSP_X20_Y10_N0
\Mult3~383\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 14,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 17,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	bx_width => 13,
	by_clock => "none",
	by_use_scan_in => "false",
	by_width => 18,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_sumof2",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult3~383_ACLR_bus\,
	clk => \Mult3~383_CLK_bus\,
	ena => \Mult3~383_ENA_bus\,
	ax => \Mult3~383_AX_bus\,
	ay => \Mult3~383_AY_bus\,
	bx => \Mult3~383_BX_bus\,
	by => \Mult3~383_BY_bus\,
	resulta => \Mult3~383_RESULTA_bus\);

-- Location: MLABCELL_X21_Y7_N0
\Mult3~324\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~324_sumout\ = SUM(( \Mult3~383_resulta\ ) + ( \Mult3~8\ ) + ( !VCC ))
-- \Mult3~325\ = CARRY(( \Mult3~383_resulta\ ) + ( \Mult3~8\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~8\,
	datad => \ALT_INV_Mult3~383_resulta\,
	cin => GND,
	sumout => \Mult3~324_sumout\,
	cout => \Mult3~325\);

-- Location: MLABCELL_X21_Y6_N51
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( !\Mult3~324_sumout\ ) + ( VCC ) + ( \Add1~22\ ))
-- \Add1~26\ = CARRY(( !\Mult3~324_sumout\ ) + ( VCC ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult3~324_sumout\,
	cin => \Add1~22\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

-- Location: MLABCELL_X21_Y7_N3
\Mult3~328\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~328_sumout\ = SUM(( \Mult3~384\ ) + ( \Mult3~9\ ) + ( \Mult3~325\ ))
-- \Mult3~329\ = CARRY(( \Mult3~384\ ) + ( \Mult3~9\ ) + ( \Mult3~325\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~9\,
	datad => \ALT_INV_Mult3~384\,
	cin => \Mult3~325\,
	sumout => \Mult3~328_sumout\,
	cout => \Mult3~329\);

-- Location: MLABCELL_X21_Y6_N54
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( !\Mult3~328_sumout\ ) + ( GND ) + ( \Add1~26\ ))
-- \Add1~30\ = CARRY(( !\Mult3~328_sumout\ ) + ( GND ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~328_sumout\,
	cin => \Add1~26\,
	sumout => \Add1~29_sumout\,
	cout => \Add1~30\);

-- Location: MLABCELL_X21_Y7_N6
\Mult3~332\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~332_sumout\ = SUM(( \Mult3~385\ ) + ( \Mult3~10\ ) + ( \Mult3~329\ ))
-- \Mult3~333\ = CARRY(( \Mult3~385\ ) + ( \Mult3~10\ ) + ( \Mult3~329\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~10\,
	datad => \ALT_INV_Mult3~385\,
	cin => \Mult3~329\,
	sumout => \Mult3~332_sumout\,
	cout => \Mult3~333\);

-- Location: MLABCELL_X21_Y6_N57
\Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~33_sumout\ = SUM(( !\Mult3~332_sumout\ ) + ( VCC ) + ( \Add1~30\ ))
-- \Add1~34\ = CARRY(( !\Mult3~332_sumout\ ) + ( VCC ) + ( \Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult3~332_sumout\,
	cin => \Add1~30\,
	sumout => \Add1~33_sumout\,
	cout => \Add1~34\);

-- Location: MLABCELL_X21_Y7_N9
\Mult3~336\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~336_sumout\ = SUM(( \Mult3~11\ ) + ( \Mult3~386\ ) + ( \Mult3~333\ ))
-- \Mult3~337\ = CARRY(( \Mult3~11\ ) + ( \Mult3~386\ ) + ( \Mult3~333\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~386\,
	datad => \ALT_INV_Mult3~11\,
	cin => \Mult3~333\,
	sumout => \Mult3~336_sumout\,
	cout => \Mult3~337\);

-- Location: MLABCELL_X21_Y5_N0
\Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~37_sumout\ = SUM(( !\Mult3~336_sumout\ ) + ( VCC ) + ( \Add1~34\ ))
-- \Add1~38\ = CARRY(( !\Mult3~336_sumout\ ) + ( VCC ) + ( \Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult3~336_sumout\,
	cin => \Add1~34\,
	sumout => \Add1~37_sumout\,
	cout => \Add1~38\);

-- Location: MLABCELL_X21_Y7_N12
\Mult3~340\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~340_sumout\ = SUM(( \Mult3~387\ ) + ( \Mult3~12\ ) + ( \Mult3~337\ ))
-- \Mult3~341\ = CARRY(( \Mult3~387\ ) + ( \Mult3~12\ ) + ( \Mult3~337\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult3~12\,
	datac => \ALT_INV_Mult3~387\,
	cin => \Mult3~337\,
	sumout => \Mult3~340_sumout\,
	cout => \Mult3~341\);

-- Location: MLABCELL_X21_Y5_N3
\Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~41_sumout\ = SUM(( !\Mult3~340_sumout\ ) + ( VCC ) + ( \Add1~38\ ))
-- \Add1~42\ = CARRY(( !\Mult3~340_sumout\ ) + ( VCC ) + ( \Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult3~340_sumout\,
	cin => \Add1~38\,
	sumout => \Add1~41_sumout\,
	cout => \Add1~42\);

-- Location: MLABCELL_X21_Y7_N15
\Mult3~344\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~344_sumout\ = SUM(( \Mult3~13\ ) + ( \Mult3~388\ ) + ( \Mult3~341\ ))
-- \Mult3~345\ = CARRY(( \Mult3~13\ ) + ( \Mult3~388\ ) + ( \Mult3~341\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~388\,
	datad => \ALT_INV_Mult3~13\,
	cin => \Mult3~341\,
	sumout => \Mult3~344_sumout\,
	cout => \Mult3~345\);

-- Location: MLABCELL_X21_Y5_N6
\Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~45_sumout\ = SUM(( !\Mult3~344_sumout\ ) + ( GND ) + ( \Add1~42\ ))
-- \Add1~46\ = CARRY(( !\Mult3~344_sumout\ ) + ( GND ) + ( \Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult3~344_sumout\,
	cin => \Add1~42\,
	sumout => \Add1~45_sumout\,
	cout => \Add1~46\);

-- Location: MLABCELL_X21_Y7_N18
\Mult3~348\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~348_sumout\ = SUM(( \Mult3~389\ ) + ( \Mult3~14\ ) + ( \Mult3~345\ ))
-- \Mult3~349\ = CARRY(( \Mult3~389\ ) + ( \Mult3~14\ ) + ( \Mult3~345\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~14\,
	datad => \ALT_INV_Mult3~389\,
	cin => \Mult3~345\,
	sumout => \Mult3~348_sumout\,
	cout => \Mult3~349\);

-- Location: MLABCELL_X21_Y5_N9
\Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~49_sumout\ = SUM(( !\Mult3~348_sumout\ ) + ( GND ) + ( \Add1~46\ ))
-- \Add1~50\ = CARRY(( !\Mult3~348_sumout\ ) + ( GND ) + ( \Add1~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~348_sumout\,
	cin => \Add1~46\,
	sumout => \Add1~49_sumout\,
	cout => \Add1~50\);

-- Location: MLABCELL_X21_Y7_N21
\Mult3~352\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~352_sumout\ = SUM(( \Mult3~15\ ) + ( \Mult3~390\ ) + ( \Mult3~349\ ))
-- \Mult3~353\ = CARRY(( \Mult3~15\ ) + ( \Mult3~390\ ) + ( \Mult3~349\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~390\,
	datad => \ALT_INV_Mult3~15\,
	cin => \Mult3~349\,
	sumout => \Mult3~352_sumout\,
	cout => \Mult3~353\);

-- Location: MLABCELL_X21_Y5_N12
\Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~53_sumout\ = SUM(( !\Mult3~352_sumout\ ) + ( GND ) + ( \Add1~50\ ))
-- \Add1~54\ = CARRY(( !\Mult3~352_sumout\ ) + ( GND ) + ( \Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~352_sumout\,
	cin => \Add1~50\,
	sumout => \Add1~53_sumout\,
	cout => \Add1~54\);

-- Location: MLABCELL_X21_Y7_N24
\Mult3~356\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~356_sumout\ = SUM(( \Mult3~391\ ) + ( \Mult3~16\ ) + ( \Mult3~353\ ))
-- \Mult3~357\ = CARRY(( \Mult3~391\ ) + ( \Mult3~16\ ) + ( \Mult3~353\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~16\,
	datad => \ALT_INV_Mult3~391\,
	cin => \Mult3~353\,
	sumout => \Mult3~356_sumout\,
	cout => \Mult3~357\);

-- Location: MLABCELL_X21_Y5_N15
\Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~57_sumout\ = SUM(( !\Mult3~356_sumout\ ) + ( VCC ) + ( \Add1~54\ ))
-- \Add1~58\ = CARRY(( !\Mult3~356_sumout\ ) + ( VCC ) + ( \Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~356_sumout\,
	cin => \Add1~54\,
	sumout => \Add1~57_sumout\,
	cout => \Add1~58\);

-- Location: MLABCELL_X21_Y7_N27
\Mult3~360\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~360_sumout\ = SUM(( \Mult3~392\ ) + ( \Mult3~17\ ) + ( \Mult3~357\ ))
-- \Mult3~361\ = CARRY(( \Mult3~392\ ) + ( \Mult3~17\ ) + ( \Mult3~357\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~17\,
	datad => \ALT_INV_Mult3~392\,
	cin => \Mult3~357\,
	sumout => \Mult3~360_sumout\,
	cout => \Mult3~361\);

-- Location: MLABCELL_X21_Y5_N18
\Add1~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~61_sumout\ = SUM(( !\Mult3~360_sumout\ ) + ( GND ) + ( \Add1~58\ ))
-- \Add1~62\ = CARRY(( !\Mult3~360_sumout\ ) + ( GND ) + ( \Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult3~360_sumout\,
	cin => \Add1~58\,
	sumout => \Add1~61_sumout\,
	cout => \Add1~62\);

-- Location: MLABCELL_X21_Y7_N30
\Mult3~364\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~364_sumout\ = SUM(( \Mult3~18\ ) + ( \Mult3~393\ ) + ( \Mult3~361\ ))
-- \Mult3~365\ = CARRY(( \Mult3~18\ ) + ( \Mult3~393\ ) + ( \Mult3~361\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~393\,
	datad => \ALT_INV_Mult3~18\,
	cin => \Mult3~361\,
	sumout => \Mult3~364_sumout\,
	cout => \Mult3~365\);

-- Location: MLABCELL_X21_Y5_N21
\Add1~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~65_sumout\ = SUM(( !\Mult3~364_sumout\ ) + ( GND ) + ( \Add1~62\ ))
-- \Add1~66\ = CARRY(( !\Mult3~364_sumout\ ) + ( GND ) + ( \Add1~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult3~364_sumout\,
	cin => \Add1~62\,
	sumout => \Add1~65_sumout\,
	cout => \Add1~66\);

-- Location: MLABCELL_X21_Y7_N33
\Mult3~368\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~368_sumout\ = SUM(( \Mult3~394\ ) + ( \Mult3~19\ ) + ( \Mult3~365\ ))
-- \Mult3~369\ = CARRY(( \Mult3~394\ ) + ( \Mult3~19\ ) + ( \Mult3~365\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~19\,
	datad => \ALT_INV_Mult3~394\,
	cin => \Mult3~365\,
	sumout => \Mult3~368_sumout\,
	cout => \Mult3~369\);

-- Location: MLABCELL_X21_Y5_N24
\Add1~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~69_sumout\ = SUM(( !\Mult3~368_sumout\ ) + ( VCC ) + ( \Add1~66\ ))
-- \Add1~70\ = CARRY(( !\Mult3~368_sumout\ ) + ( VCC ) + ( \Add1~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult3~368_sumout\,
	cin => \Add1~66\,
	sumout => \Add1~69_sumout\,
	cout => \Add1~70\);

-- Location: DSP_X20_Y2_N0
\Mult4~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "0",
	ax_width => 17,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 18,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_full",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult4~8_ACLR_bus\,
	clk => \Mult4~8_CLK_bus\,
	ena => \Mult4~8_ENA_bus\,
	ax => \Mult4~8_AX_bus\,
	ay => \Mult4~8_AY_bus\,
	resulta => \Mult4~8_RESULTA_bus\);

-- Location: MLABCELL_X21_Y2_N39
\sine_out[0]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[0]~reg0feeder_combout\ = ( result6(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(7),
	combout => \sine_out[0]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N41
\sine_out[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[0]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[0]~reg0_q\);

-- Location: MLABCELL_X21_Y2_N42
\sine_out[1]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[1]~reg0feeder_combout\ = ( result6(8) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(8),
	combout => \sine_out[1]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N43
\sine_out[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[1]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[1]~reg0_q\);

-- Location: FF_X21_Y2_N49
\sine_out[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => result6(9),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[2]~reg0_q\);

-- Location: MLABCELL_X21_Y2_N57
\sine_out[3]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[3]~reg0feeder_combout\ = ( result6(10) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(10),
	combout => \sine_out[3]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N58
\sine_out[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[3]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[3]~reg0_q\);

-- Location: MLABCELL_X21_Y2_N3
\sine_out[4]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[4]~reg0feeder_combout\ = ( result6(11) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(11),
	combout => \sine_out[4]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N4
\sine_out[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[4]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[4]~reg0_q\);

-- Location: MLABCELL_X21_Y2_N51
\sine_out[5]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[5]~reg0feeder_combout\ = ( result6(12) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(12),
	combout => \sine_out[5]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N52
\sine_out[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[5]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[5]~reg0_q\);

-- Location: MLABCELL_X21_Y2_N30
\sine_out[6]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[6]~reg0feeder_combout\ = ( result6(13) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(13),
	combout => \sine_out[6]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N31
\sine_out[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[6]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[6]~reg0_q\);

-- Location: MLABCELL_X21_Y2_N27
\sine_out[7]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[7]~reg0feeder_combout\ = ( result6(14) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(14),
	combout => \sine_out[7]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N28
\sine_out[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[7]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[7]~reg0_q\);

-- Location: MLABCELL_X21_Y2_N18
\sine_out[8]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[8]~reg0feeder_combout\ = ( result6(15) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(15),
	combout => \sine_out[8]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N19
\sine_out[8]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[8]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[8]~reg0_q\);

-- Location: MLABCELL_X21_Y2_N15
\sine_out[9]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[9]~reg0feeder_combout\ = ( result6(16) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(16),
	combout => \sine_out[9]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N16
\sine_out[9]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[9]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[9]~reg0_q\);

-- Location: MLABCELL_X21_Y2_N6
\sine_out[10]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \sine_out[10]~reg0feeder_combout\ = ( result6(17) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_result6(17),
	combout => \sine_out[10]~reg0feeder_combout\);

-- Location: FF_X21_Y2_N7
\sine_out[10]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \sine_out[10]~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[10]~reg0_q\);

-- Location: MLABCELL_X21_Y7_N36
\Mult3~717\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~717_sumout\ = SUM(( \Mult3~20\ ) + ( \Mult3~395\ ) + ( \Mult3~369\ ))
-- \Mult3~718\ = CARRY(( \Mult3~20\ ) + ( \Mult3~395\ ) + ( \Mult3~369\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mult3~395\,
	datad => \ALT_INV_Mult3~20\,
	cin => \Mult3~369\,
	sumout => \Mult3~717_sumout\,
	cout => \Mult3~718\);

-- Location: MLABCELL_X21_Y5_N27
\Add1~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~77_sumout\ = SUM(( !\Mult3~717_sumout\ ) + ( VCC ) + ( \Add1~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_Mult3~717_sumout\,
	cin => \Add1~70\,
	sumout => \Add1~77_sumout\);

-- Location: MLABCELL_X21_Y7_N39
\Mult3~372\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult3~372_sumout\ = SUM(( \Mult3~21\ ) + ( \Mult3~396\ ) + ( \Mult3~718\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult3~396\,
	datad => \ALT_INV_Mult3~21\,
	cin => \Mult3~718\,
	sumout => \Mult3~372_sumout\);

-- Location: DSP_X20_Y4_N0
\Mult4~346\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 14,
	ay_scan_in_clock => "0",
	ay_scan_in_width => 17,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	bx_width => 13,
	by_clock => "none",
	by_use_scan_in => "false",
	by_width => 18,
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_sumof2",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "false",
	signed_may => "false",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	aclr => \Mult4~346_ACLR_bus\,
	clk => \Mult4~346_CLK_bus\,
	ena => \Mult4~346_ENA_bus\,
	ax => \Mult4~346_AX_bus\,
	ay => \Mult4~346_AY_bus\,
	bx => \Mult4~346_BX_bus\,
	by => \Mult4~346_BY_bus\,
	resulta => \Mult4~346_RESULTA_bus\);

-- Location: MLABCELL_X21_Y4_N0
\Mult4~331\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult4~331_sumout\ = SUM(( !\Mult4~15\ ) + ( \Mult4~346_resulta\ ) + ( !VCC ))
-- \Mult4~332\ = CARRY(( !\Mult4~15\ ) + ( \Mult4~346_resulta\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult4~15\,
	datac => \ALT_INV_Mult4~346_resulta\,
	cin => GND,
	sumout => \Mult4~331_sumout\,
	cout => \Mult4~332\);

-- Location: FF_X21_Y4_N1
\sine_out[11]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mult4~331_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[11]~reg0_q\);

-- Location: MLABCELL_X21_Y4_N3
\Mult4~335\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mult4~335_sumout\ = SUM(( !\Mult4~15\ $ (!\Mult4~16\) ) + ( \Mult4~347\ ) + ( \Mult4~332\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mult4~15\,
	datac => \ALT_INV_Mult4~347\,
	datad => \ALT_INV_Mult4~16\,
	cin => \Mult4~332\,
	sumout => \Mult4~335_sumout\);

-- Location: FF_X21_Y4_N5
\sine_out[12]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mult4~335_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sine_out[12]~reg0_q\);

-- Location: LABCELL_X17_Y63_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


