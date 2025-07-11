module stopwatch(
    input clk, reset, start_stop, reset_btn,
    output [6:0] seg,
    output [3:0] an
);
    wire clk_slow, run, clr;
    wire [3:0] sec_ones, sec_tens, min_ones, min_tens;

    clk_div clkdiv (.clk(clk), .reset(reset), .clk_out(clk_slow));
    fsm_controller ctrl (.clk(clk), .reset(reset), .start_stop(start_stop), .reset_btn(reset_btn), .run(run), .clr(clr));
    bcd_counter bcd (.clk(clk_slow), .reset(clr), .enable(run), .sec_ones(sec_ones), .sec_tens(sec_tens), .min_ones(min_ones), .min_tens(min_tens));
    seven_seg_mux mux (.clk(clk_slow), .digit0(sec_ones), .digit1(sec_tens), .digit2(min_ones), .digit3(min_tens), .seg(seg), .an(an));
endmodule
