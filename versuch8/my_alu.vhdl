-- Laboratory GdTi solutions/versuch8
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 27.01.25
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
use work.Constant_Package.ALL;


entity my_alu is
  generic (
    G_DATA_WIDTH  : integer := C_DATA_WIDTH_GEN;
    G_OP_WIDTH    : integer := C_OPCODE_WIDTH
  );
  port (
    -- begin solution:
    signal p_OP1: in STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 downto 0);
    signal p_OP2: in STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 downto 0);
    signal P_ALU_OP: in STD_LOGIC_VECTOR(G_OP_WIDTH - 1 downto 0);

    signal P_ALU_OUT: out STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 downto 0);
    signal P_CARRY_OUT: out STD_LOGIC
    -- end solution!!
  );

end entity my_alu;

architecture behavior of my_alu is
  signal s_res1, s_res2, s_res3, s_res4, s_res5, s_res6, s_res7, s_res8 : STD_LOGIC_VECTOR(G_DATA_WIDTH - 1 downto 0) := (others => '0');
  signal s_cIn,s_cOut,s_shift_type,s_shift_direction   : STD_LOGIC := '0';

begin
  XOR1:  entity work.my_gen_xor generic map (G_DATA_WIDTH) port map (p_op1, p_op2, s_res1);
  OR1:   entity work.my_gen_or  generic map (G_DATA_WIDTH) port map (p_op1, p_op2, s_res2);
  AND1:  entity work.my_gen_and generic map (G_DATA_WIDTH) port map (p_op1, p_op2, s_res3);
  Shift: entity work.my_shifter generic map (G_DATA_WIDTH) port map (p_op1, p_op2,s_shift_type,s_shift_direction, s_res4);
  ADD1:  entity work.my_gen_n_bit_full_adder generic map (G_DATA_WIDTH) port map (p_op1, p_op2, s_cIn, s_res5, s_cOut);


-- begin solution:
  s_cIn <= P_ALU_OP(G_OP_WIDTH - 1);
  s_shift_type <= P_ALU_OP(G_OP_WIDTH - 1);
  s_shift_direction <= P_ALU_OP(0) or s_shift_type;

  p_CARRY_OUT <= s_cOut;

  with P_ALU_OP select
    p_ALU_OUT <= s_res1 when C_XOR_OP,
                 s_res2 when C_OR_OP,
                 s_res3 when C_AND_OP,
                 s_res4 when C_SLL_OP,
                 s_res4 when C_SRL_OP,
                 s_res4 when C_SRA_OP,
                 s_res5 when C_ADD_OP,
                 s_res5 when C_SUB_OP,
                 (others => '0') when others;
-- end solution!!


end architecture behavior;
