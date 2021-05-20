`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 05:16:39 PM
// Design Name: 
// Module Name: CPGN
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


module CPGN(

    input [3:0] G,
    input [3:0] P,
    input Cin,
    output [4:0] C

    );
    
assign C[0] = Cin;
assign C[1] = G[0] | P[0]&C[0];
assign C[2] = G[1] | P[1]&G[0] | P[1]&P[0]&C[0];
assign C[3] = G[2] | P[2]&G[1] | P[2]&P[1]&G[0] | P[2]&P[1]&P[0]&C[0];
assign C[4] = G[3] | P[3]&G[2] | P[3]&P[2]&G[1] | P[3]&P[2]&P[1]&G[0] | P[3]&P[2]&P[1]&P[0]&C[0];
    
endmodule
