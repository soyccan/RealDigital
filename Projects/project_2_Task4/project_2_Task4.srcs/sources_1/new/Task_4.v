`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2021 01:18:16 PM
// Design Name: 
// Module Name: Task_4
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


module Task_4(

input[3:0] sw,
output[1:0] RGB
    );
    //Task4_1
    assign RGB[0] = ((~sw[3]&~sw[2]&sw[1]&~sw[0])|(~sw[3]&~sw[2]&~sw[1]&sw[0])|(~sw[3]&sw[2]&~sw[1]&~sw[0])|(sw[3]&~sw[2]&~sw[1]&sw[0])) | 
                    (~sw[3]&~sw[2]&sw[1]&sw[0])|(sw[3]&sw[2]&~sw[1]&~sw[0])|(~sw[3]&sw[2]&~sw[1]&sw[0])|(sw[3]&~sw[2]&sw[1]&sw[0]) ;
    assign RGB[1] = (~sw[3]&~sw[2]&sw[1]&~sw[0])|(~sw[3]&~sw[2]&~sw[1]&sw[0])|(~sw[3]&sw[2]&~sw[1]&~sw[0])|(sw[3]&~sw[2]&~sw[1]&sw[0]) ;
    
    //Task4_2
//    assign RGB[0] = (sw[1]&sw[0])|(sw[3]&sw[2])|(sw[2]&sw[0])|(sw[3]&~sw[2]&sw[1]&sw[0]);
    
endmodule
