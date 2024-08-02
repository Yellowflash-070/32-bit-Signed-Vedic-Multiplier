`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 21:28:40
// Design Name: 
// Module Name: CLA_16bit
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


module CLA_16bit(a,b,cin,sum,cout);

//declaring input and output variables
input [15:0]a,b;
input cin;
output [15:0]sum;
output cout;

//wire for intermediate carry
wire c_int;

//instantiating 4bit CLA
CLA_8bit cla1(a[7:0],b[7:0],cin,sum[7:0],c_int);
CLA_8bit cla2(a[15:8],b[15:8],c_int,sum[15:8],cout);

endmodule
