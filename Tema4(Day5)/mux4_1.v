`timescale 1ns / 1ps

module mux4_1(in, out, sel);
    input [15:0] in;
    input [1:0] sel;
    output reg [3:0] out;
    
    always @(in or sel)
        case(sel)
            2'b00: out <= in[3:0];
            2'b01: out <= in[7:4];
            2'b10: out <= in[11:8];
            2'b11: out <= in[15:12];
        endcase
endmodule