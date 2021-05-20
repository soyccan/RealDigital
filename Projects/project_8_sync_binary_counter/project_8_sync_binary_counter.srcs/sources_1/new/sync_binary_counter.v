`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 01:06:52 PM
// Design Name: 
// Module Name: sync_binary_counter
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


module sync_binary_counter(

    input clk,rst,
    output [3:0]led

    );
    
    //28 bit counter
    reg [27:0] counterout;
    
always@ (posedge(clk), posedge(rst))
 begin
     if (rst) counterout <= 0;
     else counterout <= counterout + 1;
end

//4 bit counter
    reg [3:0] counterout_4;
    
always@ (posedge(counterout[27]), posedge(rst))
 begin
     if (rst) counterout_4 <= 0;
     else counterout_4 <= counterout_4 + 1;
end

assign led = counterout_4;

    
endmodule
