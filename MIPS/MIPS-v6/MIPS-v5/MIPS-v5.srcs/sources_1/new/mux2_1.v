`timescale 1ns / 1ps

module mux2_1 #(parameter size = 5)(
    input [size-1:0] a, b,
    input sel,
    output [size-1:0] out);
    
    assign out = sel ? b : a;
endmodule
