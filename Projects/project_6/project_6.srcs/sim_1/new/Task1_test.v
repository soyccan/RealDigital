`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2021 12:05:29 PM
// Design Name: 
// Module Name: Task1_test
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


module Task1_test;

 reg A; //input
 reg B;
 reg C;
 wire X; //output
 
 Task_1 CUT(
 
 //linking test inputs to test bench variables
 .A(A),
 .B(B),
 .C(C),
 .X(X)
 
 ) ;
 
    //looping variable
    integer k = 0;

//start of the test
initial begin
    // Initialize Inputs
    A = 0;
    B = 0;
    C = 0;

    // Wait 100 ns for global reset to finish
    #100; //creates timing delay (ns)
    
    // Add stimulus here

    for(k = 0; k < 4; k=k+1)
    begin
        {A,C} = k;
        #5 B = 1;
        #5 B = 0;
        #5 ;
    end
end
    
endmodule
