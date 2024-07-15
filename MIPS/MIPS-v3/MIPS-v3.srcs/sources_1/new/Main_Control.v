`timescale 1ns / 1ps

module Main_Control(
    input [31:0] instruction,
    input ZERO, // il vom folosi mai tarziu, la jump-uri
    output reg REGWRITE,
    output reg REGDST,
    output reg EXTOP,
    output reg ALUSRC,
    output reg [3:0] ALU_OP,
    output reg MEMWRITE,
    output reg MEM2REG
    );
    
    always@(instruction[31:26] or instruction[5:0])
        case(instruction[31:26]) // check opcode
            6'b000000: // R-TYPE
                begin
                REGDST = 1;
                REGWRITE = 1;
                EXTOP = 0;
                ALUSRC = 0;
                MEMWRITE = 0;
                MEM2REG = 1;
                    case(instruction[5:0])
                        6'b100000: ALU_OP = 4'b0010; // ADD
                        6'b100010: ALU_OP = 4'b0110; // SUB
                        6'b100100: ALU_OP = 4'b0000; // AND
                        6'b100101: ALU_OP = 4'b0001; // OR
                        6'b101010: ALU_OP = 4'b0111; // SLT 
                    endcase
                end
             6'b001000: // I-TYPE ADDI
                begin
                REGDST = 1;
                REGWRITE = 1;
                EXTOP = 1;
                ALUSRC = 1;
                MEMWRITE = 0;
                MEM2REG = 1;
                ALU_OP = 4'b0010; // ADD
                end
             default: {REGDST, REGWRITE, EXTOP, ALUSRC, MEMWRITE, MEM2REG, ALU_OP} = {12{1'b0}};
        endcase
    
endmodule
