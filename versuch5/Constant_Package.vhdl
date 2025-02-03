-- Laboratory GdTi solutions/versuch5
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- begin solution: 
package Constant_Package is
  constant C_DATA_WIDTH_GEN : Integer := 10;

  constant C_OPCODE_WIDTH : Integer := 2;
  constant C_XOR_OP : STD_LOGIC_VECTOR (1 downto 0) := "00";
  constant C_OR_OP : STD_LOGIC_VECTOR (1 downto 0) := "10";
  constant C_AND_OP : STD_LOGIC_VECTOR (1 downto 0) := "01";
end Constant_Package ;
-- end solution!!
