`timescale 1ns / 1ps

module counter(clk, out);
    input clk;
    output reg [1:0] out;
    
    always @(posedge clk)
        begin
            if(out < 2'b11)
                out <= out + 1;
            else
                out <= 2'b00;
        end
endmodule
