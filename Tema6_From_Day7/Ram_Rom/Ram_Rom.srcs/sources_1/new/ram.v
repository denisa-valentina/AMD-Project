`timescale 1ns / 1ps

module ram(clk, din, addr, r_w, out);
    input clk, r_w;
    input [31:0] din;
    input [7:0] addr; 
    output reg [31:0] out;
    
    reg [31:0]mem[0:99];  // 100 de adrese cu date exprimate pe 32 de biti 
    
    always @(posedge clk)
        if(r_w) // r_w = 1 -> read from memory
          out = mem[addr];
        else // r_w = 0 -> write to memory
          mem[addr] = din;
endmodule
