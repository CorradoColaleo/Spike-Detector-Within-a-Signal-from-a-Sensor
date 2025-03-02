`timescale 1ns / 1ps

module iir_section2 (input logic clk, rst, 
        input logic signed  [10:0] x,
        output logic signed [10:0] y);

localparam logic signed [11:0] b0=12'sb000000101111;
localparam logic signed [11:0] b1=12'sb111111110010;
localparam logic signed [11:0] b2=12'sb000000101111;
localparam logic signed [11:0] ma1=12'sb011000001000;
localparam logic signed [11:0] ma2=12'sb110010001111;

localparam logic signed [20:0] round_const=21'sb000000000001000000000; 
logic signed [10:0] x1;
logic signed [10:0] x2;
logic signed [10:0] y0;
logic signed [10:0] y1;
logic signed [10:0] y2;
logic signed [22:0] t0;
logic signed [22:0] t1;
logic signed [22:0] t2;
logic signed [22:0] t3;
logic signed [22:0] t4;
logic signed [22:0] tout;
logic signed [20:0] t_troncato;
logic signed [20:0] temp;

always_ff @(posedge clk)
begin
        if (rst)
                begin
                        x1<='0;
                        x2<='0;
                        y<='0;
                        y1<='0;
                        y2<='0;       
                end
        else
                begin
                        x1<=x;
                        x2<=x1;
                        y2<=y1;
                        y1<=y0;
                        y<=y0;
                end
end

assign t0 = b0*x;
assign t1= x1 * b1;
assign t2 = x2 * b2;
assign t3 = y1 * ma1;
assign t4 = y2 * ma2;
assign tout = t0 + t1 + t2 + t3 + t4;
assign t_troncato = signed '(tout[20:0]);
assign temp = t_troncato + round_const;
assign y0 = signed '(temp[20:10]);

endmodule