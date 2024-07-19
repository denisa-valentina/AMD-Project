`timescale 1ns / 1ps

module btn_filter(
        input clk,
        input btn,
        output reg btn_out
    );
    
    reg [31:0] cnt = 32'b0;
    reg btn_lag = 0;
    
    always@(posedge clk)begin
        cnt = cnt + 1;
    end
    
    always@(posedge cnt[16])begin
        if(btn==1 & btn_lag==0) begin
            btn_out = 1;
            btn_lag = 1;
        end
        
        if(btn==0 & btn_lag==1)begin
            btn_out = 0;
            btn_lag = 0;
        end
    end
endmodule
