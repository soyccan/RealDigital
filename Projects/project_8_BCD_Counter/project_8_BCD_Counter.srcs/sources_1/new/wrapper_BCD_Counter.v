`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2021 12:07:58 PM
// Design Name: 
// Module Name: wrapper_BCD_Counter
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


module wrapper_BCD_Counter(

input clk, btn,
output [6:0]C,
output [3:0]A

    );
    
    wire [3:0]count_out;
    
    digit_displaying CUT(
    
    .sw(count_out),
    .C(C),
    .A(A)
    
    );
    
    wire clk_div;
    
    clock_divider CUT2(
    
    .clk(clk),
    .led(clk_div),
    .rst(btn)
    
    );
    
    BCD_Counter CUT3(
    
    .clk(clk_div),
    .count_out(count_out),
    .rst(btn)
    
    );
    
endmodule
