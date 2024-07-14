`timescale 1ns / 1ps

module adder_4 #(parameter size = 32)(
    input [size-1:0] a,
    output [size-1:0] out);
    
    assign out = a + 4; 
endmodule
