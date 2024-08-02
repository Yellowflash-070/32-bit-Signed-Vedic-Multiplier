`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.02.2024 21:59:50
// Design Name: 
// Module Name: vedic_mult_8bit
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


module vedic_mult_8bit(a,b,out);

//declaring input and output variables
input [7:0]a,b;
output [15:0]out;

//declaring wires for 4x4 vedic multiplier output
wire [7:0]out_ved1,out_ved2,out_ved3,out_ved4;

//declaring wires for CLA
wire c1,c2,c3;
wire [7:0]cla_sum1,cla_sum2,cla_sum3;
wire or_carry;

//instantiating 4x4 vedic multiplier blocks
vedic_mult_4bit v1(a[3:0],b[3:0],out_ved1);
vedic_mult_4bit v2(a[7:4],b[3:0],out_ved2);
vedic_mult_4bit v3(a[3:0],b[7:4],out_ved3);
vedic_mult_4bit v4(a[7:4],b[7:4],out_ved4);

assign or_carry = c1 + c2;

//instantiating CLA blocks
CLA_8bit cla1(out_ved2,out_ved3,0,cla_sum1,c1);
CLA_8bit cla2({4'b0,out_ved1[7:4]},cla_sum1,0,cla_sum2,c2);
CLA_8bit cla3({3'b0,or_carry,cla_sum2[7:4]},out_ved4,0,cla_sum3,c3);

//final output logic
assign out = {cla_sum3,cla_sum2[3:0],out_ved1[3:0]};


endmodule
