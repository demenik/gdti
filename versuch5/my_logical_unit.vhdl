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

entity my_logical_unit is 
    -- begin solution: 
    generic (
      G_DATA_WIDTH : Integer := C_DATA_WIDTH_GEN;
      G_OP_WIDTH : Integer := C_OPCODE_WIDTH
    );
    port (
      P_OP1 : in STD_LOGIC_VECTOR ( G_DATA_WIDTH - 1 downto 0) ;
      P_OP2 : in STD_LOGIC_VECTOR ( G_DATA_WIDTH - 1 downto 0) ;
      P_LU_OP : in STD_LOGIC_VECTOR ( G_OP_WIDTH - 1 downto 0 );
      P_LU_OUT : out STD_LOGIC_VECTOR ( G_DATA_WIDTH - 1 downto 0)
    ) ;
    -- end solution!!
end my_logical_unit;

architecture structure of my_logical_unit is 
    signal s_result_and, s_result_or, s_result_xor : STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 downto 0);

    begin 
    -- begin solution:
    my_gen_and : entity work.my_gen_and(behavior) generic map (G_DATA_WIDTH) port map (P_OP1, P_OP2, s_result_and);
    my_gen_or : entity work.my_gen_or(behavior) generic map (G_DATA_WIDTH) port map (P_OP1, P_OP2, s_result_or);
    my_gen_xor : entity work.my_gen_xor(behavior) generic map (G_DATA_WIDTH) port map (P_OP1, P_OP2, s_result_xor);

    process (P_OP1, P_OP2, P_LU_OP)
    begin
      if (P_LU_OP = C_AND_OP) then
        P_LU_OUT <= s_result_and;
      elsif (P_LU_OP = C_OR_OP) then
        P_LU_OUT <= s_result_or;
      elsif (P_LU_OP = C_XOR_OP) then
        P_LU_OUT <= s_result_xor;
      else
        P_LU_OUT <= (others => '0');
      end if;
    end process;
    -- end solution!!
end architecture structure;
