`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2024 22:03:55
// Design Name: 
// Module Name: CLA_8bit
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


module CLA_8bit(a,b,cin,sum,cout);

//declaring input and output variables
input [7:0]a,b;
input cin;
output [7:0]sum;
output cout;

//wire for intermediate carry
wire c_int;

//instantiating 4bit CLA
CLA_4bit cla1(a[3:0],b[3:0],cin,sum[3:0],c_int);
CLA_4bit cla2(a[7:4],b[7:4],c_int,sum[7:4],cout);

endmodule
