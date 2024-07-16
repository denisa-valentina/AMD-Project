`timescale 1ns / 1ps

module Alu(
    input [31:0] a, 
    input [31:0] b, 
    input [3:0] ALU_OP,
    output reg ZERO,
    output reg [31:0] out);
    
    always@(a or b or ALU_OP)
        begin
            ZERO = 0;
            case(ALU_OP)
                4'b0000: out = a & b; // a AND b
                4'b0001: out = a | b; // a OR b
                4'b0010: out = a + b;
                // adauga comanda pentru BEQ
                4'b0110: out = a - b;
                4'b0111: out = a < b ? 1 : 0; // SLT (set if less than)
                4'b1100: out = ~(a | b);  // a NOR b
                default: out = 0;
            endcase
            if(out==0)
                ZERO = 1;
        end
endmodule
