`timescale 1ns/1ps
module detector(input logic clk, rst,
               input logic enable, din,
               input logic signed [11:0] q,
               output logic spike);
logic signed [11:0] soglia;
ser_par m1 (.*);
fsm m2 (.*);
endmodule