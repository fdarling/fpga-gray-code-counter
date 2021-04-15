`timescale 1ns / 1ps

module up_counter
    #(
    parameter BITS = 1
    )
    (
    input clk,
    input en,
    output reg [BITS-1:0] value
    );

    // combinational logic
    wire [BITS-1:0] value_next = value + 1;

    // to have simulation match the real FPGA behavior
    initial begin
        value = 0;
    end

    // sequential logic
    always @(posedge clk) begin
        if (en) begin
            value <= value_next;
        end
    end
endmodule
