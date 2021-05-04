`timescale 1ns / 1ps

`define CYCLE 10

module testbench;

reg clk, rst;
reg [3:0] A, B, res;
reg [1:0] pos;
wire F, Cout;
wire res_in;

integer x, y, i, j;

SerialAdder CUT(
    .clk(clk),
    .rst(rst),
    .A(A[pos]),
    .B(B[pos]),
    .F(res_in),
    .Cout(Cout)
);

initial begin
    $dumpfile("a.vcd");
    $dumpvars();

    clk = 1'b1;

    rst = 1'b0;
    #(`CYCLE * 0.5) rst = 1'b1;
    #(`CYCLE * 0.5) rst = 1'b0;

    pos = 2'b0;

    for (x = 0; x < 16; x = x + 1) begin
        for (y = 0; y < 16; y = y + 1) begin
            A = x;
            B = y;

            #(`CYCLE * 4);

            if (res != x * y) begin
                $display("Error: x=%d y=%d x*y=%d res=%d",
                         x, y, x * y, res);
            end
        end
    end

    $finish;

end

always #(`CYCLE * 0.5) clk = ~clk;

always @(posedge clk) begin
    pos = pos + 1;
end

always @(posedge clk) begin
    res[0] <= res_in;
    for (i = 1; i < 4; i = i + 1) begin
        res[i] <= res[i-1];
    end
end

endmodule
