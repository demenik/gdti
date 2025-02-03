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

entity my_gated_D_Latch_TB is
end my_gated_D_Latch_TB;

architecture behavior of my_gated_D_Latch_TB is
    signal s_D, s_Enable, s_Q, s_Qn : STD_LOGIC;
begin
    UUT: entity work.my_gated_D_Latch
        port map (s_D, s_Enable, s_Q, s_Qn);

    process
    begin
        -- Test 1: set (s_D = 1, s_Enable = 1)
        s_D <= '1';
        s_Enable <= '1';
        wait for 10 ns;
        assert (s_Q = '1' and s_Qn = '0') report "Test 1 11/10 failed" severity error;


        -- Test 2: reset (s_D = 0, s_Enable = 1)
        s_D <= '0';
        s_Enable <= '1';
        wait for 10 ns;
        assert (s_Q = '0' and s_Qn = '1') report "Test 2 01/01 failed" severity error;

        -- begin solution:
        s_D <= '1';
        s_Enable <= '0';
        wait for 10 ns;
        assert (s_Q = '0' and s_Qn = '1') report "Test 3 10 failed" severity error;

        s_D <= '0';
        s_Enable <= '0';
        wait for 10 ns;
        assert (s_Q = '0' and s_Qn = '1') report "Test 4 00 failed" severity error;

        s_D <= '1';
        s_Enable <= '1';
        wait for 10 ns;

        s_D <= '1';
        s_Enable <= '0';
        wait  for 10 ns;
        assert (s_Q = '1' and s_Qn = '0') report "Test 5 10 failed" severity error;
        -- end solution!!

       report "End of Test!!!";
       wait;
    end process;
end behavior;
