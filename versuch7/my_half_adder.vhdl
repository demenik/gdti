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

entity my_half_adder is
  port (
    -- begin solution:
    p_A: in std_logic;
    p_B: in std_logic;
    p_SUM: out std_logic;
    p_CARRY_OUT: out std_logic
    -- end solution!!
  );
end my_half_adder;

--Notieren Sie ihre Umformungsschritte unter diesem Kommentar:

-- begin solution:

-- s = a xor b
-- s = (not a and b) or (a and not b)
-- s = (not a nand b) nand (a nand not b)
-- s = ((a nand a) nand b) nand (a nand (b nand b))

-- c = a and b
-- c= (a nand b) nand (a nand b)

-- end solution!!

-- dataflow
architecture dataflow of my_half_adder is
signal s_temp : std_logic;
  begin
-- begin solution:
    p_SUM <= ((p_A nand p_A) nand p_B) nand (p_A nand (p_B nand p_B));
    p_CARRY_OUT <= (p_A nand p_B) nand (p_A nand p_B);
-- end solution!!
end dataflow;
