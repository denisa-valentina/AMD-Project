`timescale 1ns / 1ps

//demultiplexor 2:4
module demux(a_in, a_out);
    input [1:0] a_in;
    output reg [3:0] a_out;
    
    always@(a_in)
        case(a_in)
            2'b00: a_out <= 4'b0001;
            2'b01: a_out <= 4'b0010;
            2'b10: a_out <= 4'b0100;
            2'b11: a_out <= 4'b1000;
        endcase
endmodule
