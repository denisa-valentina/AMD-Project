`timescale 1ns / 1ps


module rom(clk, en, out);
    input clk, en;
    output reg [31:0] out;
    reg [31:0] mem [0:99];
    reg cnt = 0;
    
    always@(posedge clk)
        if(en)
            begin
                if(cnt > 99)
                     cnt = 0;           
            cnt = cnt+1;
            out = mem[cnt];
            end
endmodule
