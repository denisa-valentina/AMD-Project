`timescale 1ns / 1ps

module pipoTop(clk, reset, pl, di, do);
    input clk, reset, pl;
    input [3:0] di;
    output [3:0] do;
    
    bistabil inst3(clk, reset, pl, di[3], do[3]);
    bistabil inst2(clk, reset, pl, di[2], do[2]);
    bistabil inst1(clk, reset, pl, di[1], do[1]);
    bistabil inst0(clk, reset, pl, di[0], do[0]);
endmodule
