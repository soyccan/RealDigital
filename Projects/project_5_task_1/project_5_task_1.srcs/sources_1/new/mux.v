`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2021 09:59:25 AM
// Design Name: 
// Module Name: mux
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


module mux(

   input [7:0] data,
   input [2:0] sel,
   output Y

    );
    
// we can only assign values to registers 
// inside an always block
reg [7:0]tmp;

always @(sel) begin
    case (sel)
    3'b000:   tmp <= data[0];
    3'b001:   tmp <= data[1];
    3'b010:   tmp <= data[2];
    3'b100:   tmp <= data[3];
    3'b101:   tmp <= data[4];
    3'b110:   tmp <= data[5];
    3'b111:   tmp <= data[6];
    3'b011:   tmp <= data[7];
    default: tmp <= 1'b0;
    endcase
end
assign Y = tmp;
    
endmodule
