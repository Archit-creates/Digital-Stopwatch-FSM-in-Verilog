`timescale 1s/1ms

module stopwatch_tb;
    reg clk = 0, reset = 0, start_stop = 0, reset_btn = 0;
    wire [6:0] seg;
    wire [3:0] an;

    stopwatch uut (.clk(clk), .reset(reset), .start_stop(start_stop), .reset_btn(reset_btn), .seg(seg), .an(an));

    always #0.5 clk = ~clk;  // Simulates 1Hz clock

    initial begin
        $display("Time\tSEG\tAN");
        reset = 1; #1; reset = 0;

        // Start
        start_stop = 1; #1; start_stop = 0;
        repeat(10) #1;

        // Pause
        start_stop = 1; #1; start_stop = 0;
        repeat(3) #1;

        // Resume
        start_stop = 1; #1; start_stop = 0;
        repeat(5) #1;

        // Reset
        reset_btn = 1; #1; reset_btn = 0;
        #2;

        $finish;
    end
endmodule
