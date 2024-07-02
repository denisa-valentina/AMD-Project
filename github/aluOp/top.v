`timescale 1ns / 1ps

module top#(parameter size=4)(a, b, op, out, of, un, err, zero);
    input [size-1:0] a, b;
    input [3:0] op;
    output of, un, err, zero;
    output [size-1:0] out;
    
    aluOp #(4)aluOpInst(a, b, op, out, of, un, err, zero);
    
endmodule
