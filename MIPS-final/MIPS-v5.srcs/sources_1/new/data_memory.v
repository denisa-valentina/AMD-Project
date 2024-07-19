`timescale 1ns / 1ps

module data_memory( // ram
    input clk,
    input MEMWRITE,
    input [31:0] address,
    input [11:0] extern_dataIN,
    input [31:0] WD,
    output [31:0] RD,
    output reg [11:0] extern_dataOUT
    );
    
    reg [31:0] mem [0:255];
    integer i;
    
    initial
        for(i = 0; i < 255; i = i + 1)
            begin
                mem[i] = 0;
            end
    assign RD = mem[address];
    
    always@(address)
      begin   
         if(address >= 32'h0000_00EF) begin
               mem[address] = mem[32'h0000_00FF];
               extern_dataOUT = mem[address];
         end
      end
    
    
    always@(posedge clk)
        begin
            if(MEMWRITE)
                if(address >= 32'h0000_00FF)
                       mem[address] = extern_dataIN;
                else
                       mem[address] = 1; // de aici led-ul (singurul aprins)
        end
endmodule
            