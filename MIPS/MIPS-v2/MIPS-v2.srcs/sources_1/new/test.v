`timescale 1ns / 1ps

module test;
    reg clk;
    wire [31:0] pc;
    
    top top_inst(clk, pc);
    
    initial
        begin
        #0 clk = 1'b0;
        forever #5 clk = ~clk;
     end
    initial
        #200 $finish;
endmodule
