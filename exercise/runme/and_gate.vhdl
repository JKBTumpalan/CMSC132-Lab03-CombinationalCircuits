LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------
ENTITY and_gate IS
   PORT (A, B: IN STD_LOGIC_VECTOR(0 TO 1);
   C: OUT STD_LOGIC_VECTOR(0 TO 1));
END and_gate;
--------------------------------

ARCHITECTURE behavioral OF and_gate IS
BEGIN
   C <= A AND B;
END behavioral;
