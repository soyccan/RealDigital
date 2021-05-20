`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 06:55:42 PM
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


module wrapper;

wire clk;
wire [7:0]sw;
wire [2:0]btn;
wire [1:0]led;
reg [3:0]seg_A;
reg [7:0]seg_C;

reg [7:0]op1, op2;
wire [7:0]S;

Adder_Subtractor CUT(

.A_in(op1),
.B_in(op2),
.sub(btn[2]),
.S_out(S),
.overflow(led[0]),
.neg(led[1])

);
//// Sequential Logic ////
always @ (posedge(clk)) begin
    if (btn[0]) op1 <= sw;
    if (btn[1]) op2 <= sw;
end

always@ (posedge clk)
begin
    case(S)
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