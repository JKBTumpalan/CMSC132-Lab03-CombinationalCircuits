LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------
ENTITY alu_2bit is
    port(input_i, input_j: IN STD_LOGIC_VECTOR(0 TO 1);
        operation: IN STD_LOGIC_VECTOR(0 TO 2);
        output_k: OUT STD_LOGIC_VECTOR(0 TO 1);
        c_out: OUT STD_LOGIC
    );
END alu_2bit;
-------------------------
ARCHITECTURE struct of alu_2bit is
    -----ALU COMPONENTS-----
    COMPONENT mux_8to1 is
        PORT(A,B,C,D,E,F,G,H: IN STD_LOGIC_VECTOR(0 TO 1);
        S: IN STD_LOGIC_VECTOR(0 TO 2);
        ALU_RESULT: OUT STD_LOGIC_VECTOR(0 TO 1));
    END COMPONENT;
    COMPONENT and_gate is
        PORT(A,B: IN STD_LOGIC_VECTOR(0 TO 1); C: OUT STD_LOGIC_VECTOR(0 TO 1));
    END COMPONENT;
    COMPONENT or_gate is
        PORT(A,B: IN STD_LOGIC_VECTOR(0 TO 1); C: OUT STD_LOGIC_VECTOR(0 TO 1));
    END COMPONENT;
    COMPONENT xor_gate is
        PORT(A,B: IN STD_LOGIC_VECTOR(0 TO 1); C: OUT STD_LOGIC_VECTOR(0 TO 1));
    END COMPONENT;
    COMPONENT not_gate is
        PORT(A: IN STD_LOGIC_VECTOR(0 TO 1); B: OUT STD_LOGIC_VECTOR(0 TO 1));
    END COMPONENT;
    COMPONENT full_adder_2bit is
        PORT(A, B: IN STD_LOGIC_VECTOR(0 TO 1);
        RESULT:OUT STD_LOGIC_VECTOR(0 TO 1); CARRY_OUT: OUT STD_LOGIC);
    END COMPONENT;
    
    -------LOGICAL OPERATOR OUTPUT WIRES------
    SIGNAL and_signal: STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL xor_signal: STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL or_signal: STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL not_signal: STD_LOGIC_VECTOR(0 TO 1);

    ------ ARITHMETIC OPERATION OUTPUT WIRES ---------
    SIGNAL addition_signal: STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL fs_1s_complement: STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL fs_2s_complement: STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL inc_signal: STD_LOGIC_VECTOR(0 TO 1);
    
    
    --------- HELPER WIRES --------
    SIGNAL fs_subtrahend_complement: STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL fs_borrowOut: STD_LOGIC_VECTOR(0 TO 1) := B"00"; --Borrow wire initialize to 0---
    SIGNAL fs_difference: STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL fs_difference2: STD_LOGIC_VECTOR(0 TO 1);
    SIGNAL incInput: STD_LOGIC_VECTOR(0 TO 1) := B"01"; --ADD ONE TO 2's COMPLEMENT---


    BEGIN
        incInput <= B"01";
        --AND component--
        and_op: and_gate port map(input_i,input_j,and_signal);
        --XOR component--
        xor_op: xor_gate port map(input_i,input_j,xor_signal);
        --OR component--
        or_op: or_gate port map(input_i,input_j,or_signal);
        --NOT component--
        not_op: not_gate port map(input_i,not_signal);
        --FULL ADDER component--
        fa_2bit_op: full_adder_2bit port map(input_i, input_j, addition_signal, c_out);
        --INCREMENT component--
        increment_op: full_adder_2bit port map(input_i, incInput, inc_signal, c_out);


        --FULL SUBTRACTOR complementer component--
        fs_subtrahend: not_gate port map(input_j, fs_subtrahend_complement);

        --1's complement component--
        fs_2bit_1s_complement: full_adder_2bit port map(input_i, fs_subtrahend_complement, fs_difference, fs_borrowOut(1));
        fs_2bit_1s_complement_with_carry: full_adder_2bit port map(fs_difference, fs_borrowOut, fs_1s_complement, c_out);

        --2's complement component--
        fs_2bit_2s_complement: full_adder_2bit port map(input_i, fs_subtrahend_complement, fs_difference2, fs_borrowOut(1));
        fs_2bit_2s_complement_plus_1: full_adder_2bit port map(fs_difference, incInput, fs_2s_complement, c_out);

        -------- MULTIPLEXER PORTING ----------
        main_mux: mux_8to1 port map(and_signal, or_signal, xor_signal, not_signal, addition_signal, fs_1s_complement, fs_2s_complement, inc_signal, operation, output_k);

END struct;