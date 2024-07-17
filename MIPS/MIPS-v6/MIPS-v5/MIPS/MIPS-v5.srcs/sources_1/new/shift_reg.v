`timescale 1ns / 1ps

module shift_reg(
        input [31:0] in,
        output [31:0] out
    );
    assign out = 4 * in;
endmodule
