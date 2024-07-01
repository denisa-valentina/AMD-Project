`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AMD 
// Engineer: Aeloaiei Denisa-Valentina
// 
// Create Date: 01.07.2024 11:36:30
// Design Name: 
// Module Name: top
// Project Name: First Vivado Project
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module AND_1(a, b, o);
    input a, b;
    output [1:0] o;
    assign o[1] = a & b;
    assign o[0] = a ^ b;
    
endmodule

module top(a, b, o);
    input a, b;
    output [1:0] o;
    
    AND_1 and_inst(a, b, o);
    
endmodule

module test;
    reg a, b;
    wire [1:0]o;
    
   top top_inst(a, b, o);
    
    initial
        begin
            #0 a = 1'b0; b = 1'b0;
            #10 a = 1'b1;
            #10 b = 1'b1;
            #10 b = 1'b0; a = 1'b0;
        
        end

    initial
        #100 $finish;
endmodule
