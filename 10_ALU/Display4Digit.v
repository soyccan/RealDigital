module Display4Digit(
    input clk,
    input [13:0] num,
    output [6:0] seg_cat,
    output reg [3:0] seg_an
);

integer i;

reg [27:0] counter;
wire [1:0] cur_dig;
reg [3:0] cur_bcd;
wire [15:0] bcd;
reg seg_cat_inv;

Bin2Bcd bin2bcd(
    .bin(num),
    .bcd(bcd)
);

assign cur_dig = counter[27:26];
assign seg_cat = ~seg_cat_inv;

always @* begin
    case (cur_dig)
        2'b00: cur_bcd = bcd[3:0];
        2'b01: cur_bcd = bcd[7:4];
        2'b10: cur_bcd = bcd[11:8];
        2'b11: cur_bcd = bcd[15:12];
    endcase
end

always @(posedge clk) begin
    for (i = 0; i < 4; i = i + 1)
        seg_an[i] <= 1;

    seg_an[cur_dig] <= 0;
end

always @(posedge clk) begin
	counter <= counter + 1;
end

always @(posedge clk) begin
    case (cur_bcd)
        4'b0000: seg_cat_inv <= 7'b0111111; //0
        4'b0001: seg_cat_inv <= 7'b0000110; //1
        4'b0010: seg_cat_inv <= 7'b1011011; //2
        4'b0011: seg_cat_inv <= 7'b1001111; //3
        4'b0100: seg_cat_inv <= 7'b1100110; //4
        4'b0101: seg_cat_inv <= 7'b1101101; //5
        4'b0110: seg_cat_inv <= 7'b1111101; //6
        4'b0111: seg_cat_inv <= 7'b0100111; //7
        4'b1000: seg_cat_inv <= 7'b1111111; //8
        4'b1001: seg_cat_inv <= 7'b1100111; //9
        default: seg_cat_inv <= 7'b1000000; //-
    endcase
end

endmodule
