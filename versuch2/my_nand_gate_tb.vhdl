-- Laboratory GdTi solutions/versuch2
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

-- Testbench for NAND gate
library IEEE;
use IEEE.std_logic_1164.all;

entity my_nand_gate_tb is
-- empty
end my_nand_gate_tb; 

architecture tb of my_nand_gate_tb is

-- DUT component
component my_nand_gate is
port(
a: in std_logic;
b: in std_logic;
y: out std_logic);
end component;
FOR DUT1: my_nand_gate USE ENTITY WORK.my_nand_gate(behavior);
FOR DUT2: my_nand_gate USE ENTITY WORK.my_nand_gate(structure);
FOR DUT3: my_nand_gate USE ENTITY WORK.my_nand_gate(dataflow);
signal a_in, b_in, y_out1,y_out2,y_out3: std_logic;

begin

-- Connect and
DUT1: my_nand_gate port map(a_in, b_in, y_out1);
DUT2: my_nand_gate port map(a_in, b_in, y_out2);
DUT3: my_nand_gate port map(a_in, b_in, y_out3);

process
begin

a_in <= '0';
b_in <= '0';
wait for 1 ns;
-- begin solution:
-- end solution!!

-- begin solution:
-- end solution!!

a_in <= '1';
b_in <= '0';
wait for 1 ns;
-- begin solution:
-- end solution!!

a_in <= '1';
b_in <= '1';
wait for 1 ns;
-- begin solution:
-- end solution!!

-- Clear inputs
a_in <= '0';
b_in <= '0';

assert false report "End of test!" severity note;
wait;
end process;
end tb;