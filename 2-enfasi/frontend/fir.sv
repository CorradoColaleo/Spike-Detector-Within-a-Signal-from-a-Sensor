`timescale 1ns / 1ps

module fir (input logic clk, rst, 
        input logic signed  [11:0] p,
        output logic signed [11:0] q);

localparam logic signed [9:0] b0=10'sb0000010101;
localparam logic signed [9:0] b1=10'sb0001000011;
localparam logic signed [9:0] b2=10'sb0010101010;
localparam logic signed [9:0] b3=10'sb0011111101;
localparam logic signed [9:0] b4=10'sb0011111101;
localparam logic signed [9:0] b5=10'sb0010101010;
localparam logic signed [9:0] b6=10'sb0001000011;
localparam logic signed [9:0] b7=10'sb0000010101;

localparam logic signed [21:0] round_const=signed'({12'b0,1'b1, 9'b0});

logic signed [11:0] p0,p1,p2,p3,p4,p5,p6,p7,q1;
logic signed [21:0] r0,r1,r2,r3,r4,r5,r6,r7,t_sum,temp;

always_ff @(posedge clk)
begin
        if (rst)
                begin
                        p0<='0;
                        p1<='0;
                        p2<='0;
                        p3<='0;
                        p4<='0;
                        p5<='0;
                        p6<='0;
                        p7<='0;
                        q<='0;
                end
        else
                begin
                        p0<=p;
                        p1<=p0;
                        p2<=p1;
                        p3<=p2;
                        p4<=p3;
                        p5<=p4;
                        p6<=p5;
                        p7<=p6;
                        q<=q1;
                end
end

always_comb 
begin
        r0 = b0 * p0;
        r1 = b1 * p1;
        r2 = b2 * p2;
        r3 = b3 * p3;
        r4 = b4 * p4;
        r5 = b5 * p5;
        r6 = b6 * p6;
        r7 = b7 * p7;
        t_sum = r0+r1+r2+r3+r4+r5+r6+r7;
        temp = t_sum + round_const;
        q1 = signed '(temp[21:10]);
end

endmodule