`timescale 1ns / 1ps

module shift_jump( // returneaza adresa la care are loc saltul neconditionat
        input [31:0] pc,
        input [31:0] instruction,
        output [31:0] jump_address
    );
    
    assign jump_address = {pc[31:28], instruction[25:0], 2'b0};
    
endmodule
