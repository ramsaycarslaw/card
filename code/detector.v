module detector (
    input clk,
    input reset,
    input din,
    input [4:0] sig,
    output hit
);

assign hit = (sig == 5'b11111);

endmodule