//`timescale 1ns / 1ps


//module test;
//    // for digit_decoder
    
//    // reg [3:0] din;
//    // wire a, b, c, d, e, f, g;
    
//    //digit_decoder inst(din, a, b, c, d, e, f, g);
    
////    initial
////        begin
////            #0 din = 4'b0000;
////            #10 din = 4'b0001;
////            #10 din = 4'b0010;
////            #10 din = 4'b0011;
////            #10 din = 4'b0100;
////            #10 din = 4'b0101;
////            #10 din = 4'b0110;
////            #10 din = 4'b0111;
////            #10 din = 4'b1000;
////            #10 din = 4'b1001;
////            #10 din = 4'b1010;
////            #10 din = 4'b1011;
////            #10 din = 4'b1100;
////            #10 din = 4'b1101;
////            #10 din = 4'b1110;
////            #10 din = 4'b1111; 
////        end

//    // for demux 2:4
////    reg [2:0] a_in;
////    wire [3:0] a_out;

////    demux inst(a_in, a_out);
    
////    initial
////        begin
////            #0 a_in = 2'b00;
////            #30 a_in = 2'b01;
////            #30 a_in = 2'b10;
////            #30 a_in = 2'b11;
////        end

//    // for counter
////    reg clk;
////    wire [1:0] out;
    
////    counter inst(clk, out);
    
////    initial
////        begin
////            #0 clk = 1'b0;
////            forever #10 clk = ~clk;
////        end

//    // rezultat final
//    reg [15:0] in;
//    reg clk;
//    wire a, b, c, d, e, f, g;
//    wire [3:0] A, mux_out;
//    wire [1:0] cnt_out; 
    
//    top top_inst(clk, in, a, b, c, d, e, f, g, A, cnt_out, mux_out);
    
//    initial 
//        begin
//            #0 clk = 1'b0;
//            forever #10 clk = ~clk;
//        end
    
//    initial
//        begin
//            #0 in = 16'b0000_0001_0011_0010;
//        end
    
//    initial
//       #200 $finish;

//endmodule
