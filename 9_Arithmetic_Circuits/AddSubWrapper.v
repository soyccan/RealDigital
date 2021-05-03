module AddSubWrapper;

//// Regs & Wires ////
wire clk;
wire [7:0] sw;
wire [2:0] btn;
wire [1:0] led;
reg [3:0] seg_an;
reg [7:0] seg_cat;

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
