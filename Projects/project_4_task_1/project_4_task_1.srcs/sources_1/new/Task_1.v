`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 03:57:33 PM
// Design Name: 
// Module Name: Task_1
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


module Task_1(

   input [7:0] data0,
   input [7:0] data1,
   input [7:0] data2,
   input [7:0] data3,
   input [7:0] data4,
   input [7:0] data5,
   input [7:0] data6,
   input [7:0] data7,
   input [2:0] sel,
   output [7:0] Y

    );
    
// we can only assign values to registers 
// inside an always block
reg [7:0]tmp;

always @(sel) begin
    case (sel)
    3'b000:   tmp <= data0;
    3'b001:   tmp <= data1;
    3'b010:   tmp <= data2;
    3'b100:   tmp <= data3;
    3'b101:   tmp <= data4;
    3'b110:   tmp <= data5;
    3'b111:   tmp <= data6;
    3'b011:   tmp <= data7;
    default: tmp <= 1'b0;
    endcase
end
assign Y = tmp;
    
endmodule
