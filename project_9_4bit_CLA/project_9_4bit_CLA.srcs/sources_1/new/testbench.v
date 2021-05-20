module testbench;

reg [3:0] A;
reg [3:0] B;
reg Cin;
wire  [3:0] S;
wire  Cout;
wire  overflow;

CLA_4Bit DUT(A, B, Cin, S, Cout, overflow);

initial begin
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            A_nxt = i;
            B_nxt = j;
            #1;
        end
    end
end


endmodule
