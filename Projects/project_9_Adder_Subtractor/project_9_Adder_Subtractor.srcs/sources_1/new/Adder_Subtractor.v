`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 06:17:37 PM
// Design Name: 
// Module Name: Adder_Subtractor
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


module Adder_Subtractor(

    input [7:0] A_in,
    input [7:0] B_in,
    input sub,
    output [7:0] S_out,
    output overflow,
    output neg

    );
    
//////// Reg & Wire Declaration ////////
wire [7:0] A, B;
wire [8:0]S;       

//////// Combinational Logic ////////
assign A = A_in;
assign B = sub ? B_in : ~B_in + 1;

//signed extension
assign S = {A[7], A} + {B[7], B}; 

//detect overflow
assign overflow = S[8] ^ S[7];

//negetive sign
assign neg = S[7];

assign S_out = S[7:0];

endmodule
