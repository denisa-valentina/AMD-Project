`timescale 1ns / 1ps

module top (input clk);
        
        wire [31:0] pc, pc_in, branch, pc_add, f;
        wire [31:0] instruction;
        wire [3:0] ALU_OP;
        wire ZERO, REGWRITE, REGDST, EXTOP, ALUSRC, MEMWRITE, MEM2REG, PCSRC;
        
        wire [31:0] write_data;
        wire [4:0] write_address;
        wire [31:0] RD1, RD2;
        wire [31:0] extend_sign;
        wire [31:0] shift_out;
        wire [31:0] aluSrcB;
        wire [31:0] alu_Out;
        wire [31:0] RD;
        
        // vezi de ce prima valoare a lui PC este 04 si nu 00
        register #(32)PC(.clk(clk), .in(pc_in), .out(pc));
        adder_4 PC_add4(.in(pc), .out(pc_in));         
        
        // INSTRUCTION_MEMORY
        instr_memory instrMemory_inst(pc, instruction);
        
        // MAIN_CONTROL
        Main_Control mainControl_inst(instruction, ZERO, REGWRITE, REGDST, EXTOP, ALUSRC, ALU_OP, MEMWRITE, MEM2REG);
                                      
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
        Alu alu_inst(RD1, aluSrcB, ALU_OP, ZERO, alu_Out);

        //DATA_MEMORY
        data_memory dataMemory_inst(clk, MEMWRITE, alu_Out, RD2, RD);
        
        //MEM2REG
        mux2_1 #(32)mem2reg_mux(RD, alu_Out, MEM2REG, write_data); 
        
        
        //verifica de aici :(
        //SHIFT LEFT 2
        //shift_reg shift_left2(extend_sign, shift_out);
        
        //PC ADDER (FOR BEQ)
        //adder adder_inst(pc_in, shift_out, branch);
        
        //PCSource mux
        //mux2_1 #(32)muxPcSource_inst(pc_in, branch, PCSRC, f); // vezi aici
             
    
endmodule
