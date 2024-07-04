`timescale 1ns / 1ps

module bistabil(clk, reset, pl, d, q);
    input clk, reset, pl, d;
    output reg q;
    
    always@(posedge clk)
        if(reset)
            q <= 0;
        else if(pl)
            q <= d;
endmodule
