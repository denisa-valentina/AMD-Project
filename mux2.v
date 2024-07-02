`timescale 1ns / 1ps
`define n 8

// mux using case
module mux2 #(parameter size = 8)(a, b, sel, out);
    input [size-1:0] a, b;
    input sel;
    output reg [size-1:0] out;
    
    always @(sel)
        case(sel)
            1'b0: out = a;
            1'b1: out = b;
        endcase
    // assign output = sel ? a : b
    
endmodule
