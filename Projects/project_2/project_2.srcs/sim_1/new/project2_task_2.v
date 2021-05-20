`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2021 11:51:13 AM
// Design Name: 
// Module Name: project2_task_2
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


module project2_task_2(

input sw[7:0],
output led[2:0]
    );
    
    //SOP version
    assign led[0] = (sw[0]&~sw[1])|(~sw[0]&sw[1]);
    assign led[1] = (~sw[1]&~sw[2]&~sw[3])|(sw[1]&sw[2]&~sw[3])|(sw[1]&~sw[2]&sw[3]);
    assign led[2] = (sw[4]&~sw[5]&~sw[6]&~sw[7])|(sw[4]&sw[5]&~sw[6]&~sw[7])|(~sw[4]&~sw[5]&sw[6]&~sw[7])|(sw[4]&sw[5]&sw[6]&sw[7]);
    
    
    
    
endmodule
