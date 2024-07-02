`timescale 1ns / 1ps
`define n 8

// mux using if
module mux1 #(parameter size = 8)(a, b, sel, out);
    input [size-1:0] a, b;
    input sel;
    output reg [size-1:0] out;
    
    always @*
        if(sel)
           out = b;
        else
           out = a;
    // assign output = sel ? a : b
    
    
endmodule
