`timescale 1ns / 1ps

module adder_4 #(parameter size = 32)(
    input [size-1:0] in,
    output [size-1:0] out);
    
    assign out = in + 4;
endmodule
