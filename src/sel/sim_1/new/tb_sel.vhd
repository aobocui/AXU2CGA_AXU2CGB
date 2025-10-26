----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2025 03:04:24 PM
-- Design Name: 
-- Module Name: tb_sel - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


library ieee;
use ieee.std_logic_1164.all;

entity tb_sel is
end tb_sel;

architecture tb of tb_sel is

    component sel_top
        port (ACLK    : in std_logic;
              ARESETn : in std_logic;
              sel_i   : in std_logic;
              key0_i  : in std_logic;
              key1_i  : in std_logic;
              led_o   : out std_logic);
    end component;

    signal ACLK    : std_logic;
    signal ARESETn : std_logic;
    signal sel_i   : std_logic;
    signal key0_i  : std_logic;
    signal key1_i  : std_logic;
    signal led_o   : std_logic;

    constant TbPeriod : time := 100 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : sel_top
    port map (ACLK    => ACLK,
              ARESETn => ARESETn,
              sel_i   => sel_i,
              key0_i  => key0_i,
              key1_i  => key1_i,
              led_o   => led_o);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that ACLK is really your main clock signal
    ACLK <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
        sel_i <= '0';
        key0_i <= '0';
        key1_i <= '0';

        -- Reset generation
        -- ***EDIT*** Check that ARESETn is really your reset signal
        ARESETn <= '1';
        wait for 100 ns;
        ARESETn <= '0';
        wait for 100 ns;
        
        sel_i <= '0';
        key0_i <= '0';
        key1_i <= '1';
        wait for 100 ns;       

        sel_i <= '0';
        key0_i <= '1';
        key1_i <= '0';
        wait for 100 ns;  
        
        sel_i <= '1';
        key0_i <= '0';
        key1_i <= '1';
        wait for 100 ns;  
        
        sel_i <= '1';
        key0_i <= '1';
        key1_i <= '0';
        wait for 100 ns;  

        sel_i <= '1';
        key0_i <= '1';
        key1_i <= '1';
        wait for 100 ns;                  
        -- ***EDIT*** Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;