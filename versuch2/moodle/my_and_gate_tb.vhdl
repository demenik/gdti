-- Laboratory GdTi solutions/versuch2
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 18.11.2024
-- 1. Participant First and  Last Name: Dominik Bernroider
-- 2. Participant First and Last Name: Christian Dreher
 
 
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
component my_and_gate is
port(
a: in std_logic;
b: in std_logic;
y: out std_logic);
end component;
FOR DUT1: my_and_gate USE ENTITY WORK.my_and_gate(behavior);
FOR DUT2: my_and_gate USE ENTITY WORK.my_and_gate(structure);
FOR DUT3: my_and_gate USE ENTITY WORK.my_and_gate(dataflow);
signal a_in, b_in, y_out1,y_out2,y_out3: std_logic;

begin

-- Connect and
DUT1: my_and_gate port map(a_in, b_in, y_out1);
DUT2: my_and_gate port map(a_in, b_in, y_out2);
DUT3: my_and_gate port map(a_in, b_in, y_out3);

process
begin

a_in <= '0';
b_in <= '0';
wait for 1 ns;
assert(y_out1='0') report "Error behavior 0/0" severity error;
assert(y_out2='0') report "Error structure 0/0" severity error;
assert(y_out3='0') report "Error dataflow 0/0" severity error;

a_in <= '0';
b_in <= '1';
wait for 1 ns;
assert(y_out1='0') report "Error behavior 0/1" severity error;
assert(y_out2='0') report "Error structure 0/1" severity error;
assert(y_out3='0') report "Error dataflow 0/1" severity error;

a_in <= '1';
b_in <= '0';
wait for 1 ns;
assert(y_out1='0') report "Error behavior 1/0" severity error;
assert(y_out2='0') report "Error structure 1/0" severity error;
assert(y_out3='0') report "Error dataflow 1/0" severity error;


a_in <= '1';
b_in <= '1';
wait for 1 ns;
assert(y_out1='1') report "Error behavior 1/1" severity error;
assert(y_out2='1') report "Error structure 1/1" severity error;
assert(y_out3='1') report "Error dataflow 1/1" severity error;

-- Clear inputs
a_in <= '0';
b_in <= '0';

assert false report "End of test!" severity note;
wait;
end process;
end tb;
