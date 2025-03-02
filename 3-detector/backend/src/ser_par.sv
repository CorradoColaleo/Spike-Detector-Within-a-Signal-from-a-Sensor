`timescale 1ns/1ps
module ser_par(input logic clk, rst,
               input logic enable, din,
               output logic signed [11:0] soglia);

// Inserire la soglia MSB first
logic signed [11:0] temp;

always_ff @(posedge clk)
begin
    if (rst)
        begin
            temp <='0;
        end
    else if (enable)
        begin
            temp[11:1]<=temp[10:0];
            temp[0]<=din;
        end
end

assign soglia = temp;

endmodule


