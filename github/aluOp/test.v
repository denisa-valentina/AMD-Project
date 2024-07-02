`timescale 1ns / 1ps

module test;
    reg [3:0] a, b;
    reg [3:0] op;
    wire [3:0] out;
    wire of, un, err, zero;
    
    top top_inst(a, b, op, out, of, un, err, zero);
    
    initial
        begin
            #0 a = 4'b1111; b=4'b0110; op = 4'b000;
            #10 op = 4'b0001; a = 4'b0010; b = 4'b0011;
            #10 op = 4'b0010; b = 4'b0001;
            #10 op = 4'b0011;
            #10 op = 4'b0100;
            #10 op = 4'b0101;
            #10 op = 4'b0110;
            #10 op = 4'b0111;
        end
    
    initial
        #100 $finish;
    
endmodule
