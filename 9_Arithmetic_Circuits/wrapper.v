module wrapper(
    input clk,
    input [7:0] sw,
    output reg [6:0] seg_C,
    output [1:0] seg_A
);

// wires
wire [7:0] A, B;
reg [7:0] S;

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

// Convert S to seg_C and seg_A
always @(posedge clk) begin
    case (S[3:0])
        4'b0000: seg_C <= 7'b0000100;
        4'b0000:
    endcase
end

endmodule
