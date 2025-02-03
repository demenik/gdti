-- Laboratory GdTi solutions/versuch9
-- Winter Semester 24/25
-- Group Details
-- Lab Date: 3.2.25
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

entity my_rail_crossing is
-- begin solution:
    port (
        signal p_CLK: in STD_LOGIC;
        signal p_CLK_1HZ: in STD_LOGIC;
        signal p_TRACK_OCCUPIED: in STD_LOGIC;
        signal p_TRAFFIC_LIGHT: out STD_LOGIC;
        signal p_GATE: out STD_LOGIC
    );
-- end solution!!
end entity;

--stucture
architecture behavior of my_rail_crossing is
    type state_type is (Standby, AmpelRot, SchrankeZu);

    signal s_current_state, s_next_state: state_type;
    signal s_timer_int: integer range 0 to 5 := 0;
begin
-- begin solution:
    process (p_CLK) begin
        if (rising_edge(p_CLK)) then
            s_current_state <= s_next_state;
        end if;
    end process;

    process (s_current_state, p_TRACK_OCCUPIED, s_timer_int) begin
        if (p_TRACK_OCCUPIED = '1') then
            if (s_timer_int = 5) then
                s_next_state <= SchrankeZu;
            else
                s_next_state <= AmpelRot;
            end if;
        else
            s_next_state <= Standby;
        end if;
    end process;

    process (p_CLK_1HZ) begin
        if p_TRACK_OCCUPIED = '1' then
            if rising_edge(p_CLK_1HZ) then
                if s_timer_int /= 5 then
                    s_timer_int <= s_timer_int + 1;
                end if;
            end if;
        else
            s_timer_int <= 0;
        end if;
    end process;

    process (s_current_state) begin
        case s_current_state is
            when Standby =>
                P_TRAFFIC_LIGHT <= '0';
                P_GATE <= '0';
            when AmpelRot =>
                p_TRAFFIC_LIGHT <= '1';
                p_GATE <= '0';
            when SchrankeZu =>
                p_TRAFFIC_LIGHT <= '1';
                p_GATE <= '1';
            when others =>
                p_TRAFFIC_LIGHT <= '0';
                p_GATE <= '0';
        end case;
    end process;
-- end solution!!
end behavior;

architecture dataflow_full of my_rail_crossing is
    signal S1, S0: STD_LOGIC := '0';
    signal S1_next, S0_next: STD_LOGIC;
    signal s_TIMER_RUN, s_TIMER_OUT: STD_LOGIC := '0';
    signal s_Timer: integer range 0 to 5 := 0;
    signal S_0000, S_0001, S_0010, S_0011, S_0100, S_0101, S_0110, S_0111, S_1000, S_1001, S_1010, S_1011: STD_LOGIC;
begin
-- begin solution:
    -- Flip-Flops
    process (p_CLK) begin
        if rising_edge(p_CLK) then
            S1 <= S1_next;
            S0 <= S0_next;
        end if;
    end process;

    -- Timer
    process (p_CLK_1HZ) begin
        if s_TIMER_RUN = '1' then
            if rising_edge(p_CLK_1HZ) then
                if s_Timer = 4 then -- 4 entspricht 5s, da wir in der 5. Sekunde überprüfen ob s_Timer = 4
                    s_Timer <= 0;
                    s_TIMER_OUT <= '1';
                else
                    s_Timer <= s_Timer + 1;
                    s_TIMER_OUT <= '0';
                end if;
            end if;
        else
            s_Timer <= 0;
        end if;
    end process;

    -- Minterme
    S_0000 <= not S1 and not S0 and not p_TRACK_OCCUPIED and not s_TIMER_OUT;
    S_0001 <= not S1 and not S0 and not p_TRACK_OCCUPIED and     s_TIMER_OUT;
    S_0010 <= not S1 and not S0 and     p_TRACK_OCCUPIED and not s_TIMER_OUT;
    S_0011 <= not S1 and not S0 and     p_TRACK_OCCUPIED and     s_TIMER_OUT;
    S_0100 <= not S1 and     S0 and not p_TRACK_OCCUPIED and not s_TIMER_OUT;
    S_0101 <= not S1 and     S0 and not p_TRACK_OCCUPIED and     s_TIMER_OUT;
    S_0110 <= not S1 and     S0 and     p_TRACK_OCCUPIED and not s_TIMER_OUT;
    S_0111 <= not S1 and     S0 and     p_TRACK_OCCUPIED and     s_TIMER_OUT;
    S_1000 <=     S1 and not S0 and not p_TRACK_OCCUPIED and not s_TIMER_OUT;
    S_1001 <=     S1 and not S0 and not p_TRACK_OCCUPIED and     s_TIMER_OUT;
    S_1010 <=     S1 and not S0 and     p_TRACK_OCCUPIED and not s_TIMER_OUT;
    S_1011 <=     S1 and not S0 and     p_TRACK_OCCUPIED and     s_TIMER_OUT;

    -- Disjunktion der Minterme
    S1_next <= S_0011 or S_0111 or S_1010 or S_1011;
    S0_next <= S_0010 or S_0110;
    s_TIMER_RUN <= S_0010 or S_0011 or S_0110 or S_0111 or S_1010 or S_1011;

    -- Ausgänge
    p_TRAFFIC_LIGHT <= S0 or S1;
    p_GATE <= S1;
-- end solution!!
end dataflow_full;

architecture dataflow_min of my_rail_crossing is
    signal S1, S0: STD_LOGIC := '0';
    signal S1_next, S0_next: STD_LOGIC;
    signal s_TIMER_RUN, s_TIMER_OUT: STD_LOGIC := '0';
    signal s_Timer: integer range 0 to 5 := 0;
begin
-- begin solution:
    -- Flip-Flops
    process (p_CLK) begin
        if rising_edge(p_CLK) then
            S1 <= S1_next;
            S0 <= S0_next;
        end if;
    end process;

    -- Timer
    process (p_CLK_1HZ) begin
        if s_TIMER_RUN = '1' then
            if rising_edge(p_CLK_1HZ) then
                if s_Timer = 4 then -- 4 entspricht 5s, da wir in der 5. Sekunde überprüfen ob s_Timer = 4
                    s_Timer <= 0;
                    s_TIMER_OUT <= '1';
                else
                    s_Timer <= s_Timer + 1;
                    s_TIMER_OUT <= '0';
                end if;
            end if;
        else
            s_Timer <= 0;
        end if;
    end process;

    -- Zustandsübergänge
    S1_next <= (not S1 and S0 and p_TRACK_OCCUPIED and s_TIMER_OUT) or (S1 and not S0 and p_TRACK_OCCUPIED and s_TIMER_OUT);
    S0_next <= (not S1 and not S0 and p_TRACK_OCCUPIED) or (S0 and not S1 and p_TRACK_OCCUPIED and not s_TIMER_OUT);

    -- Timer Bedingung
    s_TIMER_RUN <= (S0 and p_TRACK_OCCUPIED and not s_TIMER_OUT);

    -- Ausgänge
    p_TRAFFIC_LIGHT <= S0 or S1;
    p_GATE <= S1;
-- end solution!!
end dataflow_min;

architecture dataflow_tff of my_rail_crossing is
begin
-- begin solution:
-- end solution!!
end dataflow_tff;
