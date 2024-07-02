`timescale 1ns / 1ps
`define n 8

// data-flow module
module top(a, b, sel, out);
    input [`n-1:0] a, b;
    input sel;
    output [`n-1:0] out;
    
    // mux1 #(`n) mux1_inst(a, b, sel, out);
    // mux2 #(`n) mux2_inst(a, b, sel, out);
    mux3 #(`n) mux3_inst(a, b, sel, out);
    
endmodule
