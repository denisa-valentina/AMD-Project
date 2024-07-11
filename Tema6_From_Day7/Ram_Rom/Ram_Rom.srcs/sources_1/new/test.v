`timescale 1ns / 1ps


module test;
    reg clk, r_w, en;
    reg [7:0] addr;
    reg [31:0] din;
    wire [31:0] out;
    
    top top_inst(clk, en, din, addr, r_w, out);
    
    initial
        begin
            #0 clk = 1'b0;
            forever #10 clk = ~clk;
        end
     initial
        begin 
            #5 en = 1;
        end
        
        
    // for ram
//    initial 
//        begin
//            #0 addr = 8'b0000_0001; din = 3;
//            #10 r_w = 0;
//            #10 addr = 8'b0000_0001; 
//            #10 r_w = 1;
//            #10 addr = 8'b0000_0010; r_w = 0; din = 5;
//            #10 addr = 8'b1000_0000; r_w = 1;
//        end
    
    initial
        #200 $finish;
    
endmodule
