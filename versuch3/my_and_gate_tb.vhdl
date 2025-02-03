-- Laboratory GdTi solutions/versuch3
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

-- Testbench for AND gate
library IEEE;
use IEEE.std_logic_1164.all;

entity my_and_gate_tb is
-- empty
end my_and_gate_tb; 

architecture tb of my_and_gate_tb is

-- DUT component
-- component my_and_gate is
-- port(
-- p_A: in std_logic;
-- p_B: in std_logic;
-- p_Y: out std_logic);
-- end component;
-- FOR DUT1: my_and_gate USE ENTITY WORK.my_and_gate(behavior);
-- FOR DUT2: my_and_gate USE ENTITY WORK.my_and_gate(structure);
-- FOR DUT3: my_and_gate USE ENTITY WORK.my_and_gate(dataflow);
signal s_A_IN, s_B_IN, s_Y_OUT1,s_Y_OUT2,s_Y_OUT3: std_logic;

-- begin

-- Connect and
-- DUT1: my_and_gate port map(s_A_IN, s_B_IN, s_Y_OUT1);
-- DUT2: my_and_gate port map(s_A_IN, s_B_IN, s_Y_OUT2);
-- DUT3: my_and_gate port map(s_A_IN, s_B_IN, s_Y_OUT3);

begin
DUT1: entity work.my_and_gate(behavior) port map (s_A_IN, s_B_IN, s_Y_OUT1);
DUT2: entity work.my_and_gate(structure) port map (s_A_IN, s_B_IN, s_Y_OUT2);
DUT3: entity work.my_and_gate(dataflow) port map (s_A_IN, s_B_IN, s_Y_OUT3);

process
begin

s_A_IN <= '0';
s_B_IN <= '0';
wait for 1 ns;
assert(s_Y_OUT1='0') report "Error behavior 0/0" severity error;
assert(s_Y_OUT2='0') report "Error structure 0/0" severity error;
assert(s_Y_OUT3='0') report "Error dataflow 0/0" severity error;

s_A_IN <= '0';
s_B_IN <= '1';
wait for 1 ns;
assert(s_Y_OUT1='0') report "Error behavior 0/1" severity error;
assert(s_Y_OUT2='0') report "Error structure 0/1" severity error;
assert(s_Y_OUT3='0') report "Error dataflow 0/1" severity error;

s_A_IN <= '1';
s_B_IN <= '0';
wait for 1 ns;
assert(s_Y_OUT1='0') report "Error behavior 1/0" severity error;
assert(s_Y_OUT2='0') report "Error structure 1/0" severity error;
assert(s_Y_OUT3='0') report "Error dataflow 1/0" severity error;


s_A_IN <= '1';
s_B_IN <= '1';
wait for 1 ns;
assert(s_Y_OUT1='1') report "Error behavior 1/1" severity error;
assert(s_Y_OUT2='1') report "Error structure 1/1" severity error;
assert(s_Y_OUT3='1') report "Error dataflow 1/1" severity error;

-- Clear inputs
s_A_IN <= '0';
s_B_IN <= '0';

assert false report "Test done." severity note;
wait;
end process;
end tb;
