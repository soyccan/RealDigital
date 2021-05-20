`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2021 01:05:13 PM
// Design Name: 
// Module Name: majority_of_five_tb
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

`timescale 1ns/ 1ps

module majority_of_five_tb;

// Inputs
reg [4:0] sw;
// Outputs
wire led;

// Instantiate the Circuit Under Test (CUT)
majority_of_five cut (.sw(sw),.led(led));

// Declare loop index variable
integer k;

// Apply input stimulus
initial
begin
    sw = 0;

    for (k=0; k<32; k=k+1)
        #20 sw = k;

    #20	$finish;
end
endmodule