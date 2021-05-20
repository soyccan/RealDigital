`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2021 12:43:59 PM
// Design Name: 
// Module Name: Wrapper_Displaying_Digits
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


module Wrapper_Displaying_Digits(

input clk, rst,
input [3:0] BCD0,
input [3:0] BCD1,
input [3:0] BCD2,
input [3:0] BCD3,
output [6:0] C,
output [3:0] A

    );
    
    wire [3:0]MUX;
    digit_displaying CUT1(
    
    .sw(MUX),
    .C(C)
    
    );
    
    wire [1:0]counter;
    decoder_2_4 CUT2(
    
    .I(counter),
    .Y(A)
    
    );
    
    wire DISP_CLK;  
    clock_divider CUT3(
    
    .clk(clk),
    .rst(rst),
    .led(DISP_CLK)
    
    );
    
    counter CUT4(
    
    .clk(DISP_CLK),
    .rst(rst),
    .count_out(counter)
    
    );
    
    mux_4_1 CUT5(
    
    .data1(BCD0),
    .data2(BCD1),
    .data3(BCD2),
    .data4(BCD3),
    .Y(MUX),
    .sel(counter)
    
    );
    
    
endmodule
