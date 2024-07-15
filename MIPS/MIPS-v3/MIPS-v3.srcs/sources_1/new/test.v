`timescale 1ns / 1ps

module test;
    reg clk;
    wire [31:0] pc;
    wire [31:0] instruction;
    wire ZERO, REGWRITE, REGDST,  EXTOP, ALUSRC,  MEMWRITE, MEM2REG;
    wire [4:0] write_address;
    wire [31:0] RD1, RD2;
    
    top top_inst(clk, pc, instruction, ZERO, REGWRITE, REGDST, EXTOP, ALUSRC, MEMWRITE, MEM2REG, write_address, RD1, RD2);
    
    initial
        begin
        #0 clk = 1'b0;
        forever #10 clk = ~clk;
     end
    initial
        #200 $finish;
endmodule
