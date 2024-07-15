`timescale 1ns / 1ps


module instr_memory (
    input [31:0] address,
    output [31:0] instruction
    );
    reg [31:0]mem[0:1024];
    
    initial
        begin
            $readmemb("instruction_memory.mem", mem);
        end
    assign instruction = mem[address];
    
endmodule
