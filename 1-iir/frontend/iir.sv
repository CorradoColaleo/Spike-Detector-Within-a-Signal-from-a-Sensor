`timescale 1ns / 1ps
module iir (input logic clk, rst, 
        input logic signed  [10:0] x,
        output logic signed [10:0] z);

// completare
logic signed [10:0] yreg;
logic signed [10:0] y_intermedia;

always_ff @(posedge clk)
begin
        if (rst)
                yreg <= '0;
        else
                yreg <=x;
end

iir_section1 iir1 (.clk(clk),.rst(rst),.x(yreg),.y(y_intermedia));

iir_section2 iir2 (.clk(clk),.rst(rst),.x(y_intermedia),.y(z));

endmodule


