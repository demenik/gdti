-- Laboratory GdTi solutions/versuch7
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 20.1.25
-- 1. Participant First and  Last Name: Dominik Bernroider
-- 2. Participant First and Last Name:
 
 
-- coding conventions
-- g_<name> Generics
-- p_<name> Ports
-- c_<name> Constants
-- s_<name> Signals
-- v_<name> Variables

library ieee;
use ieee.std_logic_1164.all;

entity my_full_adder is
  port (
    -- begin solution:
    p_A: in std_logic;
    p_B: in std_logic;
    p_CARRY_IN: in std_logic;
    p_SUM: out std_logic;
    p_CARRY_OUT: out std_logic
    -- end solution!!
  );
end my_full_adder;

-- structure
architecture structure of my_full_adder is
signal s_CARRY_1: STD_LOGIC := '0';
signal s_SUM_1: STD_LOGIC := '0';
signal s_CARRY_2: STD_LOGIC := '0';
begin
-- begin solution:
  ha_1: entity work.my_half_adder(dataflow) port map (p_A, p_B, s_SUM_1, s_CARRY_1);
  ha_2: entity work.my_half_adder(dataflow) port map (s_SUM_1, p_CARRY_IN, p_SUM, s_CARRY_2);
  p_CARRY_OUT <= s_CARRY_1 or s_CARRY_2;
-- end solution!!
end structure;
