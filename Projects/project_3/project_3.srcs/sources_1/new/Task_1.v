`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2021 12:24:33 PM
// Design Name: 
// Module Name: Task_1
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


module Task_1(

input [4:0]sw,
output led

    );
   
   assign led = (~sw[0] & ~sw[1] & ~sw[2] & ~sw[3] & sw[4])|
                (~sw[0] & ~sw[1] & ~sw[2] & sw[3] & ~sw[4])|
                (~sw[0] & ~sw[1] & sw[2] & ~sw[3] & ~sw[4])|
                (~sw[0] & ~sw[1] & sw[2] & sw[3] & sw[4])|
                (~sw[0] & sw[1] & ~sw[2] & ~sw[3] & ~sw[4])|
                (~sw[0] & sw[1] & ~sw[2] & sw[3] & sw[4])|
                (~sw[0] & sw[1] & sw[2] & ~sw[3] & sw[4])|
                (~sw[0] & sw[1] & sw[2] & sw[3] & ~sw[4])|
                (sw[0] & ~sw[1] & ~sw[2] & ~sw[3] & ~sw[4])|
                (sw[0] & ~sw[1] & ~sw[2] & sw[3] & sw[4])|
                (sw[0] & ~sw[1] & sw[2] & ~sw[3] & sw[4])|
                (sw[0] & ~sw[1] & sw[2] & sw[3] & ~sw[4])|
                (sw[0] & sw[1] & ~sw[2] & ~sw[3] & sw[4])|
                (sw[0] & sw[1] & ~sw[2] & sw[3] & ~sw[4])|
                (sw[0] & sw[1] & sw[2] & ~sw[3] & ~sw[4])|
                (sw[0] & sw[1] & sw[2] & sw[3] & sw[4]);
    
endmodule
