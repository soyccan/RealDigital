`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 12:44:18 PM
// Design Name: 
// Module Name: mux_4_1
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


module mux_4_1(

input [3:0] data1,
input [3:0] data2,
input [3:0] data3,
input [3:0] data4,
input [1:0] sel,
output [3:0] Y

    );
    
    reg [3:0] tmp;

always @(data1, data2, data3, data4, sel) begin
    case (sel)
    2'b00:   tmp <= data1;
    2'b01:   tmp <= data2;
    2'b10:   tmp <= data3;
    2'b11:   tmp <= data4;
    default: tmp <= 4'b0000;
    endcase
end
assign Y = tmp;
    
endmodule
