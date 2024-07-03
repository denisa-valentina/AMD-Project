`timescale 1ns / 1ps

module test;
    reg [15:0] din;
    reg clk, en, pl;
    
    wire clk_out;
    
    divizor div_inst(clk, pl, en, din, clk_out);
    
    initial
        #100 $finish;
    
    initial
        begin
         #0 clk = 0;
         forever #5 clk = ~clk;
        end
    
    initial
        begin
            #0 pl =1'b1; din = 3; en = 0;
            #10 pl = 1'b0; en = 1;
        end
    
endmodule
