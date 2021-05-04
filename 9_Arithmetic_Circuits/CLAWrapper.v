module CLAWrapper(
    input clk,
    input [7:0] sw,
    output [6:0] seg_C,
    output [1:0] seg_A
);

// wires
wire [7:0] A, B;
wire [7:0] S;

// wire: assign
// reg: always

// Obtain A,B from switch
assign A = sw[3:0];
assign B = sw[7:4];

// Submodule
CLA_4bit cla(
    // input
    .A(A),
    .B(B),
    .Cin(1'b0),

    // output
    .S(S),
    .Cout()
);

Display4Digit disp(
    .clk(clk),
    .num(S),
    .seg_an(seg_A),
    .seg_cat(seg_C)
);


endmodule
