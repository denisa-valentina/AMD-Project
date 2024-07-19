//`timescale 1ns / 1ps

//module test;
//    reg clk;
//    reg [15:0] extern_dataIN;
//    wire [15:0] extern_dataOUT;
    
//    top top_inst(clk, extern_dataIN, extern_dataOUT);
    
//    initial
//        begin
//        #0 clk = 1'b0;
//        forever #10 clk = ~clk;
//     end
     
//     initial
//        #0 extern_dataIN = 12;
     
//    initial
//        #250 $finish;
//endmodule
