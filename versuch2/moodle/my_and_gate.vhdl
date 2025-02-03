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

entity my_and_gate is
  port (
    a, b: in std_logic;
    y : out std_logic
  );
end my_and_gate;

-- dataflow
architecture dataflow of my_and_gate is
begin

  y <= a and b;

end dataflow;

-- behavior
architecture behavior of my_and_gate is
begin
    process (a, b)
    begin
        if a = '1' then
            if  b = '1' then
              y <= '1';
            else
              y <= '0';
            end if;
        else
            y <= '0';
        end if;
    end process;
end behavior;

-- structure
architecture structure of my_and_gate is

begin
    -- caculate NOT( NOT(a) OR NOT(b))
    y<=not (not(a) or not(b));

end structure;
