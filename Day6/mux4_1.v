`timescale 1ns / 1ps

module mux4_1 #(parameter size = 4)(a, b, c, d, out, sel);
    input [size-1:0] a, b, c, d;
    input [1:0] sel;
    output reg [size-1:0] out;
    
    always @(a or b or c or d or sel)
        case(sel)
            2'b00: out <= a;
            2'b01: out <= b;
            2'b10: out <= c;
            2'b11: out <= d;
        endcase
endmodule
