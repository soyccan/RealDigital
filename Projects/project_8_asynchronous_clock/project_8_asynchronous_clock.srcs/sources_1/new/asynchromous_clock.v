`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 08:25:38 AM
// Design Name: 
// Module Name: asynchromous_clock
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


module asynchromous_clock(

input clk, rst,
output reg [3:0] acount

    );
    
    always @ (posedge(clk), posedge(rst))
begin
   if (rst) acount[0] <= 0;
   else acount[0] <= !acount[0];
end
    
always @ (posedge(acount[0]), posedge(rst))
begin
   if (rst) acount[1] <= 0;
   else acount[1] <= !acount[1];
end
       
always @ (posedge(acount[1]), posedge(rst))
begin
   if (rst) acount[2] <= 0;
   else acount[2] <= !acount[2];
end
    
always @ (posedge(acount[2]), posedge(rst))
begin
   if (rst) acount[3] <= 0;
   else acount[3] <= !acount[3];
end
    
endmodule
