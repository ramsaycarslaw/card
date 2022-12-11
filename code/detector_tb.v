`timescale  1ns/1ps

`include "detector.v"

module detector_tb;

reg clk;
reg reset;
reg din;
reg [4:0] sig;
wire hit;

detector detector_inst (
    .clk(clk),
    .reset(reset),
    .din(din),
    .sig(sig),
    .hit(hit)
);

initial begin 

    #10ns
    clk = 1;
    reset = 0;
    din = 0;
    sig = 5'b11111;

    #10ns

end

endmodule