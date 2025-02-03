-- Laboratory GdTi solutions/versuch7
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 20.1.25
-- 1. Participant First and  Last Name: Dominik Bernroider
-- 2. Participant First and Last Name:
 
 
-- coding conventions
-- g_<name> Generics
-- p_<name> Ports
-- c_<name> Constants
-- s_<name> Signals
-- v_<name> Variables

library ieee;
use ieee.std_logic_1164.all;
use work.Constant_Package.ALL;

entity my_gen_n_bit_full_adder is
  Generic (
    G_DATA_WIDTH : integer := C_DATA_WIDTH_GEN
  );
  port (
    -- begin solution:
    p_A: in std_logic_vector(G_DATA_WIDTH - 1 downto 0);
    p_B: in std_logic_vector(G_DATA_WIDTH - 1 downto 0);
    p_CARRY_IN: in std_logic;
    p_SUM: out std_logic_vector(G_DATA_WIDTH - 1 downto 0);
    p_CARRY_OUT: out std_logic
    -- end solution!!
  );
end my_gen_n_bit_full_adder;

-- structure
architecture structure of my_gen_n_bit_full_adder is
signal s_CARRY: std_logic_vector(0 to G_DATA_WIDTH - 1) := (others => '0');
signal s_VOID: std_logic;
begin
-- begin solution:
  s_CARRY(0) <= p_CARRY_IN;

  GEN: for i in 0 to G_DATA_WIDTH - 1 generate
    LAST: if i = G_DATA_WIDTH - 1 generate
      va_inst: entity work.my_full_adder(structure) port map (p_A(i), p_B(i), s_CARRY(i), p_SUM(i), s_VOID);
    end generate;

    OTHER: if i /= G_DATA_WIDTH - 1 generate
      va_inst: entity work.my_full_adder(structure) port map (p_A(i), p_B(i), s_CARRY(i), p_SUM(i), s_CARRY(i+1));
    end generate;
  end generate;
-- end solution!!
end structure;
