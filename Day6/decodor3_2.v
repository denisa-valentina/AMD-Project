`timescale 1ns / 1ps

module decodor3_2(bt0, bt1, bt2, out1, out0);
    input bt0, bt1, bt2;
    output reg out1, out0;
    
    always@(bt0 or bt1 or bt2)
        case({bt0, bt1, bt2})
            3'b000: {out1, out0} = 2'b00;
            3'b100: {out1, out0} = 2'b01;
            3'b010: {out1, out0} = 2'b10;
            3'b001: {out1, out0} = 2'b11;
        endcase
endmodule
