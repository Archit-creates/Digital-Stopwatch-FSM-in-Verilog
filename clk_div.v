module clk_div #(parameter MAX_COUNT = 5)(
    input clk, reset,
    output reg clk_out
);
    reg [31:0] count = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin count <= 0; clk_out <= 0; end
        else if (count == MAX_COUNT - 1) begin
            count <= 0;
            clk_out <= ~clk_out;
        end else count <= count + 1;
    end
endmodule
