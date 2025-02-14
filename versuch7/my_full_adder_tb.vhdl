-- Laboratory GdTi solutions/versuch7
-- Winter Semester 24/25
-- Group Details
-- Lab Date:
-- 1. Participant First and  Last Name: 
-- 2. Participant First and Last Name:
 
 
-- coding conventions
-- g_<name> Generics
-- p_<name> Ports
-- c_<name> Constants
-- s_<name> Signals
-- v_<name> Variables

library ieee;
use ieee.std_logic_1164.all;

entity my_full_adder_tb is
end my_full_adder_tb;

architecture behaviour of my_full_adder_tb is
  signal s_inA,s_inB,s_carry_in,s_sum,s_carry_out : std_logic;
begin
  full_adder_0: entity work.my_full_adder(structure) port map (P_A=>s_inA,P_B=>s_inB,P_CARRY_IN=>s_carry_in,P_SUM=>s_sum,P_CARRY_OUT=>s_carry_out);

  process begin
    s_inA <= '0'; s_inB <= '0'; s_carry_in <= '0'; wait for 1 fs;
    assert (s_carry_out='0') and (s_carry_out='0') report "bad result for input 0 0 0" severity error;
    wait for 1 fs;

    s_inA <= '0'; s_inB <= '0'; s_carry_in <= '1'; wait for 1 fs;
    assert (s_sum='1') and (s_carry_out='0') report "bad result for input 0 0 1" severity error;
    wait for 1 fs;

    s_inA <= '0'; s_inB <= '1'; s_carry_in <= '0'; wait for 1 fs;
    assert (s_sum='1') and (s_carry_out='0') report "bad result for input 0 1 0" severity error;
    wait for 1 fs;

    s_inA <= '0'; s_inB <= '1'; s_carry_in <= '1'; wait for 1 fs;
    assert (s_sum='0') and (s_carry_out='1') report "bad result for input 0 1 1" severity error;
    wait for 1 fs;

    s_inA <= '1'; s_inB <= '0'; s_carry_in <= '0'; wait for 1 fs;
    assert (s_sum='1') and (s_carry_out='0') report "bad result for input 1 0 0" severity error;
    wait for 1 fs;

    s_inA <= '1'; s_inB <= '0'; s_carry_in <= '1'; wait for 1 fs;
    assert (s_sum='0') and (s_carry_out='1') report "bad result for input 1 0 1" severity error;
    wait for 1 fs;

    s_inA <= '1'; s_inB <= '1'; s_carry_in <= '0'; wait for 1 fs;
    assert (s_sum='0') and (s_carry_out='1') report "bad result for input 1 1 0" severity error;
    wait for 1 fs;

    s_inA <= '1'; s_inB <= '1'; s_carry_in <= '1'; wait for 1 fs;
    assert (s_sum='1') and (s_carry_out='1') report "bad result for input 1 1 1" severity error;
    wait for 1 fs;
    
    assert false report "end of test" severity note;
    wait; --  Wait forever; this will finish the simulation.
  end process;
end behaviour;