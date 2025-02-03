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

entity my_half_adder_tb is
end my_half_adder_tb;

architecture behaviour of my_half_adder_tb is
  signal s_inA,s_inB,s_sum,s_carry : std_logic;
begin
  half_adder_0: entity work.my_half_adder(dataflow) port map (P_A=>s_inA, P_B=>s_inB, P_SUM=>s_sum, P_CARRY_OUT=>s_carry);

  process begin
    s_inA <= '0'; s_inB <= '0'; wait for 1 fs;
    assert (s_sum='0') and (s_carry='0') report "bad result for input 0 0" severity error;
    wait for 1 fs;

    s_inA <= '1'; s_inB <= '0'; wait for 1 fs;
    assert (s_sum='1') and (s_carry='0') report "bad result for input 1 0" severity error;
    wait for 1 fs;

    s_inA <= '0'; s_inB <= '1'; wait for 1 fs;
    assert (s_sum='1') and (s_carry='0') report "bad result for input 0 1" severity error;
    wait for 1 fs;

    s_inA <= '1'; s_inB <= '1'; wait for 1 fs;
    assert (s_sum='0') and (s_carry='1') report "bad result for input 1 1" severity error;
    wait for 1 fs;
    
    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behaviour;
