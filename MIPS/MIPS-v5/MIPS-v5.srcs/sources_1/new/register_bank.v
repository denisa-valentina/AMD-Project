`timescale 1ns / 1ps

module register_bank(
    input clk,
    input regWrite,
    input [4:0] RA1,
    input [4:0] RA2,
    input [4:0] WA,
    input [31:0] WD,
    output reg [31:0] RD1,
    output reg [31:0] RD2
    );
    
    reg [31:0] registers [0:31];
    integer i;
    
    initial
        begin
            for( i=0; i < 32; i = i + 1)
            begin
                registers[i] = i;
            end
        end
    always@(posedge clk)
        begin
            RD1 = registers[RA1];
            RD2 = registers[RA2];
            if(regWrite)
                registers[WA] = WD;
        end
endmodule
