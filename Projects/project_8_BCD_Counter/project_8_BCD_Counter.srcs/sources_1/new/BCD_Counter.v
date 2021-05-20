`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2021 10:48:27 AM
// Design Name: 
// Module Name: BCD_Counter
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


module BCD_Counter(

input clk, rst,
output reg [3:0] count_out

    );
    
    always @ (posedge(clk), posedge(rst))
    begin
        if (rst) count_out <= 0;
        else if (count_out == 4'b1001) count_out <= 0;
        else count_out <= count_out + 1;
    end
    
   
    
endmodule
