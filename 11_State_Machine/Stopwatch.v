module Stopwatch(
    input clk,
    input [3:0] btn,
    output [3:0] seg_an,
    output [7:0] seg_cat
);

localparam IDLE = 1'b0;
localparam RUNNING = 1'b1;

reg [13:0] counter;
wire btn_start, btn_stop, btn_clear, btn_inc;
wire clk_slow;
wire [15:0] bcd;
reg state;
reg state_nxt;


assign btn_clear = btn[0];
assign btn_start = btn[1];
assign btn_stop = btn[2];
assign btn_inc = btn[3];


// Clock Divider: 100MHz / 100000 = 1KHz
ClkDivider #(.divisor(100000)) clk_div_u(
    .clk(clk),
    .rst(btn_clear),
    .clk_div(clk_slow)
);

// Finite-State Machine
// Next State
always @* begin
    // set a default value to original value, good coding style
    state_nxt = state;

    case (state)
        RUNNING: begin
            if (btn_stop) begin
                state_nxt = IDLE;
            end
        end

        IDLE: begin
            if (btn_start) begin
                state_nxt = RUNNING;
            end
        end
    endcase
end

// State Register
always @(posedge clk, posedge btn_clear) begin
    if (btn_clear)
        state <= IDLE;
    else
        state <= state_nxt;
end

// Output Logic
// always @* begin
// end

// Counter
always @(posedge clk_slow, posedge btn_clear) begin
    if (btn_clear || counter == 9999)
        counter <= 0;
    else if (state == RUNNING || btn_inc)
        counter <= counter + 1;
end

Bin2Bcd CUT1(
    .bin(counter),
    .bcd(bcd)
);

// 7-seg Controller
Display4Digit CUT2(
    .clk(clk),
    .bcd(bcd),
    .en_dec_pt(1'b1),
    .seg_cat(seg_cat),
    .seg_an(seg_an)
);

endmodule
