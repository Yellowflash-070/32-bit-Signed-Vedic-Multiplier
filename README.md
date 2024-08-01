# 32-bit-Signed-Vedic-Multiplier

<br>

## What is a Multiplier?
A multiplier module is a digital logic design that performs multiplication of two binary numbers. This module is typically used in digital signal processing, computer arithmetic (in ALU's), and other applications requiring fast and efficient multiplication.

<br>

## What is a Vedic Multiplier (VM)?
A Vedic multiplier is a multiplier based on Vedic mathematics, which is an ancient system of mathematics from India. The Vedic multiplication technique is efficient and can be implemented in digital circuits to perform fast multiplication. It utilizes algorithms derived from the "Vedic Mathematic Sutras", particularly the "Urdhva Tiryakbhyam" (Vertically and Crosswise) sutra, which allows for the generation of partial products and their summation in a structured manner.

<br>

## Components of a basic Vedic Multiplier (VM)
Generally, a basic block of a Vedic Multiplier, lets say a 2bit Vedic Multiplier which can be formed using a set of 2 simple Half Adders and 4 AND gates. In order to form larger Vedic Multiplier designs we break down the design into smaller multiplier designs until we read the basic 2bit Vedic Multiplier. For instance, lets say we are building a 8bit Vedic Multiplier, for this we require a set of 4bit VM's and some Adders, furthermore to build 4bit VM's we require a set of 2bit VM's and some Adders. Hence, to build a N-bit VM we actually require 4 (N/2) bit VM's and 3 N bit Adders.

<br>

## Building a Signed 32bit Vedic Multiplier (VM)
To build our 32bit VM we require 4 x (16bit VM's) and 3 x (32bit full Adders). In our case we have used Carry LookAhead Adders (CLA) as Full Adders. CLA's are considered one of the fastest Adders available in Digital Logic Design, thus they aid in improving the efficiency of the Multiplication process.

<br>

### Signed VS Unsigned Multiplier


