`timescale 1ns / 1ps

module aso (input logic clk, rst, 
        input logic signed  [10:0] z,
        output logic signed [11:0] p);

localparam logic signed [21:0] round_const=signed'({12'b0,1'b1, 9'b0});
logic signed [10:0] z0,z1,z2,z3,z4,t1;
logic signed [21:0] t2,temp;
logic signed [11:0] p1;

always_ff @(posedge clk)
begin
        if (rst)
                begin
                        z0<='0;
                        z1<='0;
                        z2<='0;
                        z3<='0;
                        z4<='0;
                        p<='0;
                end
        else
                begin
                        z0<=z;
                        z1<=z0;
                        z2<=z1;
                        z3<=z2;
                        z4<=z3;
                        p<=p1;
                end
end

always_comb 
begin
        t1 = z0-z4;
        t2 = t1 * z0;
        temp = t2 + round_const;
        p1 = signed'(temp[21:10]);
end
endmodule