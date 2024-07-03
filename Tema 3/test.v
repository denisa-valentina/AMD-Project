`timescale 1ns / 1ps


module test;
    //reg [3:0] di; for pipo
    reg di;
    reg clk, reset, pl;
    wire [3:0] do;
    
    // pipoTop top(clk, reset, pl, di, do);
    sisoTop top(clk, reset, pl, di, do);
    
    initial
        begin
            #0 clk = 1'b0;
            forever #5 clk = ~clk;
        end
        
    initial 
        #100 $finish;
        
    initial 
        begin
        // for pipo
//            #5 reset = 1'b1; di = 4'b1010;
//            #10 reset = 1'b0;
//            #10 pl = 1'b1;
//            #10 pl = 1'b0;
//            #10 di = 4'b1011;
//            #10 pl = 1'b1;
//            #10 reset = 1'b1;
       // for siso
            #5 reset = 1'b1; di = 1'b0;
            #10 reset = 1'b0;
            #10 pl = 1'b1; di = 1'b1;
            #30 di = 1'b0;
        end
    
endmodule
