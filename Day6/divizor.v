`timescale 1ns / 1ps


module divizor(clk, clk_out);
    input clk;
    localparam din = 355500;
    
    reg [31:0] contor;
    output reg clk_out = 0;
    always @(posedge clk)
        begin
            contor = contor + 1;
            if(contor >= din)
                 begin
                    contor = 0;
                    clk_out = ~clk_out;
                 end
        end
        
            
endmodule