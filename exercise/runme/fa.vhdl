LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
 
ENTITY full_adder is
   PORT ( a : IN STD_LOGIC;
      b : IN STD_LOGIC;
      CarryIn : IN STD_LOGIC;
      Sum : OUT STD_LOGIC;
      CarryOut : OUT STD_LOGIC);
END full_adder;
 
ARCHITECTURE behavioral OF full_adder IS
 
BEGIN
 Sum <= A XOR B XOR CarryIn ;
 CarryOut <= (A AND B) OR (CarryIn AND A) 
               OR (CarryIn AND B) ;
end behavioral;
