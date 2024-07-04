`timescale 1ns / 1ps
module sipoTop(clk, reset, pl, di, do);
    input clk, reset, pl;
    input di;
    output [3:0]do;
    
    bistabil inst3(clk, reset, pl, di, do[3]);
    bistabil inst2(clk, reset, pl, do[3], do[2]);
    bistabil inst1(clk, reset, pl, do[2], do[1]);
    bistabil inst0(clk, reset, pl, do[1], do[0]);
endmodule
