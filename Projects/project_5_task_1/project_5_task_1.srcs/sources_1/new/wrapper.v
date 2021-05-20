`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 12:24:47 PM
// Design Name: 
// Module Name: wrapper
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


module wrapper(

input [7:0]sw,
input clk,
output [7:0]led,
output RED

    );
    
    wire sdata;
    wire [2:0]G;
    
    mux input_mux(
    
    .data(sw),
    .sel(G),
    .Y(sdata)
    
    );
    
    demux output_mux(
    
   .I(G),
   .EN(sdata),
   .Y(led)
    
    );
    
    counter clock(
    
    .clk(clk),
    .B(G)
    
    );
    
    assign sdata = RED;
    
endmodule
