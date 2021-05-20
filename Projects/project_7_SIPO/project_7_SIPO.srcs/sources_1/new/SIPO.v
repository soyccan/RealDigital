`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2021 12:06:43 PM
// Design Name: 
// Module Name: SIPO
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


module SIPO(

input [7:0]sw,
input btn,
output [7:0]led

    );
    
   reg [7:0] DOUT;

always@ (posedge(btn))
begin
   if (btn == 1)   DOUT <= 0;
   else
       DOUT <= { sw[6:0], 1'b0 };
end
    
    
endmodule
