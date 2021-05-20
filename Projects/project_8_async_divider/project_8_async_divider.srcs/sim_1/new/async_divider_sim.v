`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2021 12:52:16 PM
// Design Name: 
// Module Name: async_divider_sim
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
`timescale 1ns / 1ps

module async_divider_sim;

// Inputs
    reg clk;
    reg rst;

    // Outputs
    wire led;

    // Instantiate the Unit Under Test (UUT)
    async_divider uut (
        .clk(clk),
        .rst(rst),
        .led(led)
    );

    always
        #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;

        #10 rst = 0;

        // Wait 100 ns for global reset to finish
        #100;

    end

endmodule
