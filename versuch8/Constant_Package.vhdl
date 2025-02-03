-- Laboratory GdTi solutions/versuch8
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 27.1.25
-- 1. Participant First and  Last Name: Dominik Bernroider
-- 2. Participant First and Last Name:
 
 
-- coding conventions
-- g_<name> Generics
-- p_<name> Ports
-- c_<name> Constants
-- s_<name> Signals
-- v_<name> Variables

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Constant_Package is
-- General constants 
constant C_OPCODE_WIDTH : Integer := 4;
constant C_DATA_WIDTH_GEN : Integer := 4;


-- Instruction Opcodes
constant C_AND_OP  : STD_LOGIC_VECTOR(C_OPCODE_WIDTH - 1 downto 0) := "0001";
constant C_XOR_OP  : STD_LOGIC_VECTOR(C_OPCODE_WIDTH - 1 downto 0) := "0010";
constant C_OR_OP   : STD_LOGIC_VECTOR(C_OPCODE_WIDTH - 1 downto 0) := "0011";

constant C_SLL_OP : STD_LOGIC_VECTOR(C_OPCODE_WIDTH - 1 downto 0) := "0100";
constant C_SRL_OP : STD_LOGIC_VECTOR(C_OPCODE_WIDTH - 1 downto 0) := "0101";
constant C_SRA_OP : STD_LOGIC_VECTOR(C_OPCODE_WIDTH - 1 downto 0) := "1110";

constant C_ADD_OP : STD_LOGIC_VECTOR(C_OPCODE_WIDTH - 1 downto 0) := "0111";
constant C_SUB_OP : STD_LOGIC_VECTOR(C_OPCODE_WIDTH - 1 downto 0) := "1000";

end package Constant_Package;
