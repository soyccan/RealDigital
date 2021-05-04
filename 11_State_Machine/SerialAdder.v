`timescale 1ns / 1ps

module SerialAdder(
    input clk,
    input rst,
    input A,
    input B,
    output F,
    output Cout
);

// Define State Codes
localparam S0 = 2'b00;
localparam S1 = 2'b01;
localparam S2 = 2'b10;
localparam S3 = 2'b11;

// present state and next state
reg [1:0] pState, nState;

// Combinational Logic: Next State Logic
always @* begin
    case (pState)
        S0: begin
            if (A == 1'b0 && B == 1'b0)
                nState = S0;
            else if (A == 1'b1 && B == 1'b1)
                nState = S2;
            else
                nState = S1;
        end

        S1: begin
            if (A == 1'b0 && B == 1'b0)
                nState = S0;
            else if (A == 1'b1 && B == 1'b1)
                nState = S2;
            else
                nState = S1;
        end

        S2: begin
            if (A == 1'b0 && B == 1'b0)
                nState = S1;
            else if (A == 1'b1 && B == 1'b1)
                nState = S3;
            else
                nState = S2;
        end

        S3: begin
            if (A == 1'b0 && B == 1'b0)
                nState = S1;
            else if (A == 1'b1 && B == 1'b1)
                nState = S3;
            else
                nState = S2;
        end

        default: nState = S0;
    endcase
end

// State Registers
always @(posedge clk, posedge rst) begin
    if (rst == 1'b1)
        pState <= S0;
    else
        pState <= nState;
end

// Output Logic
assign F = pState == S1 || pState == S3; // Sum
assign Cout = pState == S2 || pState == S3;

endmodule
