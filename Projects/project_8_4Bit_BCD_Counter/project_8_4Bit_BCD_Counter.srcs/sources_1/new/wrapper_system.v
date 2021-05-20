`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2021 12:43:10 PM
// Design Name: 
// Module Name: wrapper_system
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


module wrapper_system(

input clk, rst,
output [6:0] C,
output [3:0] A

    );
    
    wire clk1;
    clock_divider2 CUT3(
    
    .clk(clk),
    .rst(rst),
    .led(clk1)
     );
    
    wire bridge1, bridge2, bridge3, bridge4;
    BCD_Counter_4_bit CUT1(
    
    .clk(clk),
    .rst(rst),
    .count_out_1(bridge1),
    .count_out_2(bridge2),
    .count_out_3(bridge3),
    .count_out_4(bridge4)
   
    );
    
    Wrapper_Displaying_Digits CUT2(
    
    .clk(clk1),
    .rst(rst),
    .BCD0(bridge1),
    .BCD1(bridge2),
    .BCD2(bridge3),
    .BCD3(bridge4),
    .C(C),
    .A(A)
    
    );   
    
endmodule
