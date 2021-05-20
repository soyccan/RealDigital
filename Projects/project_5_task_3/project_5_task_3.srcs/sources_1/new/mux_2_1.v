`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2021 11:07:49 AM
// Design Name: 
// Module Name: mux_2_1
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


module mux_2_1(

input [3:0]sw1,
input [3:0]sw2,
input sel,
output reg[3:0]Y

    );
    
    always@(sw1,sw2,sel)
        begin
            if(sel == 0)
                begin
                
                    Y <= sw1;
                
                end
            else
                begin
                
                    Y <= sw2;
                
                end  
        end
    
endmodule
