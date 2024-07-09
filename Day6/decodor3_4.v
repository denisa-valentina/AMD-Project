`timescale 1ns / 1ps

module decodor3_4(z, ov, err, out);
    input z, ov, err;
    output reg [3:0] out;
    
    always@(z or ov or err)
        case({z, ov, err})
            3'b000: out = 4'b0001;
            3'b100: out = 4'b1000;
            3'b010: out = 4'b0010;
            3'b001: out = 4'b0010;
        endcase
endmodule
