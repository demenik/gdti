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

entity my_D_FF_TB is
end my_D_FF_TB;

architecture behavior of my_D_FF_TB is
    signal s_Q, s_Qn, s_Clk, s_D : STD_LOGIC;
begin
    -- DUT1: Entity instantiation
    DUT1: entity work.my_D_FF
        port map (s_D, s_Clk, s_Q, s_Qn);

    -- Clock process to generate the clock signal
    clock: process
    begin
        s_Clk <= '0';
        wait for 5 ns;  
        s_Clk <= '1';
        wait for 5 ns;  
    end process;

    -- Test process
    process
    begin
        -- Test 1: Set (s_D = '1')
        s_D <= '1';
        wait for 10 ns;
        assert (s_Q = '1' and s_Qn = '0') report "Test 1 failed" severity error;

        -- Test 2: Reset (s_D = '0')
        s_D <= '0';
        wait for 10 ns;
        assert (s_Q = '0' and s_Qn = '1') report "Test 2 failed" severity error;

        -- Test 3: Hold (s_D remains the same)
        wait for 5 ns;
        assert (s_Q = '0' and s_Qn = '1') report "Test 3 failed" severity error;
        wait for 5 ns;

        -- Test 4: Hold(s_Q remains the same while s_D changes)
        s_D <= '1';
        wait for 4 ns;
        assert (s_Q = '0' and s_Qn = '1') report "Test 4 failed" severity error;
        wait for 6 ns;
        assert (s_Q = '1' and s_Qn = '0') report "Test 4 failed" severity error;
        s_D <= '0';
        wait for 4 ns;
        assert (s_Q = '1' and s_Qn = '0') report "Test 4 failed" severity error;
        wait for 6 ns;

        -- Test 5: Hold and set new (s_D switches between '0' and '1')
        wait for 5 ns;
        s_D <= '0';
        wait for 5 ns;
        s_D <= '1';
        wait for 10 ns;
        assert (s_Q = '1' and s_Qn = '0') report "Test 5 failed" severity error;
        
        report "End of Test!!!";
        wait;
    end process;
end behavior;
