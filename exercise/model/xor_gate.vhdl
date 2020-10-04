LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------
ENTITY xor_gate IS
   PORT (A, B: IN STD_LOGIC_VECTOR(0 TO 1);
   C: OUT STD_LOGIC_VECTOR(0 TO 1));
END xor_gate;
--------------------------------

ARCHITECTURE behavioral OF xor_gate IS
BEGIN
   C <= A XOR B;
END behavioral;
