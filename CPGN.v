module CPGN(
    input [3:0] G,
    input [3:0] P,
    output [4:0] C
);

assign C[0] = 0;
assign C[1] = G[0];
assign C[2] = G[1] | P[1]&G[0];
assign C[3] = G[2] | P[2]&G[1] | P[2]&P[1]&G[0];
assign C[4] = G[3] | P[3]&G[2] | P[3]&P[2]&G[1] | P[3]&P[2]&P[1]&G[0];

endmodule
