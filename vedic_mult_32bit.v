`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 22:29:08
// Design Name: 
// Module Name: vedic_mult_32bit
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


module vedic_mult_32bit(a,b,out);

//declaring input and output variables
input [31:0]a,b;
output [63:0]out;

//declaring wires for 16x16 vedic multiplier output
wire [31:0]out_ved1,out_ved2,out_ved3,out_ved4;

//declaring wires for CLA
wire c1,c2,c3;
wire [31:0]cla_sum1,cla_sum2,cla_sum3;
wire or_carry;

//instantiating 16x16 vedic multiplier blocks
vedic_mult_16bit v1(a[15:0],b[15:0],out_ved1);
vedic_mult_16bit v2(a[15:0],b[31:16],out_ved2);
vedic_mult_16bit v3(a[31:16],b[15:0],out_ved3);
vedic_mult_16bit v4(a[31:16],b[31:16],out_ved4);

assign or_carry = c1 + c2;

//instantiating CLA blocks
CLA_32bit cla1(out_ved2,out_ved3,0,cla_sum1,c1);
CLA_32bit cla2({16'b0,out_ved1[31:16]},cla_sum1,0,cla_sum2,c2);
CLA_32bit cla3({15'b0,or_carry,cla_sum2[31:16]},out_ved4,0,cla_sum3,c3);

//final output logic
assign out = {cla_sum3,cla_sum2[15:0],out_ved1[15:0]};


endmodule
