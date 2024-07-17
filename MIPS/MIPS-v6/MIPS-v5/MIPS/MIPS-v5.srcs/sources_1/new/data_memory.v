`timescale 1ns / 1ps

module data_memory( // ram
    input clk,
    input MEMWRITE,
    input [31:0] address,
    input [31:0] WD,
    output [31:0] RD
    );
    
    reg [31:0] mem [0:99];
    integer i;
    
    initial
        for(i = 0; i < 100; i = i + 1)
            begin
                mem[i] = 0;
            end
    assign RD = mem[address];
    always@(posedge clk)
        begin
            if(MEMWRITE)
                mem[address] = WD;
        end
            
endmodule
            