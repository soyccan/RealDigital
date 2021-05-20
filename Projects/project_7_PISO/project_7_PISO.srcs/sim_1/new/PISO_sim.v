`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2021 12:25:30 PM
// Design Name: 
// Module Name: PISO_sim
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


module PISO_sim;

reg [7:0]D;
reg [1:0]btn; 
reg clk;
wire [7:0]led;
wire [7:0]RGB;

PISO CUT(

.D(D),
.btn(btn),
.clk(clk),
.led(led),
.RGB(RGB)

); 
always #5 clk = ~clk;

initial
    begin
         
        D = 0;
        btn = 0;
        clk = 0;
        #100;
        
        btn[0] = 1;
        btn[1] = 0;
        
        #100;
        btn[0] = 0;
        btn[0] = 1;
        
        D = 4;
        #100;
    
    end
endmodule
