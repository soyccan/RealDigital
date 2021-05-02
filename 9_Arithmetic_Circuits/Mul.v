module Mul(
    input clk,
    input [7:0] sw,
    input [2:0] btn,
    output [7:0] seg
);

//////// Parameter ////////

//////// Reg & Wire Declaration ////////
reg [7:0] op1, op2;
wire [15:0] res;

//////// Submodule Instantiation ////////

//////// Finite-State Machine ////////

//////// Combinational Logic ////////
assign res = op1 * op2;

//////// Sequential Logic ////////
always @ (posedge(clk)) begin
    if (btn[0]) op1 <= sw;
    if (btn[1]) op2 <= sw;
end

endmodule
