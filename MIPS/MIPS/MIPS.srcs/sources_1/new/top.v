`timescale 1ns / 1ps

module top(
        input clk
        );
        
        reg [31:0] pc;
        
        register #(32)PC(clk, pc, pc);
        adder PC_add4(pc, pc);
        
        initial 
            pc = 0; 
    
endmodule
