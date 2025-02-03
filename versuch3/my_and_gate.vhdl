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

entity my_and_gate is
  port (
    p_A, p_B: in std_logic;
    p_Y : out std_logic
  );
end my_and_gate;

-- dataflow
architecture dataflow of my_and_gate is
begin

  p_Y <= p_A and p_B;

end dataflow;

-- behavior
architecture behavior of my_and_gate is
begin
    process (p_A, p_B)
    begin
        if p_A = '1' then
            if  p_B = '1' then
              p_Y <= '1';
            else
              p_Y <= '0';
            end if;
        else
            p_Y <= '0';
        end if;
    end process;
end behavior;

-- structure
architecture structure of my_and_gate is

begin
    -- caculate NOT( NOT(p_A) OR NOT(p_B))
    p_Y<=not (not(p_A) or not(p_B));

end structure;
