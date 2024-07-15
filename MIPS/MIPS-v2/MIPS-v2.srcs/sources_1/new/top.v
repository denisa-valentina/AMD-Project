`timescale 1ns / 1ps

module top(
        input clk,
        output [31:0] pc
        );
        
        wire [31:0] pc1_out, pc2_out;
        wire [31:0] instruction;
        
        wire ZERO, REGWRITE, REGDST, EXTOP, ALUSRC, MEMWRITE, MEM2REG;
        wire [3:0] ALU_OP;
        
        wire [4:0] write_address;
        wire [31:0] write_data;
        wire [31:0] RD1, RD2;
        wire [31:0] extend_sign;
        wire [31:0] aluSrcB;
        wire [31:0] alu_Out;
        wire [31:0] RD;
        
        register #(32)PC(clk, pc, pc1_out);
        adder_4 PC_add4(pc1_out, pc2_out);
        //debug from here
        assign pc = pc2_out;

        // INSTRUCTION_MEMORY
        instr_memory instrMemory_inst(pc, instruction);
        
        // MAIN_CONTROL
        Main_Control mainControl_inst(instruction, ZERO, REGWRITE, REGDST, EXTOP,
                                      ALUSRC, ALU_OP, MEMWRITE, MEM2REG);
                                      
        //REG_DST
        mux2_1 #(5) regDst_mux(instruction[20:16], instruction[15:11], REGDST, write_address);
       
        //REGISTER_BANK
        register_bank regBank_inst(clk, REGWRITE, instruction[25:21], instruction[20:16], write_address,
                                   write_data, RD1, RD2);
                                   
        //EXTEND_SIGN
        extend_sign extendSign_inst(instruction[15:0], EXTOP, extend_sign);
        
        //ALU_SRC
        mux2_1 #(32) aluSRC_mux(RD2, extend_sign, ALUSRC, aluSrcB);
        
        //ALU
        Alu alu_inst(RD1, alusrcB, ALU_OP, ZERO, alu_Out);

        //DATA_MEMORY
        data_memory dataMemory_inst(clk, MEMWRITE, alu_Out, RD2, RD);
        
        //MEM2REG
        mux2_1 mem2reg_mux(RD, alu_Out, MEM2REG, write_data);        
    
endmodule
