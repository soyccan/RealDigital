`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2021 12:45:57 PM
// Design Name: 
// Module Name: simulation
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


module simulation;

reg clk, rst;
wire [3:0] count_out_1;
wire [3:0] count_out_2;
wire [3:0] count_out_3;
wire [3:0] count_out_4;

BCD_Counter_4_bit CUT(

.clk(clk),
.rst(rst),
.count_out_1(count_out_1),
.count_out_2(count_out_2),
.count_out_3(count_out_3),
.count_out_4(count_out_4)

);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    #100
    rst = 0;
    
  
end

endmodule
