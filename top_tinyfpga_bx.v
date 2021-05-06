`timescale 1ns / 1ps

module top_tinyfpga_bx
    (
    input CLK,
    output wire [7:0] GRAY_OUT,
    output wire USBPU
    );

    localparam CLOCK_MHZ = 16;
    localparam COUNTER_BITS = 8;

    // intermodular wires
    wire [COUNTER_BITS-1:0] gray_counter;

    // 1MHz pulses
    gray_code_counter #(.CLOCK_MHZ(CLOCK_MHZ), .BITS(COUNTER_BITS)) counter_inst (.clk(CLK), .value(gray_counter));

    // FPGA outputs
    assign GRAY_OUT = gray_counter;
    assign USBPU = 1'b0;   // disable USB
endmodule
