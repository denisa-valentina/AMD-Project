`timescale 1ns / 1ps
`define n 8

// data-flow mux
module mux3 #(parameter size = 8)(a, b, sel, out);
    input [size-1:0] a, b;
    input sel;
    output [size-1:0] out;
    
    assign out = sel ? a : b;
    
endmodule
