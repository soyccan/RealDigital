`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 12:52:40 PM
// Design Name: 
// Module Name: simulate
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

module simulate;

// inputs
reg [3:0] data;
reg [1:0] sel;

// outputs
wire Y;

// connect test signals to our mux
mux_4_1 CUT (
    .data(data),
    .sel(sel),
    .Y(Y)
);

integer k;
initial begin

//initialize
data = 0;
sel = 0;
    
    sel = 2'b00;
    data[0] = 1;
    #20;
    
    sel = 2'b01;
    data[1] = 0;
    #20;
    
    sel = 2'b10;
    data[2] = 1;
    #20;
    
    sel = 2'b11;
    data[3] = 0;
    #20;
    
    $finish;
end

endmodule
