`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 12:20:42 PM
// Design Name: 
// Module Name: sr_latch_NOR
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


module sr_latch_NOR(

input R,
input S,
output Q,
output Qn

    );
    
    wire Q_int, Qn_int;

assign #1 Q_int = ~(S | Q_int);
assign #1 Qn_int = ~(R | Qn_int);
assign Q = Q_int;
assign Qn = Qn_int;
    
endmodule
