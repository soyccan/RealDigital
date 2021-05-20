`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 08:46:30 AM
// Design Name: 
// Module Name: encoder_sim
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


module encoder_sim;

//inputs
reg [3:0] I;
    reg Ein;
    wire [1:0] Y;
    wire Gs;
    wire Eout;
    
    priority_encoder CUT(
    
    .I(I),
    .Ein(Ein),
    .Y(Y),
    .Gs(Gs),
    .Eout(Eout)
    
    );
    
    initial begin
    
    I = 4'd0;
    
    Ein = 0;
    #20;
    
    Ein = 1;
    #20;
    I = 4'b0001;
    #20;
    I = 4'b0010;
    #20;
    I = 4'b0100;
    #20;
    I = 4'b1000;
    #20;
    
    end
    
    
    
endmodule
