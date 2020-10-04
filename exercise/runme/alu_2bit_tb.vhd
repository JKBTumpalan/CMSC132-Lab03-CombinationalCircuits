LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY alu_2bit_tb IS
END alu_2bit_tb;
ARCHITECTURE hardcoded OF alu_2bit_tb IS
   COMPONENT alu_2bit IS
    port(input_i, input_j: IN STD_LOGIC_VECTOR(0 TO 1);
        operation: IN STD_LOGIC_VECTOR(0 TO 2);
        output_k: OUT STD_LOGIC_VECTOR(0 TO 1);
        c_out: OUT STD_LOGIC
    );
   END COMPONENT;
   
   SIGNAL input: STD_LOGIC_VECTOR(0 TO 6);
   SIGNAL res: STD_LOGIC_VECTOR(0 TO 1);
   SIGNAL cout: STD_LOGIC;
BEGIN 
   UUT: alu_2bit PORT MAP (
      operation => input(0 to 2),
      input_i => input(3 to 4),
      input_j => input(5 to 6),
      output_k => res,
      c_out => cout
   );
   STIM_PROC: PROCESS
   BEGIN
      --------- TEST CASES FROM THE EXERCISE HANDOUT -----------
      input <= "0001011"; WAIT FOR 10 NS; ASSERT res="10" REPORT "0001011 failed,res= " & STD_LOGIC'IMAGE(res(0))& STD_LOGIC'IMAGE(res(1));
      input <= "0011011"; WAIT FOR 10 NS; ASSERT res="11" REPORT "0011011 failed,res= " & STD_LOGIC'IMAGE(res(0))& STD_LOGIC'IMAGE(res(1));
      input <= "0101011"; WAIT FOR 10 NS; ASSERT res="01" REPORT "0101011 failed,res= " & STD_LOGIC'IMAGE(res(0))& STD_LOGIC'IMAGE(res(1));
      input <= "0111011"; WAIT FOR 10 NS; ASSERT res="01" REPORT "0111011 failed,res= " & STD_LOGIC'IMAGE(res(0))& STD_LOGIC'IMAGE(res(1));
      input <= "1001011"; WAIT FOR 10 NS; ASSERT res="01" REPORT "1001011 failed,res= " & STD_LOGIC'IMAGE(res(0))& STD_LOGIC'IMAGE(res(1));
      input <= "1011011"; WAIT FOR 10 NS; ASSERT res="10" REPORT "1011011 failed,res= " & STD_LOGIC'IMAGE(res(0))& STD_LOGIC'IMAGE(res(1));
      input <= "1101011"; WAIT FOR 10 NS; ASSERT res="11" REPORT "1101011 failed,res= " & STD_LOGIC'IMAGE(res(0))& STD_LOGIC'IMAGE(res(1));
      input <= "1111011"; WAIT FOR 10 NS; ASSERT res="11" REPORT "1111011 failed,res= " & STD_LOGIC'IMAGE(res(0))& STD_LOGIC'IMAGE(res(1));
      WAIT;
   END PROCESS;
END;      
   

