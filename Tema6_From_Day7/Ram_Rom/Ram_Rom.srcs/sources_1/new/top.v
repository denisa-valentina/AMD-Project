`timescale 1ns / 1ps

module top(clk, en, din, addr, r_w, out);
    input clk, r_w, en;
    input [7:0] addr;
    input [31:0] din;
    output [31:0] out;
    
    //ram ram_inst(clk, din, addr, r_w, out); for ram
    rom rom_inst(clk, en, out);
    
endmodule
