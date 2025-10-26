----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2025 01:13:31 PM
-- Design Name: 
-- Module Name: 2sel1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sel_top is
    Port ( ACLK   	: in std_logic;
           ARESETn 	: in std_logic;
           sel_i 	: in std_logic;
           key0_i 	: in std_logic;
           key1_i 	: in std_logic;
           led_o 	: out std_logic);
end sel_top;

architecture structural of sel_top is

begin
	i_sel: entity work.sel(rtl)
	port map(
		ACLK 	=> ACLK,
		ARESETn => ARESETn,
		sel_i 	=> sel_i,
		key0_i 	=> key0_i,
		key1_i 	=> key1_i,
		led_o 	=> led_o
		);

end structural;
