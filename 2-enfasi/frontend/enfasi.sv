`timescale 1ns / 1ps
module enfasi (input logic clk, rst,
               input logic signed  [10:0] z,
               output logic signed [11:0] q);
logic signed [11:0] p;
aso D1 (.clk(clk),.rst(rst),.p(p),.z(z));
fir D2 (.clk(clk),.rst(rst),.p(p),.q(q));
endmodule



