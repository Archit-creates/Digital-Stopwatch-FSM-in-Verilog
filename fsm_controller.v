module fsm_controller(
    input clk,
    input reset,
    input start_stop,
    input reset_btn,
    output reg run,
    output reg clr
);

    // State Encoding
    parameter IDLE  = 2'b00;
    parameter RUN   = 2'b01;
    parameter PAUSE = 2'b10;

    reg [1:0] state, next;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:  next = (start_stop) ? RUN : IDLE;
            RUN:   next = (start_stop) ? PAUSE : RUN;
            PAUSE: next = (start_stop) ? RUN : PAUSE;
            default: next = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        run = (state == RUN);
        clr = reset_btn || (state == IDLE);
    end

endmodule
