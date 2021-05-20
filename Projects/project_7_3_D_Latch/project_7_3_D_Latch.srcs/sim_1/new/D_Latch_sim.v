`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2021 12:54:56 PM
// Design Name: 
// Module Name: D_Latch_sim
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


module D_Latch_sim;

reg D,G;
wire Q, Qn;

D_Latch CUT(

.D(D),
.G(G),
.Q(Q),
.Qn(Qn)

);

initial begin
    // Initialize Inputs
    D = 0;
    G = 0;

    // Add stimulus here
    #1 D = 0;
       G = 1;
    #1 D = 1;
       G = 0; 
    #100 D = 1;
         G = 1;
    #1 D = 0;
       G = 1;      
    #1 D = 1;
    #1 G = 0;
    #1 ;
    G = 1;
end

endmodule
