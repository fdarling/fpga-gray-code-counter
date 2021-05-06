`timescale 1ns / 1ps

module pulse_generator
    #(
    parameter RESET_AT = 1
    )
    (
    input clk,
    output reg out
    );
    
    localparam BITS = $clog2(RESET_AT);

    // state
    reg  [BITS-1:0] counter;

    // combinational logic
    wire counter_at_top = (counter == RESET_AT);
    wire [BITS-1:0] counter_next = counter_at_top ? 0 : (counter + 1);

    // to have simulation match the real FPGA behavior
    initial begin
        counter = 0;
        out = 0;
    end

    // sequential logic
    always @(posedge clk) begin
        counter <= counter_next;
        out <= counter_at_top;
    end
endmodule
