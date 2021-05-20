`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 03:58:14 PM
// Design Name: 
// Module Name: Task_1_sim
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

module Task_1_sim;

// inputs
reg [7:0] data0;
reg [7:0] data1;
reg [7:0] data2;
reg [7:0] data3;
reg [7:0] data4;
reg [7:0] data5;
reg [7:0] data6;
reg [7:0] data7;
reg [2:0] sel;

// outputs
wire [7:0]Y;

// connect test signals to our mux
Task_1 CUT (

    //test bench    //CUT
    .data0(data0),
    .data1(data1),
    .data2(data2),
    .data3(data3),
    .data4(data4),
    .data5(data5),
    .data6(data6),
    .data7(data7),
    .sel(sel),
    .Y(Y)
);

integer k;
initial begin

sel = 3'b000;
data0 = 8'd170;
#10;

sel = 3'b001;
data1 = 8'd200;
#10;

sel = 3'b010;
data2 = 8'd150;
#10;

sel = 3'b011;
data3 = 8'd50;
#10;

sel = 3'b100;
data4 = 8'd230;
#10;

end





endmodule
