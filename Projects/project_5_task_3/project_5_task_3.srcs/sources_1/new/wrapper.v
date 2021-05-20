`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2021 11:19:03 AM
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
input sel,
output [6:0]C,
output [3:0]A

    );
    
    wire [3:0] Y;
    //mux
    mux_2_1 input_mux(
    
    .sw1(sw[3:0]),
    .sw2(sw[7:4]),
    .sel(sel),
    .Y(Y)
    
    );
    
    //demux
    digit_display output_demux(
    
    .sw(Y),
    .C(C)
    
    );
    
    //button
    assign A[0] = ~sel;
    assign A[1] = sel;
    assign A[2] = 1;
    assign A[3] = 1;
    
endmodule
