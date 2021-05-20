`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2021 12:58:20 PM
// Design Name: 
// Module Name: BCD_Counter_4_bit
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


module BCD_Counter_4_bit(

input clk, rst,
output reg [3:0] count_out_1,
output reg [3:0] count_out_2,
output reg [3:0] count_out_3,
output reg [3:0] count_out_4

    );
    
    always @ (posedge(clk), posedge(rst))
    begin
    
        if (rst) count_out_1 <= 0;
        else if (count_out_1 == 4'b1001) count_out_1 <= 0;
        else count_out_1 <= count_out_1 + 1;
    end
    
    always @ (posedge(clk), posedge(rst))
    begin
        if (rst) count_out_2 <= 0;
        else if (count_out_2 == 4'b1001) count_out_2 <= 0;
        else if (count_out_1 == 4'b1001) count_out_2 <= count_out_2 + 1;
        else count_out_2 <= count_out_2;
    end
        
    always @ (posedge(clk), posedge(rst))
    begin
        if (rst) count_out_3 <= 0;
        else if (count_out_3 == 4'b1001) count_out_3 <= 0;
        else if (count_out_2 == 4'b1001) count_out_3 <= count_out_3 + 1;
        else count_out_3 <= count_out_3;
    end
        
    always @ (posedge(clk), posedge(rst))
    begin
        if (rst) count_out_4 <= 0;
        else if (count_out_4 == 4'b1001) count_out_4 <= 0;
        else if (count_out_3 == 4'b1001) count_out_4 <= count_out_4 + 1;
        else count_out_4 <= count_out_4;
    end
 
    
endmodule
