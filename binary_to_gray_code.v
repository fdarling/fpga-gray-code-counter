`timescale 1ns / 1ps

module binary_to_gray_code
    #(
    parameter BITS = 1
    )
    (
    input wire [BITS-1:0] b,
    output wire [BITS-1:0] g
    );
    
    genvar i;
    generate
        for (i = 0; i < BITS-1; i = i + 1) begin : gen_xors
            assign g[i] = b[i] ^ b[i+1];
        end
    endgenerate
    assign g[BITS-1] = b[BITS-1];
endmodule
