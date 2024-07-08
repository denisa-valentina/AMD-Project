`timescale 1ns / 1ps

module top (clk, in, a, b, c, d, e, f, g);
    input clk;
    input [15:0] in;
    output a, b, c, d, e, f, g;
    wire [3:0] A;
    wire [1:0] cnt_out;
    wire [3:0] mux_out;
    
    counter cnt_inst(clk, cnt_out);  
    mux4_1 mux_inst(in, mux_out, cnt_out);
    digit_decoder digit_inst(mux_out, a, b, c, d, e, f, g);
    demux demux_inst(cnt_out, A);
    
endmodule
