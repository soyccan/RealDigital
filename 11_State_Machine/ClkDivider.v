module ClkDivider (
    input clk,
    input rst,
    output reg clk_div
);

parameter divisor = 50000;

localparam terminalcount = (divisor/2 - 1);

reg [15:0] count;
wire tc;

assign tc = (count == terminalcount);

always @(posedge clk, posedge rst) begin
    if (rst) count <= 0;
    else if (tc) count <= 0;
    else count <= count + 1;
end

always @(posedge clk, posedge rst) begin
    if (rst) clk_div <= 0;
    else if (tc) clk_div = !clk_div;
end

endmodule

