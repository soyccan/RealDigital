`timescale 1ns / 1ps

`define CYCLE 10

module testbench;

reg clk, rst;
reg [3:0] A, B;
reg [4:0] res;
reg [1:0] pos;
wire F, Cout;
wire res_in;

integer x, y, i;

SerialAdder DUT(
    .clk(clk),
    .rst(rst),
    .A(A[pos]),
    .B(B[pos]),
    .F(res_in),
    .Cout(Cout)
);

initial begin
    // Dump to a waveform file, can be read by GtkWave, Vivado, nWave ...
    // $dumpfile("a.vcd");
    // $dumpvars();

    clk = 1'b1;

    rst = 1'b0;
    #(`CYCLE * 0.5) rst = 1'b1;
    #(`CYCLE * 1) rst = 1'b0;

    for (x = 0; x < 16; x = x + 1) begin
        for (y = 0; y < 16; y = y + 1) begin
            A = x;
            B = y;

            #(`CYCLE * 0.5) rst = 1'b1;
            #(`CYCLE * 1) rst = 1'b0;
            // DUT.pState = DUT.S0;

            pos = 0; #(`CYCLE); res[0] = res_in;
            pos = 1; #(`CYCLE); res[1] = res_in;
            pos = 2; #(`CYCLE); res[2] = res_in;
            pos = 3; #(`CYCLE); res[3] = res_in; res[4] = Cout;

            $display("%s x=%d y=%d x+y=%d res=%d",
                     x + y == res ? "CORRECT" : "ERROR  ",
                     x, y, x + y, res);
        end
    end

    #(`CYCLE);
    $finish;

end

always #(`CYCLE * 0.5) clk = ~clk;

endmodule
