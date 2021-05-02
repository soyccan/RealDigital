
    input clk,
    input [7:0] sw,
    input [2:0] btn,
    output [7:0] seg

always @ (posedge(clk)) begin
    if (btn[0]) op1 <= sw;
    if (btn[1]) op2 <= sw;
end
