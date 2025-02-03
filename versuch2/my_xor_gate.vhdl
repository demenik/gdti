-- Laboratory GdTi solutions/versuch2
-- Winter Semester 24/25
-- Group Details
-- Lab Date:
-- 1. Participant First and  Last Name: 
-- 2. Participant First and Last Name:
 
 
-- coding conventions
-- g_<name> Generics
-- p_<name> Ports
-- c_<name> Constants
-- s_<name> Signals
-- v_<name> Variables

library ieee;
use ieee.std_logic_1164.all;

entity my_xor_gate is
  port (
    -- begin solution:
    -- end solution!!
  );
end my_xor_gate;

-- dataflow
architecture dataflow of my_xor_gate is
begin

  y <= a xor b;

end dataflow;

-- behavior
architecture behavior of my_xor_gate is

-- begin solution:
-- end solution!!
end behavior;

-- structure
architecture structure of my_xor_gate is

begin
    -- calculate y = a xor b = (not(a) and b) or (a and not(b))
    y <= (not (a) and b) or (not (b) and a);
end structure;