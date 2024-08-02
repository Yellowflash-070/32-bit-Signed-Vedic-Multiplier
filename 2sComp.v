`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2024 15:49:46
// Design Name: 
// Module Name: 2sComp
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


module twos_comp_32bit(in,out,en);

//variable declaration for 32bit twos complement calculator
input en;
input [31:0]in;
output reg [31:0]out;

reg [31:0]comp;
integer i;

//logic block 
//when en == 1 -- out = 2's comp of inp
//when en == 0 -- out = inp 
always @(in,en)
    begin
        if(en)
            begin
                for(i = 0; i<32 ; i = i+1)
                    comp[i] = !in[i];
                
                out = comp + 1;    
            end
        else
        out = in;
        
    end
        
endmodule
