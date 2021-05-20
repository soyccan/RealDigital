`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2021 12:45:27 PM
// Design Name: 
// Module Name: PIPO
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


module PIPO(

input [7:0]D, 
input clk, sel, rst,
output reg [7:0]led

    );
    
    reg [7:0]Q;
    
    //register
    always@(posedge(clk), posedge(rst))
        begin
            if(rst == 1)
                begin
                    Q <= 8'b00000000;
                end
            else
                begin
                    Q <= D;
                end
    end
    
    //mux
    always@(D,Q,sel)
        begin
            if(sel == 1)
                begin
                    led <= Q;
                end
            else
                begin
                    led <= D;
                end
    end
    
    
       
endmodule
