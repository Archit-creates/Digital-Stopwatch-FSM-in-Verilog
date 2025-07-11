module seven_seg_mux(
    input clk,
    input [3:0] digit0, digit1, digit2, digit3,
    output reg [6:0] seg,
    output reg [3:0] an
);
    reg [1:0] sel = 0;
    reg [3:0] current_digit;
    wire [6:0] seg_out;

    seven_seg_decoder decoder (.digit(current_digit), .seg(seg_out));

    always @(posedge clk) sel <= sel + 1;

    always @(*) begin
        case (sel)
            2'd0: begin an = 4'b1110; current_digit = digit0; end
            2'd1: begin an = 4'b1101; current_digit = digit1; end
            2'd2: begin an = 4'b1011; current_digit = digit2; end
            2'd3: begin an = 4'b0111; current_digit = digit3; end
        endcase
        seg = seg_out;
    end
endmodule
