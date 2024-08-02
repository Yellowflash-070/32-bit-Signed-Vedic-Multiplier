`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2024 19:08:39
// Design Name: 
// Module Name: signed_vedic_mult_32bit
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


module signed_vedic_mult_32bit(a,b,out);

//declaring input and output variables
input [31:0]a,b;
output [63:0]out;

//declaring intermediate wires
wire [31:0]t32bit_out1, t32bit_out2;
wire [63:0]v1_out;

//control bit for 2's complement module (output)
assign ctr_tc64 = a[31]^b[31];

//instantiating the 2's complement module (input)
twos_comp_32bit t1(a,t32bit_out1,a[31]);
twos_comp_32bit t2(b,t32bit_out2,b[31]);

//instantiating unsigned vedic multiplier
vedic_mult_32bit v1(t32bit_out1,t32bit_out2,v1_out);

//instantiating the 2's complement module (output)
twos_comp_64bit t3(v1_out,out,ctr_tc64);


endmodule
