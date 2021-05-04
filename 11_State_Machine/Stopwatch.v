module Stopwatch(
    input clk,
    input [3:0] btn,
    output [3:0] seg_an,
    output [7:0] seg_cat
);

// Clock Divider: 100MHz / 100000 = 1KHz
ClkDivider #(.divisor(100000)) CUT1(
    .clk(clk),
    .rst(btn_rst),
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
always @(posedge clk, posedge rst) begin
    if (rst)
        state <= IDLE;
    else
        state <= state_nxt;
end

// Output Logic
always @* begin
end

// Counter
always @(posedge clk_slow) begin
    if (btn_clear || counter == 9999)
        counter <= 0;
    else if (state == RUNNING || btn_inc)
        counter <= counter + 1;
end

// 7-seg Controller
Display4Digit CUT(
    .bcd(),
    .en_dec_pt(1'b1),
    .seg_cat(seg_cat),
    .seg_an(seg_an)
)

endmodule
