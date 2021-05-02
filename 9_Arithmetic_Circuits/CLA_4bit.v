// 4-bit Carry Lookahead Adder
module CLA_4bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout,
    output overflow
);

wire [3:0] P;
wire [3:0] G;
wire [4:0] C;

BitSlice b3(
    .A(A[3]),
    .B(B[3]),
    .P(P[3]),
    .G(G[3])
);

BitSlice b2(
    .A(A[2]),
    .B(B[2]),
    .P(P[2]),
    .G(G[2])
);

BitSlice b1(
    .A(A[1]),
    .B(B[1]),
    .P(P[1]),
    .G(G[1])
);

BitSlice b0(
    .A(A[0]),
    .B(B[0]),
    .P(P[0]),
    .G(G[0])
);

CPGN cpgn(
    .P(P),
    .G(G),
    .Cin(Cin),
    .C(C)
);

assign Cout = C[4];
assign overflow = C[4] ^ C[3];

assign S[3] = P[3] ^ C[3];
assign S[2] = P[2] ^ C[2];
assign S[1] = P[1] ^ C[1];
assign S[0] = P[0] ^ C[0];

endmodule

