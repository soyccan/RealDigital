`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 08:26:13 PM
// Design Name: 
// Module Name: digit_display_4bit
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


module digit_display_4bit(

    input clk,
    input [15:0] bcd,
    //input [13:0] num,
    output [6:0] seg_cat,
    output reg [3:0] seg_an

    );
    
integer i;

reg [27:0] counter;
wire [1:0] cur_dig;
reg [3:0] cur_bcd;
wire [15:0] bcd;
reg [6:0]seg_cat_inv;

//Bin2Bcd CUT(
//    .bin(num),
//    .bcd(bcd)
//);

assign cur_dig = counter[17:16];
assign seg_cat = ~seg_cat_inv;

always @* begin
    case (cur_dig)
        2'b00: cur_bcd = bcd[3:0];
        2'b01: cur_bcd = bcd[7:4];
        default: cur_bcd <= 4'b1111; // turn off all digits
    endcase
end

always @(cur_dig) begin
  case (cur_dig)
  2'b00:  seg_an <= 4'b1110;
  2'b01:  seg_an <= 4'b1101;
  //2'b10:  seg_an <= 4'b1011;
  //2'b11:  seg_an <= 4'b0111;
  default:  seg_an <= 4'b1111; // turn off all digits
  endcase
end

always @(posedge clk) begin
	counter <= counter + 1;
end

always @(posedge clk) begin
    case (cur_bcd)
        4'b0000: seg_cat_inv <= 7'b0111111; //0
        4'b0001: seg_cat_inv <= 7'b0000110; //1
        4'b0010: seg_cat_inv <= 7'b1011011; //2
        4'b0011: seg_cat_inv <= 7'b1001111; //3
        4'b0100: seg_cat_inv <= 7'b1100110; //4
        4'b0101: seg_cat_inv <= 7'b1101101; //5
        4'b0110: seg_cat_inv <= 7'b1111101; //6
        4'b0111: seg_cat_inv <= 7'b0100111; //7
        4'b1000: seg_cat_inv <= 7'b1111111; //8
        4'b1001: seg_cat_inv <= 7'b1100111; //9
        default: seg_cat_inv <= 7'b1000000; //-
    endcase
end
    
endmodule
