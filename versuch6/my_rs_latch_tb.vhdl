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

entity my_rs_latch_tb is
end my_rs_latch_tb;

architecture behavior of my_rs_latch_tb is
    signal s_R, s_S, s_Q1, s_Qn1, s_Q2, s_Qn2: STD_LOGIC := '0';
begin
    DUT_SIM: entity work.my_rs_latch(dataflow_sim)
        port map (s_R, s_S, s_Q1, s_Qn1);
    
    -- begin solution
    DUT: entity work.my_rs_latch(dataflow_nand)
        port map (s_R, s_S, s_Q2, s_Qn2);  
    -- end solution

    process
    begin
        -- Test case 1: Set (s_S = 1)
        s_R <= '0';
        s_S <= '1';
        wait for 5 ns;
        assert (s_Q1 = '1' and s_Qn1 = '0') report "Test case 1 failed" severity error;
        -- begin solution:
        assert (s_Q2 = '1' and s_Qn2 = '0') report "Test case 1 failed" severity error;
        -- end solution!!
        wait for 1 ns;

        -- Test case 2: Hold (s_R = 1, s_S = 1)
        s_R <= '0';
        s_S <= '0';
        wait for 5 ns;
        assert (s_Q1 = '1' and s_Qn1 = '0') report "Test case 2 failed" severity error;
        -- begin solution:
        assert (s_Q2 = '1' and s_Qn2 = '0') report "Test case 2 failed" severity error;
        -- end solution!!
        wait for 5 ns;

        -- Test case 3: Reset (s_R = 1)
        s_S <= '0';
        s_R <= '1';
        wait for 5 ns;
        assert (s_Q1 = '0' and s_Qn1 = '1') report "Test case 3 failed" severity error;
        -- begin solution:
        assert (s_Q2 = '0' and s_Qn2 = '1') report "Test case 3 failed" severity error;
        -- end solution!!
        wait for 5 ns;

        -- Test case 4: Hold (s_R = 0, s_S = 0)
        s_R <= '0';
        s_S <= '0';
        wait for 5 ns;
        assert (s_Q1 = '0' and s_Qn1 = '1') report "Test case 4 failed" severity error;
        -- begin solution:
        assert (s_Q2 = '0' and s_Qn2 = '1') report "Test case 4 failed" severity error;
        -- end solution!!
        wait for 5 ns;

        -- Test case 5: Forbidden (s_R = 1, s_S = 1)
        s_R <= '1';
        s_S <= '1';
        wait for 5 ns;
        assert (s_Q1 = '0' and s_Qn1 = '0') report "Test case 5 failed" severity error;
        -- begin solution:
        assert (s_Q2 = '0' and s_Qn2 = '0') report "Test case 5 failed" severity error;
        -- end solution!!
        wait for 5 ns;

        -- Test case 6: Metastable state (s_R = 0, s_S = 0)
        s_R <= '0';
        s_S <= '0';
        report "End of Test!!!";
        wait;
    end process;
end behavior;
