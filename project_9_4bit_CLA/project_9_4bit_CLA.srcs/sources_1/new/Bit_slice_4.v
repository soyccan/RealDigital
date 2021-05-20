`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 05:16:24 PM
// Design Name: 
// Module Name: Bit_slice_4
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


module Bit_slice_1(

    input A,
    input B,
    input Cin,
    output P,
    output G,
    output S

    );
    
    // Carry propagated
    assign P = (A ^ B) & Cin;

    // Carry generated
    assign G = A & B;
    
    assign S = A ^ B ^ Cin;
    
endmodule
