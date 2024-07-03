`timescale 1ns / 1ps


module divizor(clk, pl, en, din, clk_out);
    input clk, en, pl;
    input [15:0] din;
    
    reg [15:0] din_local, contor;
    output reg clk_out;
    always @(clk)
        begin
            if(pl)
                begin
                    contor = 0;
                    din_local = din;
                    //clk_out=1'b0;
                end
            if(en)
                begin
                    contor = contor + 1;
                    if(contor >= din_local)
                        begin
                            contor = 0;
                            clk_out = ~clk_out;
                        end
                    
                end
            else
                clk_out = 0;       
        end
        
            
endmodule
