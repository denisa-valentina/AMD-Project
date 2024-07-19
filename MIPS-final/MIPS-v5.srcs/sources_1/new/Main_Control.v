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
    output reg MEM2REG,
    output reg PCSRC = 0,
    output reg JUMP = 0
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
                PCSRC = 0;
                JUMP = 0;
                    case(instruction[5:0])
                        6'b100000: ALU_OP = 4'b0010; // ADD
                        6'b100010: ALU_OP = 4'b0110; // SUB
                        6'b100100: ALU_OP = 4'b0000; // AND
                        6'b100101: ALU_OP = 4'b0001; // OR
                        6'b101010: ALU_OP = 4'b0111; // SLT 
                        6'b100111: ALU_OP = 4'b1100; // NOR
                    endcase
                end
             6'b001000: // I-TYPE ADDI
                begin
                    REGDST = 1;
                    REGWRITE = 1;
                    EXTOP = 1; // extind data imediata cu semn
                    ALUSRC = 1;
                    MEMWRITE = 0;
                    MEM2REG = 1;
                    PCSRC = 0;
                    JUMP = 0;
                    ALU_OP = 4'b0010; // ADD
                end
             6'b100011: // I-TYPE LW 
                begin
                    REGDST = 0;
                    REGWRITE = 1; //citesti din memorie si scrii in reg
                    EXTOP = 0;
                    ALUSRC = 1;
                    MEMWRITE = 0;
                    MEM2REG = 0;
                    PCSRC = 0;
                    JUMP = 0;
                    ALU_OP = 4'b0010; // ADD (address + offset)
                end
             6'b101011: // I-TYPE SW 
                begin
                    REGDST = 0;
                    REGWRITE = 0;
                    EXTOP = 0;
                    ALUSRC = 1;
                    MEMWRITE = 1;
                    MEM2REG = 1;
                    PCSRC = 0;
                    JUMP = 0;
                    ALU_OP = 4'b0010; // ADD (address + offset)
                end
             6'b000100: // BEQ 
                begin
                    REGDST = 1'bx;
                    REGWRITE = 0;
                    EXTOP = 0;
                    ALUSRC = 0;
                    MEMWRITE = 0;
                    MEM2REG = 0;
                    PCSRC = 1;
                    ALU_OP = 4'b0110; // este a - b == 0? (adica a == b)
                end
             6'b000010: // JUMP (unconditional)
                begin
                    REGDST = 1'bx;
                    REGWRITE = 0;
                    EXTOP = 0;
                    ALUSRC = 0;
                    MEMWRITE = 0;
                    MEM2REG = 0;
                    PCSRC = 0;
                    JUMP = 1;
                    ALU_OP = 4'b1111;
                end
             default: begin
                        {REGDST, REGWRITE, EXTOP, ALUSRC, MEMWRITE, MEM2REG, ALU_OP} = {10{1'bx}};
                        PCSRC = 0;
                      end
        endcase
    
endmodule
