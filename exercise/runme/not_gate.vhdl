LIBRARY ieee;
USE ieee.std_logic_1164.all;
---------------------------------
ENTITY not_gate IS
   PORT (A: IN STD_LOGIC_VECTOR(0 TO 1);
   B: OUT STD_LOGIC_VECTOR(0 TO 1));
END not_gate;
--------------------------------

ARCHITECTURE behavioral OF not_gate IS
BEGIN
   B <= NOT A;
END behavioral;
