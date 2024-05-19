----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:43:50 05/14/2024 
-- Design Name: 
-- Module Name:    ask_modulator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity ask_modulator is
    Port (
        clk : in STD_LOGIC;                 -- Clock signal
        data_in : in STD_LOGIC_VECTOR(7 downto 0);  -- Digital data input
        modulated_out : out STD_LOGIC  -- Modulated output signal
    );
end ask_modulator;

architecture Behavioral of ask_modulator is
    signal carrier : STD_LOGIC;
    signal time_counter : INTEGER range 0 to 100000 := 0;
    constant CARRIER_FREQ : INTEGER := 500;  -- Carrier frequency in Hz
begin
    process (clk)
    begin
        if rising_edge(clk) then
            time_counter <= time_counter + 1;
            if time_counter >= (50000000 / CARRIER_FREQ) / 2 then  -- Adjust for carrier frequency
                time_counter <= 0;
                carrier <= not carrier;  -- Toggle carrier signal
            end if;

            if data_in(0) = '1' then
                modulated_out <= carrier;  -- Modulate carrier based on data input
            else
                modulated_out <= not carrier;  -- Inverted modulation for '0'
            end if;
        end if;
    end process;
end Behavioral;

