-- Laboratory GdTi solutions/versuch2
-- Winter Semester 23/24
-- Group Details
-- Lab Date: 18.11.2024
-- 1. Participant First and  Last Name: Dominik Bernroider
-- 2. Participant First and Last Name: Christian Dreherher
 
 
-- coding conventions
-- g_<name> Generics
-- p_<name> Ports
-- c_<name> Constants
-- s_<name> Signals
-- v_<name> Variables

-- Testbench for XNOR gate
library IEEE;
use IEEE.std_logic_1164.all;

entity my_not_gate_tb is
-- empty
end my_not_gate_tb; 

architecture tb of my_not_gate_tb is

-- DUT component
component my_not_gate is
port(
a: in std_logic;
y: out std_logic);
end component;
FOR DUT1: my_not_gate USE ENTITY WORK.my_not_gate(behavior);
FOR DUT2: my_not_gate USE ENTITY WORK.my_not_gate(structure);
FOR DUT3: my_not_gate USE ENTITY WORK.my_not_gate(dataflow);
signal a_in, y_out1,y_out2,y_out3: std_logic;

begin

-- Connect XOR
DUT1: my_not_gate port map(a_in, y_out1);
DUT2: my_not_gate port map(a_in, y_out2);
DUT3: my_not_gate port map(a_in, y_out3);

process
begin

a_in <= '0';
wait for 1 ns;
-- begin solution:
-- end solution!!

a_in <= '1';
wait for 1 ns;

-- Clear inputs
a_in <= '0';

assert false report "End of test!" severity note;
wait;
end process;
end tb;
