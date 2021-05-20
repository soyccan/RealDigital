`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 08:41:19 AM
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(

input [3:0] I,
	input Ein,
	output reg [1:0] Y,
	output reg Gs, 
	output reg Eout

    );
    
    always @ (I, Ein)
begin
    if(Ein == 1) begin
        if (I[3] == 1)
            Y <= 2'd3;
        else if (I[2] == 1)
            Y <= 2'd2;
        else if (I[1] == 1)
            Y <= 2'd1;
        else
            Y <= 2'd0;
    end
    else
        Y = 2'd0;
end

always @ (I, Ein)
begin
    if (Ein == 1 && I == 0)
        Eout <= 1'b1;
    else
        Eout <= 1'b0;
end

always @ (I, Ein)
begin
    if (Ein == 1 && I != 0)
        Gs <= 1'b1;
    else
        Gs <= 1'b0;
end
    
endmodule
