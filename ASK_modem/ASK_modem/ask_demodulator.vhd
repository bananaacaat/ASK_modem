----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:13 05/14/2024 
-- Design Name: 
-- Module Name:    ask_demodulator - Behavioral 
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

entity ask_demodulator is
    Port (
        clk : in STD_LOGIC;                 -- Clock signal
        modulated_in : in STD_LOGIC;        -- Modulated input signal
        demodulated_out : out STD_LOGIC     -- Demodulated output signal
    );
end ask_demodulator;

architecture Behavioral of ask_demodulator is
    signal prev_sample : STD_LOGIC := '0';
    signal sample_count : integer := 0;
    constant THRESHOLD : integer := 10;  -- Threshold for demodulation
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if prev_sample /= modulated_in then
                sample_count <= sample_count + 1;
            else
                sample_count <= 0;
            end if;

            if sample_count >= THRESHOLD then
                demodulated_out <= prev_sample;
                sample_count <= 0;
            end if;

            prev_sample <= modulated_in;
        end if;
    end process;
end Behavioral;

