`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 21:38:03
// Design Name: 
// Module Name: vedic_mult_16bit
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


module vedic_mult_16bit(a,b,out);

//declaring input and output variables
input [15:0]a,b;
output [31:0]out;

//declaring wires for 8x8 vedic multiplier output
wire [15:0]out_ved1,out_ved2,out_ved3,out_ved4;

//declaring wires for CLA
wire c1,c2,c3;
wire [15:0]cla_sum1,cla_sum2,cla_sum3;
wire or_carry;

//instantiating 8x8 vedic multiplier blocks
vedic_mult_8bit v1(a[7:0],b[7:0],out_ved1);
vedic_mult_8bit v2(a[7:0],b[15:8],out_ved2);
vedic_mult_8bit v3(a[15:8],b[7:0],out_ved3);
vedic_mult_8bit v4(a[15:8],b[15:8],out_ved4);

assign or_carry = c1 + c2;

//instantiating CLA blocks
CLA_16bit cla1(out_ved2,out_ved3,0,cla_sum1,c1);
CLA_16bit cla2({8'b0,out_ved1[15:8]},cla_sum1,0,cla_sum2,c2);
CLA_16bit cla3({7'b0,or_carry,cla_sum2[15:8]},out_ved4,0,cla_sum3,c3);

//final output logic
assign out = {cla_sum3,cla_sum2[7:0],out_ved1[7:0]};


endmodule
