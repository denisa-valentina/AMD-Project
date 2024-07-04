`timescale 1ns / 1ps

module test;
    // reg [3:0] di, do; // for pipo
    // reg di, do; // for siso
    reg clk, reset, pl;
    reg di; // for sipo
    wire [3:0] do; // for sipo
    
    // pipoTop top(clk, reset, pl, di, do);
    // sisoTop top(clk, reset, pl, di, do);
    sipoTop top(clk, reset, pl, di, do);
    
    task PIPO;
        // for pipo
            begin
            #5 reset = 1'b1; di = 4'b1010;
            #10 reset = 1'b0;
            #10 pl = 1'b1;
            #10 pl = 1'b0;
            #10 di = 4'b1011;
            #10 pl = 1'b1;
            #10 reset = 1'b1;
            end
    endtask
    
    task SISO;
        begin
             // for siso
            #5 reset = 1'b1; di = 1'b0;
            #10 reset = 1'b0;
            #10 pl = 1'b1; di = 1'b1;
            #30 di = 1'b0;
            #10 di = 1'b1;
        end
    endtask
    
    task SIPO;
        begin
            // for sipo
            #5 reset = 1'b1; di = 1'b0;
            #10 reset = 1'b0;
            #10 pl = 1'b1; di = 1'b1;
            #30 di = 1'b0;
            #10 di = 1'b1;
        end
    endtask
    
    initial
        begin
            #0 clk = 1'b0;
            forever #5 clk = ~clk;
        end
        
    initial 
        #100 $finish;
        
    initial 
        begin
            SIPO;
        end
    
endmodule
