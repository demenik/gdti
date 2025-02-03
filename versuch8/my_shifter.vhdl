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
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.CONSTANT_Package.ALL;

entity my_shifter is
    generic(
        G_DATA_WIDTH : integer := C_DATA_WIDTH_GEN
    );
    port(
        -- begin solution:
        signal p_OP1: in std_logic_vector(G_DATA_WIDTH - 1 downto 0);
        signal p_OP2: in std_logic_vector(G_DATA_WIDTH - 1 downto 0);
        signal p_SHIFT_TYPE: in std_logic;
        signal p_SHIFT_DIR: in std_logic;

        signal p_RES: out std_logic_vector(G_DATA_WIDTH - 1 downto 0)
        -- end solution!!
    );
end entity;

architecture behavior of my_shifter is
    signal s_shamtInt : integer range 0 to (2**(integer(log2(real(G_DATA_WIDTH)))));
    signal s_tmp_val :  std_logic:='0';
begin
    s_shamtInt <= to_integer( unsigned(P_OP2(integer(log2(real(G_DATA_WIDTH))) - 1 downto 0)));
    -- begin solution:
    process (p_OP1, s_shamtInt, p_SHIFT_TYPE, p_SHIFT_DIR)
        variable tmp_result: std_logic_vector(G_DATA_WIDTH - 1 downto 0);
    begin
        if (p_SHIFT_DIR = '0') then -- left
            if (p_SHIFT_TYPE = '0') then -- logical
                p_RES <= (others => '0');
            else -- arithmetic
                p_RES <= (others => p_OP1(0));
            end if;

            for i in G_DATA_WIDTH - 1 downto s_shamtInt loop
                p_RES(i) <= p_OP1(i - s_shamtInt);
            end loop;
        else -- right
            if (p_SHIFT_TYPE = '0') then -- logical
                p_RES <= (others => '0');
            else -- arithmetic
                p_RES <= (others => p_OP1(G_DATA_WIDTH - 1));
            end if;

            for i in G_DATA_WIDTH - 1 - s_shamtInt downto 0 loop
                p_RES(i) <= p_OP1(i + s_shamtInt);
            end loop;
        end if;
    end process;
    -- end solution!!
end architecture behavior;

architecture dataflow of my_shifter is
    signal s_shamtInt: integer range 0 to (2**(integer(log2(real(G_DATA_WIDTH)))));
    signal s_res: std_logic_vector(G_DATA_WIDTH - 1 downto 0) := (others => '0');
begin 
    -- begin solution:
    -- end solution!!
    P_RES <= s_res;
end architecture dataflow;
