`timescale 1ns / 1ps

module gray_code_counter
    #(
    parameter CLOCK_MHZ = 16,
    parameter BITS = 8
    )
    (
    input clk,
    output wire [BITS-1:0] value
    );

    // intermodular wires
    wire count_up_en;
    wire [BITS-1:0] binary_counter;

    // 1MHz pulses
    pulse_generator #(.RESET_AT(CLOCK_MHZ-1)) pulse_gen_inst (.clk(clk), .out(count_up_en));
    
    // 1MHz binary counter
    up_counter #(.BITS(BITS)) up_count_inst (.clk(clk), .en(count_up_en), .value(binary_counter));
    
    // gray code changing at 1MHz
    binary_to_gray_code #(.BITS(BITS)) b_to_g_inst (.b(binary_counter), .g(value));
endmodule
