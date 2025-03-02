`timescale 1ns/1ps
module fsm(input logic clk, rst,
          input logic signed [11:0] q, soglia,
          output logic spike);

typedef enum logic [2:0] {S0, S1, S2, S3, S4, Z2, Z3} stato_t;

stato_t stato_corrente, stato_futuro;

logic r;

always_comb 
    begin
        if (q>=soglia)
            r = 1'b 1;
        else
            r = 1'b 0;
    end

always_comb
    begin
        case (stato_corrente)
            S0: stato_futuro = (r)?S1:S0;
            S1: stato_futuro = (r)?S2:Z2;
            S2: stato_futuro = (r)?S3:Z3;
            S3: stato_futuro = S4;
            S4: stato_futuro = (r)?S4:S0;
            Z2: stato_futuro = (r)?S0:Z3;
            Z3: stato_futuro = (r)?S4:S0;
            default:
                stato_futuro = S0;
        endcase
    end

always_ff @(posedge clk)
    begin
        if (rst)
            stato_corrente <= S0;
        else
            stato_corrente <= stato_futuro;
    end

    assign spike = stato_corrente == S4;
    
endmodule
