// 8-bit adder-subtractor
module AddSub(
    input [7:0] A_in,
    input [7:0] B_in,
    input sub,
    output [7:0] S,
    output overflow,
    output neg
);

//////// Parameter ////////

//////// Reg & Wire Declaration ////////
wire [7:0] A, B;
wire c;

//////// Submodule Instantiation ////////
CLA_4bit adder0(
    .A(A[3:0]),
    .B(B[3:0]),
    .S(S[3:0]),
    .Cin(1'b0),
    .Cout(c),
    .overflow(overflow)
);

CLA_4bit adder1(
    .A(A[7:4]),
    .B(B[7:4]),
    .S(S[7:4]),
    .Cin(c),
    .Cout(),
    .overflow(overflow)
);

//////// Finite-State Machine ////////

//////// Combinational Logic ////////
assign A = A_in;
assign B = sub ? B_in : ~B_in + 1;

//////// Sequential Logic ////////

endmodule

