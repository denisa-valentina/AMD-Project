`timescale 1ns / 1ps

module registru #(parameter size=12)(di, pl, do);
    input [size-1:0] di;
    input pl;
    output reg [size-1:0] do;
    
    always@(di or pl)
        if(pl)
          do = di;
    
endmodule
