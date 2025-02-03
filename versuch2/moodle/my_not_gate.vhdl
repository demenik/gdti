-- Laboratory GdTi solutions/versuch2
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 18.11.2024
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

entity my_not_gate is
  port (
    -- begin solution:
    a: IN STD_LOGIC;
    y: OUT STD_LOGIC
    -- end solution!!
  );
end my_not_gate;

-- dataflow
architecture dataflow of my_not_gate is
begin

  y <= not a;

end dataflow;

-- behavior
architecture behavior of my_not_gate is
-- begin solution:
begin
  y <= not a;
-- end solution!!
end behavior;

-- structure
architecture structure of my_not_gate is

begin
    y <= not a;
end structure;
