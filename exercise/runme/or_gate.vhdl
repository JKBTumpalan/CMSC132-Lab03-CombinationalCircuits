LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------
ENTITY or_gate IS
   PORT (A, B: IN STD_LOGIC_VECTOR(0 TO 1);
   C: OUT STD_LOGIC_VECTOR(0 TO 1));
END or_gate;
--------------------------------

ARCHITECTURE behavioral OF or_gate IS
BEGIN
   C <= A OR B;
END behavioral;
