`timescale 1ns / 1ps

module top (clk, pl, en, in, a, b, c, d, e, f, g, A);
    input clk, pl, en;
    input [15:0] in;
    output a, b, c, d, e, f, g;
    output [3:0] A;
    reg [2:0] din = 2'b11;
    wire clk_out;
    wire [1:0] cnt_out;
    wire [3:0] mux_out;
    
    divizor div_inst(clk, pl, en, din, clk_out);
    counter cnt_inst(clk_out, cnt_out);  
    mux4_1 mux_inst(in, mux_out, cnt_out);
    digit_decoder digit_inst(mux_out, a, b, c, d, e, f, g);
    demux demux_inst(cnt_out, A);
    
endmodule