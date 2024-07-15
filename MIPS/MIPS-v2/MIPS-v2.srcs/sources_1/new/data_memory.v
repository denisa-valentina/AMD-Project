`timescale 1ns / 1ps

module data_memory( // ram
    input clk,
    input MEMWRITE,
    input [31:0] address,
    input [31:0] WD,
    output reg [31:0] RD
    );
    
    reg [31:0] mem [0:99];
    integer i;
    
    initial
        for(i = 0; i < 100; i = i + 1)
            begin
                mem[i] = {100{1'b0}};
            end
    always@(posedge clk)
        begin
            if(MEMWRITE)
                mem[address] = WD;
        RD = mem[address];
        end
            
endmodule
            