library IEEE;
use IEEE.STD_LOGIC_1164.all;
---------------------
entity mux_8to1 is
 port(
     A,B,C,D,E,F,G,H : in STD_LOGIC_VECTOR(0 TO 1);
     S: in STD_LOGIC_VECTOR(0 To 2);
     ALU_RESULT: out STD_LOGIC_VECTOR(0 TO 1)
  );
end mux_8to1;
---------------------
architecture bhv of mux_8to1 is
begin
process (A,B,C,D,E,F,G,H, S) is
begin
  if (S(0) ='0' and S(1) = '0' and S(2) ='0') then
      ALU_RESULT <= A;
  elsif (S(0) ='0' and S(1) = '0' and S(2) ='1') then
      ALU_RESULT <= B;
  elsif (S(0) ='0' and S(1) = '1' and S(2) ='0') then
      ALU_RESULT <= C;
  elsif (S(0) ='0' and S(1) = '1' and S(2) ='1') then
      ALU_RESULT <= D;
  elsif (S(0) ='1' and S(1) = '0' and S(2) ='0') then
      ALU_RESULT <= E;
  elsif (S(0) ='1' and S(1) = '0' and S(2) ='1') then
      ALU_RESULT <= F;
  elsif (S(0) ='1' and S(1) = '1' and S(2) ='0') then
      ALU_RESULT <= G;
  else
      ALU_RESULT <= H;
  end if;

end process;
end bhv;
