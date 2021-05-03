module MulWrapper(
    input clk,
    input [7:0] sw,
    input [2:0] btn,
    output reg [7:0] seg_cat,
    output [3:0] seg_an
);

//////// Parameter ////////

//////// Reg & Wire Declaration ////////
reg [7:0] op1, op2;
wire [15:0] res;
wire [15:0] bcd;

//////// Submodule Instantiation ////////
Bin2Bcd bin2bcd(
    .bin(res),
    .bcd(bcd)
);

//////// Finite-State Machine ////////

//////// Combinational Logic ////////
assign res = op1 * op2;

//////// Sequential Logic ////////
always @ (posedge(clk)) begin
    if (btn[0]) op1 <= sw;
    if (btn[1]) op2 <= sw;
end

always @(posedge clk) begin
    case (bcd[3:0])
        4'b0000: seg_an <= 7'b0000000;
    endcase
end

endmodule
