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
wire [15:0] S_bcd;

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

Bin2Bcd CUT1(
    // input
    .bin(S),

    //output
    .bcd(S_bcd)
);

digit_display CUT2(
    .clk(clk),
    .bcd(S_bcd),
    .seg_cat(seg_cat),
    .seg_an(seg_an)
);

//// Combination Logic ////

//// Sequential Logic ////
always @ (posedge(clk)) begin
    if (btn[0]) op1 <= sw;
    if (btn[1]) op2 <= sw;
end


endmodule
