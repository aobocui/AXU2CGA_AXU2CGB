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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sel is
    Port ( ACLK   : in std_logic;
           ARESETn : in std_logic;
           sel_i : in std_logic;
           key0_i : in std_logic;
           key1_i : in std_logic;
           led_o : out std_logic);
end sel;

architecture rtl of sel is


led_o <= key0_i when sel_i = '0' else
         key1_i;
  

end rtl;
