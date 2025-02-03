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
use work.Constant_Package.ALL;

-- begin solution:
entity my_gen_or is
generic (
  G_DATA_WIDTH : Integer := C_DATA_WIDTH_GEN
);
port (
  P_OP1 : in STD_LOGIC_VECTOR ( G_DATA_WIDTH - 1 downto 0) ;
  P_OP2 : in STD_LOGIC_VECTOR ( G_DATA_WIDTH - 1 downto 0) ;
  P_RESULT : out STD_LOGIC_VECTOR ( G_DATA_WIDTH - 1 downto 0)
) ;
end my_gen_or ;

architecture behavior of my_gen_or is
begin
  process (P_OP1, P_OP2)
  begin
    P_RESULT <= P_OP1 or P_OP2;
  end process;
end architecture behavior ;
-- end solution!!
