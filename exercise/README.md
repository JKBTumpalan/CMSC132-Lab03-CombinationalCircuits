# Exercise 3: Combinational Circuits

## Arithmetic Logic Unit for 2 bits
> John Karl B. Tumpalan 

> CMSC 132 - ST3L 

> 2018 - 02385

## Contribution:
I made all the work here, we were not grouped by our lab instructor.

## Summary:
Created a basic ALU. I used vectors for representing the 2-bit input and output.  
For atomic gates, I used basic operators from VHDL. The not gate only inverts the first input.  
For the addition, I used cascaded full adders. first FA for the 2nd MSB and 2nd FA for the MSB.  
For the subtraction, I used the not gate to complement the 2nd input, then full adders to get the answer. 2 2-bit full adders were used.

> For the 1's complement, the 2nd 2-bit FA was used for the handling of the end carry.  

> For the 2's complement, the 2nd 2-bit FA was used for adding '01' to the sum of the first FA, per the rules of subtraction using 2's complement. 

For increment, I used 2-bit FA to add the constant '01', just like the increment of the sum in 2's complement subtraction.

## Folders
- ### model
    Contains all component's VHDL files
- ### others
    Contains the component diagrams of the units in the ALU, except for the atomic gates (AND, OR, XOR, NOT).
- ### test
    Contains the test bench using the input from the exercise handout
- ### runme
    Contains all the files and a bash script *__analyze.sh__* for analyzing all components and the test bench.

## Files
- ### Design.png
    Made using the simulator in the circuitverse.org. Input and output is interpreted as *__std_logic_vectors__*.

## References
- Full adder: https://github.com/jachermocilla/extra-course-materials/tree/cmsc132/cmsc132/vhdl

## Github repo
https://github.com/JKBTumpalan/CMSC132-Lab03-CombinationalCircuits.git