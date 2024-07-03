`timescale 1ns / 1ps
`define n 4

module test;
    reg [`n-1:0] a, b;
    reg [`n-1:0] op;
    wire [`n-1:0] out;
    wire of, un, err, zero;
    reg [`n-1:0] a_copie, b_copie, out_copie;
    // out_copie va retine mereu rezultatele
    // adunarii repetate
    
    //top top_inst(a, b, op, out, of, un, err, zero);
    aluOp #(`n)aluOpInst(a_copie, b_copie, op, out, of, un, err, zero);
    
    task Inmultire;
        input [`n:0] t_a, t_b, t_op;
        //output t_out, t_of, t_un, t_err, t_zero;
        begin
            a_copie = t_a;
            b_copie = t_b;
            op = t_op;  
            #10;       
        end
    endtask
        
    initial
        begin
            #0 a = `n'b0100; b = `n'b0011; op = 4'b0111; out_copie = `n'b0000;
            #10
            while(!zero) begin
               Inmultire(out_copie, a, 4'b0000);
               out_copie = out;
               Inmultire(b, 1, 4'b0001);
               b = out;
            end
        end
    
    initial
        #100 $finish;
endmodule