`timescale 1ns / 1ps

module top (clk, bt, in, a, b, c, d, e, f, g, A);
    input clk;
    input [3:0] bt;
    input [11:0] in;
    output a, b, c, d, e, f, g;
    output [3:0] A;
    wire [11:0] reg1, reg2, reg3;
    wire [11:0] alu_rez;
    wire [11:0] mux1_out;
    wire z, ov, err;
    
    wire [2:0] dec3_2_out;
    wire [3:0] dec3_4_out;
    
    wire clk_out;
    wire [1:0] cnt_out;
    wire [3:0] mux2_out;
    
    divizor div_inst(clk, clk_out);
    
    registru reg1_inst(in, bt[0]&bt[3], reg1); // bt1 si bt4
    registru reg2_inst(in, bt[1]&bt[3], reg2); // bt2 si bt4
    registru reg3_inst(in, bt[2]&bt[3], reg3); // bt3 si bt4
    
    decodor3_2 decodor3_2_inst(bt0, bt1, bt2, dec3_2_out);
    decodor3_4 decodor3_4_inst(z, ov, err, dec3_4_out);
    
    aluOp aluOp_inst(reg1, reg2, reg3[11:8], alu_rez, ov, err, z);
    mux4_1 #(12) mux_inst1(alu_rez, reg1, reg2, reg3, mux1_out, dec3_2_out);
    
    counter cnt_inst(clk_out, cnt_out);  
    mux4_1 mux_inst2({dec3_4_out, mux1_out}, mux2_out, cnt_out);
    digit_decoder digit_inst(mux_out, a, b, c, d, e, f, g);
    demux demux_inst(cnt_out, A);
    
endmodule