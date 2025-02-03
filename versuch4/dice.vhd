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

entity dice is
  port (
    INPUT : in std_logic_vector(2 downto 0);
	 CLOCK_50 : in std_logic;
    OUTPUT : out std_logic_vector(6 downto 0)
  );
end dice;
        
architecture behavior of dice is
  signal s_INPUT : std_logic_vector(2 downto 0);
 
begin

wuerfel_0 : entity work.dice_decoder(behavior) port map (s_INPUT, OUTPUT);

process (CLOCK_50) is
begin
  if rising_edge(CLOCK_50) then   
	s_INPUT <= INPUT;
  end if;
end process;
end behavior;
