`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 12:41:49 PM
// Design Name: 
// Module Name: project2_Task2
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


module project2_Task2(

input [7:0] sw,
output [3:0] led

    );
//Task 1
//SOP version
//assign led[0] = (sw[0] & ~sw[1]) | (~sw[0] & sw[1]);
//assign led[1] = (~sw[1] & ~sw[2] & ~sw[3])|(sw[1] & sw[2] & ~sw[3])|(sw[1] & ~sw[2] & sw[3]);
//assign led[2] = (sw[4] & ~sw[5] & ~sw[6] & ~sw[7])|(sw[4] & sw[5]& ~sw[6] & ~sw[7])|(~sw[4] & ~sw[5] & sw[6] & ~sw[7])|(sw[4] & sw[5] & sw[6] & sw[7]);

//Task 2
//POS version
//assign led[0] = (sw[0] | sw[1]) & (~sw[0] & ~sw[1]);
//assign led[1] = (~sw[1] | sw[2] | sw[3]) & (sw[1] | sw[2] & ~sw[3]) & (sw[1] | ~sw[2] | ~sw[3]) & (~sw[1] | ~sw[2] | ~sw[3]);
//assign led[2] = (sw[4] & ~sw[5] & ~sw[6] & ~sw[7])|(sw[4] & sw[5]& ~sw[6] & ~sw[7])|(~sw[4] & ~sw[5] & sw[6] & ~sw[7])|(sw[4] & sw[5] & sw[6] & sw[7]);

//Task 3
//POS
assign led[3] = (sw[3]|sw[4]|sw[5]|sw[6]) & (sw[3]|sw[4]|sw[5]|~sw[6]) & (sw[3]|~sw[4]|sw[5]|sw[6]) & 
                (sw[3]|~sw[4]|sw[5]|~sw[6]) & (~sw[3]|sw[4]|~sw[5]|sw[6]) & (~sw[3]|sw[4]|~sw[5]|~sw[6]) & 
                (~sw[3]|~sw[4]|~sw[5]|sw[6]) & (~sw[3]|~sw[4]|~sw[5]|~sw[6]);
    
    
endmodule
