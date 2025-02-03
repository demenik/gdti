-- Laboratory GdTi solutions/versuch6
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 13.01.2025
-- 1. Participant First and  Last Name: Dominik Bernroider
-- 2. Participant First and Last Name: Christian Dreher
 
 
-- coding conventions
-- g_<name> Generics
-- p_<name> Ports
-- c_<name> Constants
-- s_<name> Signals
-- v_<name> Variables

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_rs_latch is
    Port ( p_R, p_S  : in STD_LOGIC:='0';
           p_Q, p_Qn : out STD_LOGIC:='0'
           );
end my_rs_latch;

architecture dataflow_sim of my_rs_latch is
SIGNAL s_Q:STD_LOGIC:='0';
SIGNAL s_Qn:STD_LOGIC:='0';
begin

        s_Q <= p_R NOR s_Qn after 1 ns;
        s_Qn<= p_S NOR s_Q after 1 ns;

       p_Q<=s_Q;
       p_Qn<=s_Qn;
      
end dataflow_sim;

 -- begin solution:
architecture dataflow_nand of my_rs_latch is
signal s_Q: std_logic := '0';
signal s_Qn: std_logic := '0';
begin
    -- p_R nor s_Qn
    -- <=> not (p_R or s_Qn)
    -- <=> not not (not p_R and not s_Qn)
    -- <=> not (not p_R nand not s_Qn)
    -- <=> ((p_R nand p_R) nand (s_Qn nand s_Qn)) nand ((p_R nand p_R) nand (s_Qn nand s_Qn))

    s_Q <= ((p_R nand p_R) nand (s_Qn nand s_Qn)) nand ((p_R nand p_R) nand (s_Qn nand s_Qn)) after 1 ns;
    s_Qn <= ((p_S nand p_S) nand (s_Q nand s_Q)) nand ((p_S nand p_S) nand (s_Q nand s_Q)) after 1 ns;
    
    p_Q <= s_Q;
    p_Qn <= s_Qn;
end dataflow_nand;
 -- end solution!!
