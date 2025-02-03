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

entity my_xnor_gate is
  port (
    -- begin solution:
    a: IN STD_LOGIC;
    b: IN STD_LOGIC;
    y: OUT STD_LOGIC
    -- end solution!!
  );
end my_xnor_gate;

-- dataflow
architecture dataflow of my_xnor_gate is
begin

  y <= a xnor b;

end dataflow;

-- behavior
architecture behavior of my_xnor_gate is
-- begin solution:
begin
  process (a, b)
    begin
        if a = '1' then
          if b = '1' then
            y <= '1';
          else
            y <= '0';
          end if;
        else
          if b = '1' then
            y <= '0';
          else
            y <= '1';
          end if;
        end if;
    end process;
-- end solution!!
end behavior;

-- structure
architecture structure of my_xnor_gate is

begin

    -- calculate y = a xnor b = not((not(a) and b) or (a and not(b)))
    y <= not ((not (a) and b) or (not (b) and a));
end structure;
