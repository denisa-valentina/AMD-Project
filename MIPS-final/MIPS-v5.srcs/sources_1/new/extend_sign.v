`timescale 1ns / 1ps

module extend_sign(
    input [15:0] in,
    input EXTOP,
    output reg [31:0] out
    );
    
    always@(in or EXTOP)
        if(EXTOP)
            out = {{16{in[15]}}, in};
        else
            out = {16'b0, in};
endmodule
