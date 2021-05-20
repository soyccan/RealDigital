`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 05:23:34 PM
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

input clk,
input [7:0] sw,
output [6:0] seg_C,
output [3:0] seg_A

);
    
wire [7:0] A, B;
wire [7:0] S; 
 
assign A = sw[3:0];
assign B = sw[7:4];

CLA_4Bit CUT(

//input
.A(A),
.B(B),
.Cin(1'b0),

//output
.S(S)

);

digit_display_4bit CUT2(

.clk(clk),
.bcd(S),
.seg_an(seg_A),
.seg_cat(seg_C)

);
 
endmodule
