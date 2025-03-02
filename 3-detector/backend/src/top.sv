`timescale 1ns/1ps
module top (input logic clk, rst,
            input logic enable, din,
            input logic signed [10:0] x,
            output logic spike);

logic signed [10:0] output_iir;
logic signed [11:0] output_enfasi;

iir blocco1 (.clk(clk),.rst(rst),.x(x),.z(output_iir));
enfasi blocco2(.clk(clk),.rst(rst),.z(output_iir),.q(output_enfasi));
detector blocco3(.clk(clk),.rst(rst),.enable(enable),.din(din),.q(output_enfasi),.spike(spike));

endmodule

