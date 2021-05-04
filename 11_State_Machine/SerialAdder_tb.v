`timescale 1ns / 1ps

`define CYCLE 10

module testbench;

reg clk, rst;
reg [3:0] A, B;
reg [4:0] res;
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
    #(`CYCLE * 1) rst = 1'b0;

    for (x = 0; x < 12; x = x + 1) begin
        for (y = 0; y < 12; y = y + 1) begin
            A = x;
            B = y;

            pos = 0; #(`CYCLE); res[0] = res_in;
            pos = 1; #(`CYCLE); res[1] = res_in;
            pos = 2; #(`CYCLE); res[2] = res_in;
            pos = 3; #(`CYCLE); res[3] = res_in; res[4] = Cout;

            if (res != x + y) begin
                $display("Error: x=%d y=%d x+y=%d res=%d",
                         x, y, x + y, res);
            end
        end
    end

    #(`CYCLE);
    $finish;

end

always #(`CYCLE * 0.5) clk = ~clk;

// always @(negedge clk) begin
//     res[4] <= res_in;
//     for (i = 0; i < 5; i = i + 1) begin
//         res[i] <= res[i+1];
//     end
// end

endmodule
