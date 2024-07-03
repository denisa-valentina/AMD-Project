`timescale 1ns / 1ps

// behavioral
module aluOp #(parameter size=8)(a, b, op, out, of, un, err, zero);
    input [size-1:0] a, b;
    input [3:0] op;
    output reg of, un, err, zero;
    output reg [size-1:0] out;
    
    always @(a or b or op) begin
        of = 0; un = 0; zero = 0; err = 0;
        case(op)
            4'b0000: {of, out} = a + b;
            4'b0001: {un, out} = a - b;
            4'b0010: out = a << b;
            4'b0011: out = a >> b;
            4'b0100: out = a == b;
            4'b0101: out = a > b; 
            4'b0110: out = a < b;
            default: begin err = 1; out = {size{1'b0}}; end
         endcase
      end
         
        always @(a or b or op) begin
        case(op)
            4'b0001, 4'b0100, 4'b0101, 4'b0110:
                 if(!out)
                    zero = 1;
         endcase
         end

endmodule