# 32-bit-Signed-Vedic-Multiplier

<br>

## What is a Multiplier?
A multiplier module is a digital logic design that performs multiplication of two binary numbers. This module is typically used in digital signal processing, computer arithmetic (in ALU's), and other applications requiring fast and efficient multiplication.

<br>

## What is a Vedic Multiplier (VM)?
A Vedic multiplier is a multiplier based on Vedic mathematics, which is an ancient system of mathematics from India. The Vedic multiplication technique is efficient and can be implemented in digital circuits to perform fast multiplication. It utilizes algorithms derived from the "Vedic Mathematic Sutras", particularly the "Urdhva Tiryakbhyam" (Vertically and Crosswise) sutra, which allows for the generation of partial products and their summation in a structured manner.

<br>

## "Urdhva Triyakbhyam Sutra"
The Urdhva Tiryakbhyam Sutra, also known as the "Vertically and Crosswise" technique, is a powerful method for multiplication from Vedic mathematics. This method breaks down the multiplication process into manageable parts, allowing for parallel processing and faster computation. Following example will make things more clear. <br>

**Consider two 2-bit numbers A= a1a0 and B=b1b0**. <br>
**Vertical Multiplication (Step 1):** a0×b0 gives the least significant bit of the product.<br>
**Crosswise Multiplication (Step 2):** (a1×b0)+(a0×b1) gives the middle bits of the product.<br>
**Vertical Multiplication (Step 3):** a1×b1 gives the most significant bit of the product. <br>

**Now lets consider A = 10 (2 in decimal) and B = 11 (3 in decimal)** <br>
**Vertical Multiplication (Step 1):** a0×b0 = 0×1 = 0 . Result so far: 0.<br>
**Crosswise Multiplication (Step 2):** (a1×b0) + (a0×b1) = (1×1) + (0×1) = 1 . Result so far: 10 (placing 1 to the left of 0).<br>
**Vertical Multiplication (Step 3):** a1×b1 = 1×1 = 1. Final result: 110 (6 in decimal).


<br>

## Components of a basic Vedic Multiplier (VM)
Generally, a basic block of a Vedic Multiplier, lets say a 2bit Vedic Multiplier which can be formed using a set of 2 simple Half Adders and 4 AND gates. In order to form larger Vedic Multiplier designs we break down the design into smaller multiplier designs until we read the basic 2bit Vedic Multiplier. For instance, lets say we are building a 8bit Vedic Multiplier, for this we require a set of 4bit VM's and some Adders, furthermore to build 4bit VM's we require a set of 2bit VM's and some Adders. Hence, to build a N-bit VM we actually require 4 (N/2) bit VM's and 3 N bit Adders.

![image](https://github.com/user-attachments/assets/8068abf9-dc64-4182-997c-16ce95c3ad2c) <br> Fig 1: 2bit Vedic Multiplier Architecture.


<br>

## Building a Signed 32bit Vedic Multiplier (VM)
To build our 32bit VM we require 4 x (16bit VM's) and 3 x (32bit full Adders). In our case we have used Carry LookAhead Adders (CLA) as Full Adders. CLA's are as considered one of the fastest Adders available in Digital Logic Design, thus they aid in improving the efficiency of the Multiplication process.

![image](https://github.com/user-attachments/assets/9fd0f46b-378a-4c9e-ad2d-18c376a01a3a) <br> Fig 2: 32bit Vedic Multiplier Architecture.


<br>

### Signed VS Unsigned Multiplier
**Unsigned Multiplier:** There is no sign bit, and all bits contribute to the magnitude of the number and are treated as positive. For N-bit operands, the result will be a 2N-bit number, ranging from 0 to (2n−1)^2. <br>
**Signed Multiplier:** The MSB is the sign bit (0 - Positive and 1 - Negative), operands can be both negative as well as positive or the mixture of each other. The result can be of either nature, for N-bit operands, it will be a 2N-bit number, ranging from −2^(2N−2) to 2^(2N−2)−1. 

### Logic for converting an Unsigned Multiplier to a Signed Multiplier

We all know how to perform the basic multiplication. The logic behind the signed multiplier's circuit functionality remains the same but, we need to devise some logic as to when to obtain the negative output. <br><br>
For this we can use the following method: <br>
1. Consider just the input's magnitude (Lets say we have, -2 and 3. Consider -2 as 2). <br>
2. Multiply the magnitudes (2 x 3 = 6 ). <br>
3. Negate if needed (since we had a -2 , hence we'll negate the product obtained. 6 to -6).
<br><br>

![image](https://github.com/user-attachments/assets/840c8fce-8cfd-4ea7-a789-5302a6f304f7) <br> Fig 3: Possible combinations for two signed numbers. <br> <br>

This Logic is similar to the functionality of an Exclusive OR (Ex-OR) gate. <br><br>

![image](https://github.com/user-attachments/assets/c4a1b282-48fc-46eb-a558-2c47ad475771) <br> Fig 4: Ex-OR gate Truth Table. <br> <br>

Hence, we can consider the following Block Diagram representation for the Signed Multiplier functionality: <br><br>
![image](https://github.com/user-attachments/assets/a6824f20-568d-4e07-8986-79203f718471) <br> Fig 5: Signed Multiplication Logic - Block Diagram. <br> <br>

We follow all the steps previously discussed above to form the logic of Signed Multiplier functionality. <br>
1. The MSB bit of the operand governs whether we need to negate the input or not and is directly connected to the 2's complement enable signal (0 - Positive and 1 - Negative). <br>
2. Unsigned Multiplier block performs the Unsigned Multiplication on the operands. <br>
3. We take the Ex-OR of both the signed bits to decide whether the negation of the output is required or not to obtain the final result. <br><br>

### Elaborated RTL Schematic and Simulation Waveform
![Screenshot 2024-08-03 004134](https://github.com/user-attachments/assets/efa9f771-1985-4b37-b8f1-9b3936d8e884) <br> Fig 6: Elaborated RTL Schematic. <br> <br>
![Screenshot 2024-08-03 004311](https://github.com/user-attachments/assets/893c72ac-ccca-4c3b-ac5d-a3c13bb63735) <br> Fig 6: Simulation Waveform. <br> <br>

**NOTE: All coding and simulations are performed in Vivado Design suite 2020.2 edition.**










