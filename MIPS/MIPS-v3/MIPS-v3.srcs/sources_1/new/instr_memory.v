`timescale 1ns / 1ps


module instr_memory (
    input [31:0] address,
    output [31:0] instruction
    );
    reg [7:0]mem[0:31];
    
    initial
        begin
            $readmemb("instruction_memory.mem", mem);
        end
    assign instruction = {mem[address], mem[address+1], mem[address+2], mem[address+3]};
    
endmodule
