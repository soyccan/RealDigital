module Bcd2Bin(
    input wire [3:0] bcd3,
    input wire [3:0] bcd2,
    input wire [3:0] bcd1,
    input wire [3:0] bcd0,
    output wire [13:0] bin
);

assign bin = (bcd3 * 10'd1000) + (bcd2*7'd100) + (bcd1*4'd10) + bcd0;

endmodule

