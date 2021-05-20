module ALU(
    input clk,
    input [1:0] btn,
    input [12:0] sw,
    output [6:0] seg_cat,
    output [3:0] seg_an
);

reg [7:0] A;
reg [7:0] B;
reg [7:0] res;
wire [15:0] res_bcd;

//// Submodule Instantiation ////
Bin2Bcd CUT1(
    // input
    .bin(res),

    // output
    .bcd(res_bcd)
);

Display4Digit CUT2(
    // input
    .clk(clk),
    .bcd(res_bcd),

    // output
    .seg_cat(seg_cat),
    .seg_an(seg_an)
);

//// Combinational Logic ////
always @* begin
    case (sw[10:8]) // OpCode
        3'b000: res = A + B;
        3'b001: res = A + 1;
        3'b010: res = A - B;
        3'b011: res = A ^ B;
        3'b100: res = A | B;
        3'b101: res = A & B;
        default: res = 0;
    endcase
end

//// Sequential Logic ////
always @(posedge clk) begin
    if (btn[0]) A <= sw[7:0];
    if (btn[1]) B <= sw[7:0];
end

endmodule
