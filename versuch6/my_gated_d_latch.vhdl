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

 -- begin solution:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_gated_d_latch is
    Port ( p_D, p_Enable  : in STD_LOGIC:='0';
           p_Q, p_Qn : out STD_LOGIC:='0'
           );
end my_gated_d_latch;

architecture structure of my_gated_d_latch is
signal s_R, s_S: std_logic := '0';
signal s_Q, s_Qn: std_logic := '0';
begin
    s_S <= (p_D nand p_Enable) nand (p_D nand p_Enable);
    s_R <= ((p_D nand p_D) nand p_Enable) nand ((p_D nand p_D) nand p_Enable);

    my_rs_latch: entity work.my_rs_latch(dataflow_nand) port map (s_R, s_S, s_Q, s_Qn);

    p_Q <= s_Q;
    p_Qn <= s_Qn;
end structure;
 -- end solution!!
