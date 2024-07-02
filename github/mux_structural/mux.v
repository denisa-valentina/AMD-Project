`timescale 1ns / 1ps

module and_gate #(parameter size=8)(a, sel, out);
    input [size-1:0] a;
    input sel;
    output [size-1:0] out;
    
    assign out = a & sel;
endmodule

module not_gate #(parameter size=8)(a, out);
    input [size-1:0] a;
    output [size-1:0] out;
    
    assign out = !a;
endmodule

module or_gate #(parameter size=8)(a, sel, out);
    input [size-1:0] a;
    input sel;
    output [size-1:0] out;
    
    assign out = a | sel;
endmodule



module mux_struct #(parameter size=8)(a, b, sel, out);
    input [size-1:0] a, b;
    input sel;
    output [size-1:0] out;
    
    
    
endmodule
