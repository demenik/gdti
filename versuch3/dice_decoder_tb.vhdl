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

entity dice_decoder_tb is 
end dice_decoder_tb;

architecture behavior of dice_decoder_tb is

  signal s_INPUT : std_logic_vector(2 downto 0);
  signal s_OUTPUT_1,s_OUTPUT_2 : std_logic_vector (6 downto 0);
begin
  wuerfel_0 : entity work.dice_decoder(behavior) port map (s_INPUT, s_OUTPUT_1);

  process begin
    s_INPUT <= "000"; wait for 1 ns;
    assert s_OUTPUT_1 = "0000000" report "Error for s_INPUT 000" severity error;
    wait for 1 fs;

    s_INPUT <= "001"; wait for 1 ns;
    assert s_OUTPUT_1 = "0000001" report "Error for s_INPUT 001" severity error;
    wait for 1 fs;

  -- p_INPUT = "000" => p_OUTPUT = "0000000" (0)
  -- p_INPUT = "001" => p_OUTPUT = "0000001" (1)
  -- p_INPUT = "010" => p_OUTPUT = "0011000" (2)
  -- p_INPUT = "011" => p_OUTPUT = "0011001" (3)
  -- p_INPUT = "100" => p_OUTPUT = "0011110" (4)
  -- p_INPUT = "101" => p_OUTPUT = "0011111" (5)
  -- p_INPUT = "110" => p_OUTPUT = "1111110" (6)

-- begin solution:
    s_INPUT <= "010"; wait for 1 ns;
    assert s_OUTPUT_1 = "0011000" report "Error for s_INPUT 010" severity error;
    wait for 1 fs;

    s_INPUT <= "011"; wait for 1 ns;
    assert s_OUTPUT_1 = "0011001" report "Error for s_INPUT 011" severity error;
    wait for 1 fs;

    s_INPUT <= "100"; wait for 1 ns;
    assert s_OUTPUT_1 = "0011110" report "Error for s_INPUT 100" severity error;
    wait for 1 fs;

    s_INPUT <= "101"; wait for 1 ns;
    assert s_OUTPUT_1 = "0011111" report "Error for s_INPUT 101" severity error;
    wait for 1 fs;

    s_INPUT <= "110"; wait for 1 ns;
    assert s_OUTPUT_1 = "1111110" report "Error for s_INPUT 110" severity error;
    wait for 1 fs;

    s_INPUT <= "111"; wait for 1 ns;
    assert s_OUTPUT_1 = "0000000" report "Error for s_INPUT 111" severity error;
    wait for 1 fs;
-- end solution!!

    assert false report "End of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behavior;
