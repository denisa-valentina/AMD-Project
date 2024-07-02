`timescale 1ns / 1ps
`define n 8

module test;
    reg [`n-1:0] a, b;
    reg sel;
    wire [`n-1:0] out;
    
    top top_inst(a, b, sel, out);
    
    initial
        begin
            #0 a=8'b0000_0000; b=8'b0000_0001; sel = 1'b0;
            #10 a = 8'b0000_0001; b = 0000_0010;
            //repeat(3) begin // for behavioral
                //#10 sel = 0
                //#10 sel = 1
            #10 sel = 1;
            #10 sel = 0;
            #10 sel = 1; 
        end
    initial
        #100 $finish; 
endmodule
