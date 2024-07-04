`timescale 1ns / 1ps
module sisoTop(clk, reset, pl, di, do);
    input clk, reset, pl;
    input di;
    output do;
    wire [2:0] do_aux; 
    
    bistabil inst3(clk, reset, pl, di, do_aux[2]);
    bistabil inst2(clk, reset, pl, do_aux[2], do_aux[1]);
    bistabil inst1(clk, reset, pl, do_aux[1], do_aux[0]);
    bistabil inst0(clk, reset, pl, do_aux[0], do);
endmodule
