-- Laboratory GdTi solutions/versuch6
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 13.01.2025
-- 1. Participant First and  Last Name: Dominik Bernroider
-- 2. Participant First and Last Name: Christian Dreher
 
 
-- coding conventions
-- g_<name> Generics
-- p_<name> Ports
-- c_<name> Constants
-- s_<name> Signals
-- v_<name> Variables

-- begin solution:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity my_d_ff is
    Port ( p_D, p_Clk : in STD_LOGIC:='0';
           p_Q, p_Qn : out STD_LOGIC:='0'
           );
end my_d_ff;

architecture behavior of my_d_ff is
signal s_D_master, s_Enable_master: STD_LOGIC := '0';
signal s_Q_master, s_Qn_master: STD_LOGIC := '0';

signal s_D_slave, s_Enable_slave: STD_LOGIC := '0';
signal s_Q_slave, s_Qn_slave: STD_LOGIC := '0';
begin
    -- latch_master: entity work.my_gated_d_latch(structure) port map (s_D_master, s_Enable_master, s_Q_master, s_Qn_master);
    -- latch_slave: entity work.my_gated_d_latch(structure) port map (s_D_slave, s_Enable_slave, s_Q_slave, s_Qn_slave);

    -- process (p_Clk) is
    -- begin
    --     if rising_edge(p_Clk) then
    --         s_D_master <= p_D;
    --         s_Enable_master <= '1';

    --         p_Q <= s_Q_master;
    --         p_Qn <= not s_Q_master;
    --     else
    --         s_Enable_master <= '0';
    --     end if;
    -- end process;

    -- process (p_Clk) is
    -- begin
    --     if falling_edge(p_Clk) then
    --         s_D_slave <= s_Q_master;
    --         s_Enable_slave <= '1';
    --     else
    --         s_Enable_slave <= '0';
    --     end if;
    -- end process;

    process (p_Clk) is
    begin
        if rising_edge(p_Clk) then
            p_Q <= p_D;
        end if;
    end process;
end behavior;
-- end solution!!
