`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 22:14:04
// Design Name: 
// Module Name: CLA_32bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CLA_32bit(a,b,cin,sum,cout);

//declaring input and output variables
input [31:0]a,b;
input cin;
output [31:0]sum;
output cout;

//wire for intermediate carry
wire c_int;

//instantiating 4bit CLA
CLA_16bit cla1(a[15:0],b[15:0],cin,sum[15:0],c_int);
CLA_16bit cla2(a[31:16],b[31:16],c_int,sum[31:16],cout);

endmodule
