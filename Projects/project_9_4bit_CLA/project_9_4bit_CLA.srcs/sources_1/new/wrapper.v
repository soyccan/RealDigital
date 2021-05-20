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
    output reg [6:0] seg_C,
    output [1:0] seg_A
   
    );
    
wire [7:0] A, B;
reg [7:0] S; 
 
assign A = sw[3:0];
assign B = sw[7:4];

CLA_4Bit CUT(

//input
.A(A),
.B(B),
.Cin(1'b0),

//output
.S(S),
.Cout()

);

 always@(posedge clk)
 begin
    case(S[3:0])
            4'b0000:    seg_C <= 7'b0111111; //0
            4'b0001:    seg_C <= 7'b0000110; //1
            4'b0010:    seg_C <= 7'b1011011; //2
            4'b0011:    seg_C <= 7'b1001111; //3
            4'b0100:    seg_C <= 7'b1100110; //4
            4'b0101:    seg_C <= 7'b1101101; //5
            4'b0110:    seg_C <= 7'b1111101; //6
            4'b0111:    seg_C <= 7'b0100111; //7
            4'b1000:    seg_C <= 7'b1111111; //8
            4'b1001:    seg_C <= 7'b1100111; //9
    endcase
 end
 
endmodule
