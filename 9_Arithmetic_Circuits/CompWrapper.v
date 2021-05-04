module CompWrapper(
    input clk,
    input [8:0] sw,
    input [2:0] btn,
    output [2:0] led
);

//////// Parameter ////////

//////// Reg & Wire Declaration ////////
reg [7:0] op1, op2;
reg [15:0] res;
wire [15:0] res_nxt;

//////// Submodule Instantiation ////////

//////// Finite-State Machine ////////

//////// Combinational Logic ////////
assign res_nxt = op1 * op2;

assign led[0] = res < res_nxt;
assign led[1] = res == res_nxt;
assign led[2] = res > res_nxt;

//////// Sequential Logic ////////
always @(posedge clk) begin
<<<<<<< Updated upstream
    state <= sw[8];
end

always @(posedge clk) begin
    if (sw[8] != state)
        res <= res_nxt;
end

always @(posedge clk) begin
    if (btn[0]) op1 <= sw;
    if (btn[1]) op2 <= sw;
end

endmodule

