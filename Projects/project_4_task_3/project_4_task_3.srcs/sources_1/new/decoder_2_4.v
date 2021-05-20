`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 10:16:05 AM
// Design Name: 
// Module Name: decoder_2_4
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


module decoder_2_4(

input [1:0] I,
output [3:0] Y

    );
    
 reg [3:0]tmp;
    
    always @ (I)
begin
    case (I)
        2'd0:    tmp <= ~4'd1;
        2'd1:    tmp <= ~4'd2;
        2'd2:    tmp <= ~4'd4;
        2'd3:    tmp <= ~4'd8;
        default: tmp <= ~4'd0;
    endcase
end

assign Y = tmp;

endmodule
