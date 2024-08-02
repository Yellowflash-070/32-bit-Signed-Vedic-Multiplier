`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2024 19:00:53
// Design Name: 
// Module Name: twos_comp_64bit
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


module twos_comp_64bit(in,out,en);

//variable declaration for 32bit twos complement calculator
input en;
input [63:0]in;
output reg [63:0]out;

reg [63:0]comp;
integer i;

//logic block 
//when en == 1 -- out = 2's comp of inp
//when en == 0 -- out = inp 
always @(in,en)
    begin
        if(en)
            begin
                for(i = 0; i<64 ; i = i+1)
                    comp[i] = !in[i];
                
                out = comp + 1;    
            end
        else
        out = in;
        
    end
        
endmodule