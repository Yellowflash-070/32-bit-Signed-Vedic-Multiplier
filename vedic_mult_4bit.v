`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2024 19:51:21
// Design Name: 
// Module Name: vedic_mult_4bit
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


module vedic_mult_4bit(a,b,out);
//declaring input and output variables
input [3:0]a,b;
output [7:0]out;

//declaring wires for 2x2 vedic multiplier output
wire [3:0]out_ved1,out_ved2,out_ved3,out_ved4;

//declaring wires for CLA
wire c1,c2,c3;
wire [3:0]cla_sum1,cla_sum2,cla_sum3;
wire or_carry;

//instantiating 2x2 vedic multiplier blocks
vedic_mult_2bit v1(a[1:0],b[1:0],out_ved1);
vedic_mult_2bit v2(a[1:0],b[3:2],out_ved2);
vedic_mult_2bit v3(a[3:2],b[1:0],out_ved3);
vedic_mult_2bit v4(a[3:2],b[3:2],out_ved4);

assign or_carry = c1 + c2;

//instantiating CLA blocks
CLA_4bit cla1(out_ved2,out_ved3,0,cla_sum1,c1);
CLA_4bit cla2({2'b0,out_ved1[3:2]},cla_sum1,0,cla_sum2,c2);
CLA_4bit cla3({1'b0,or_carry,cla_sum2[3:2]},out_ved4,0,cla_sum3,c3);

//final output logic
assign out = {cla_sum3,cla_sum2[1:0],out_ved1[1:0]};

endmodule
