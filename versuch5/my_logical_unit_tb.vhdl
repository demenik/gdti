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
use IEEE.NUMERIC_STD.ALL;
use work.Constant_Package.ALL;

entity my_logical_unit_tb is 
end my_logical_unit_tb;

architecture behavior of my_logical_unit_tb is
    signal s_in1, s_in2 : STD_LOGIC_VECTOR(C_DATA_WIDTH_GEN - 1 downto 0) := (others => '0');
    signal s_result_lu : STD_LOGIC_VECTOR(C_DATA_WIDTH_GEN - 1 downto 0) := (others => '0'); 
    signal s_result_expected : STD_LOGIC_VECTOR(C_DATA_WIDTH_GEN - 1 downto 0) := (others => '0');
    signal s_lu_op : STD_LOGIC_VECTOR(C_OPCODE_WIDTH - 1 downto 0) := (others => '0');
    constant c_period : time := 10 ns;

    begin 
        LOGICAL_UNIT : entity work.my_logical_unit generic map (C_DATA_WIDTH_GEN, C_OPCODE_WIDTH) port map (s_in1, s_in2, s_lu_op, s_result_lu);

    process 
    begin 
       
        -- Wichtig: Erweiterung nur für Kobelaufgabe relevant!
        -- begin solution:
        -- end solution!!


        -- Tests für Aufgabe 2:
        s_in1 <= std_logic_vector(to_unsigned(8, C_DATA_WIDTH_GEN));
        s_in2 <= std_logic_vector(to_unsigned(12, C_DATA_WIDTH_GEN));

        wait for c_period/2;

        -- AND 
        s_lu_op <= C_AND_OP;
        s_result_expected <= s_in1 and s_in2;  
        wait for c_period/2; -- Wait for one clock cycle
        assert(s_result_expected = s_result_lu) report "Had error in AND-Function " severity error;
        
        -- OR 
        s_lu_op <= C_OR_OP;
        s_result_expected <= s_in1 or s_in2;  
        wait for c_period/2; -- Wait for one clock cycle
        assert(s_result_expected = s_result_lu) report "Had error in OR-Function " severity error;

        -- XOR 
        s_lu_op <= C_XOR_OP;
        s_result_expected <= s_in1 xor s_in2;  
        wait for c_period/2; -- Wait for one clock cycle
        assert(s_result_expected = s_result_lu) report "Had error in XOR-Function " severity error;
    
        wait for c_period/2; 
        
        s_in1 <= std_logic_vector(to_unsigned(2**C_DATA_WIDTH_GEN-1, C_DATA_WIDTH_GEN));
        s_in2 <= std_logic_vector(to_unsigned(2**C_DATA_WIDTH_GEN-1, C_DATA_WIDTH_GEN));

        wait for c_period/2;

        -- AND 
        s_lu_op <= C_AND_OP;
        s_result_expected <= s_in1 and s_in2;  
        wait for c_period/2; -- Wait for one clock cycle
        assert(s_result_expected = s_result_lu) report "Had error in AND-Function " severity error;
        
        -- OR 
        s_lu_op <= C_OR_OP;
        s_result_expected <= s_in1 or s_in2;  
        wait for c_period/2; -- Wait for one clock cycle
        assert(s_result_expected = s_result_lu) report "Had error in OR-Function " severity error;

        -- XOR 
        s_lu_op <= C_XOR_OP;
        s_result_expected <= s_in1 xor s_in2;  
        wait for c_period/2; -- Wait for one clock cycle
        assert(s_result_expected = s_result_lu) report "Had error in XOR-Function " severity error;
    
        wait for c_period/2; 

        assert false report "end of test" severity note;
        wait;
    
    end process;

end architecture behavior;