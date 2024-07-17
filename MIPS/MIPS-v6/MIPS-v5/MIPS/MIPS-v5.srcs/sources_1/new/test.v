`timescale 1ns / 1ps

module test;
    reg clk;
    
    top top_inst(clk);
    
    initial
        begin
        #0 clk = 1'b0;
        forever #10 clk = ~clk;
     end
    initial
        #250 $finish;
endmodule
