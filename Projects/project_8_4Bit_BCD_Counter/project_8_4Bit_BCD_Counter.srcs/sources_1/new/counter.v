`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/28/2021 12:30:45 PM
// Design Name: 
// Module Name: counter
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


module counter(

input clk, rst,
output reg [1:0] count_out 

    );
    
       
 always @ (posedge(clk), posedge(rst))
 begin
     if (rst) count_out <= 0;
     else count_out <= count_out + 1;
end
    
endmodule
