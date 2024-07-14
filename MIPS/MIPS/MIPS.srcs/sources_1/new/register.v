`timescale 1ns / 1ps

module register #(parameter size = 32)(
    input clk,
    input [size-1:0] in,
    output reg [size-1:0] out);
    
    always @(posedge clk)
        out = in;
endmodule


