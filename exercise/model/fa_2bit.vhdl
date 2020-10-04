LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
---------------------------------
ENTITY full_adder_2bit IS
   PORT (A, B: IN STD_LOGIC_VECTOR(0 TO 1);
   RESULT:OUT STD_LOGIC_VECTOR(0 TO 1);
   CARRY_OUT: OUT STD_LOGIC);
END full_adder_2bit;
--------------------------------
ARCHITECTURE struct OF full_adder_2bit IS
   COMPONENT full_adder IS
      PORT (a, b, carryIn: IN STD_LOGIC;
      sum, carryOut: OUT STD_LOGIC);
   END COMPONENT;

   SIGNAL carryOut1: STD_LOGIC;
   SIGNAL noInput: STD_LOGIC := '0';
BEGIN
    full_adder2: full_adder port map(A(1), B(1), noInput, RESULT(1), carryOut1);
    full_adder1: full_adder port map(A(0), B(0), carryOut1, RESULT(0), CARRY_OUT);
END struct;
