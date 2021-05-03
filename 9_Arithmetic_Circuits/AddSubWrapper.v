module AddSubWrapper(
    input clk,
    input [7:0] sw,
    input [2:0] btn,
    output [3:0] seg_an,
    output [7:0] seg_cat,
    output [1:0] led
);

//// Regs & Wires ////
reg [7:0] op1, op2;
wire [7:0] S;

//// Submodule Instantiation ////
AddSub addsub(
    // input
    .A_in(op1),
    .B_in(op2),
    .sub(btn[2]),

    // output
    .S_out(S),
    .overflow(led[0]),
    .neg(led[1])
);

//// Combination Logic ////

//// Sequential Logic ////
always @ (posedge(clk)) begin
    if (btn[0]) op1 <= sw;
    if (btn[1]) op2 <= sw;
end

always @(posedge clk) begin
    case (S)
        4'b0000: seg_cat <=
    endcase
end

endmodule
