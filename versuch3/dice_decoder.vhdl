-- Laboratory GdTi solutions/versuch3
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 25.11.2024
-- 1. Participant First and  Last Name: Dominik Bernroider
-- 2. Participant First and Last Name: Christian Dreher
 
 
-- coding conventions
-- g_<name> Generics
-- p_<name> Ports
-- c_<name> Constants
-- s_<name> Signals
-- v_<name> Variables

library ieee;
use ieee.std_logic_1164.all;

entity dice_decoder is
  port (
    -- begin solution:
    p_INPUT : in std_logic_vector(2 downto 0);
    p_OUTPUT : out std_logic_vector(6 downto 0)
    -- end solution!!
  );
end dice_decoder;

-- behavior
  -- Truth Table for p_INPUT (2 downto 0) to p_OUTPUT (6 downto 0)
  -- p_INPUT = "001" => p_OUTPUT = "0000000" (for p_INPUT 1)
  -- begin solution:
  -- p_INPUT = "000" => p_OUTPUT = "0000000" (0)
  -- p_INPUT = "001" => p_OUTPUT = "0000001" (1)
  -- p_INPUT = "010" => p_OUTPUT = "0011000" (2)
  -- p_INPUT = "011" => p_OUTPUT = "0011001" (3)
  -- p_INPUT = "100" => p_OUTPUT = "0011110" (4)
  -- p_INPUT = "101" => p_OUTPUT = "0011111" (5)
  -- p_INPUT = "110" => p_OUTPUT = "1111110" (6)
  -- end solution!!
  -- All other cases => p_OUTPUT = "0000000" (default: set all p_OUTPUT to zero)
        
architecture behavior of dice_decoder is
begin
-- begin solution:
process (p_INPUT)
  begin case p_INPUT is
    when "000" =>
      p_OUTPUT(6 downto 0) <= "0000000";
    when "001" =>
      p_OUTPUT(6 downto 0) <= "0000001";
    when "010" =>
      p_OUTPUT(6 downto 0) <= "0011000";
    when "011" =>
      p_OUTPUT(6 downto 0) <= "0011001";
    when "100" =>
      p_OUTPUT(6 downto 0) <= "0011110";
    when "101" =>
      p_OUTPUT(6 downto 0) <= "0011111";
    when "110" =>
      p_OUTPUT(6 downto 0) <= "1111110";
    when others =>
      p_OUTPUT(6 downto 0) <= "0000000";
  end case;
end process;
-- end solution!!
end behavior;

-- dataflow
architecture dataflow of dice_decoder is

signal s_A,s_B,s_Y : std_logic;
begin
-- begin solution:
-- end solution!!
end dataflow;
