module detector (
    input clk,
    input reset,
    input din,
    input [4:0] sig,
    output hit
);

wire [4:0] buf = 5'b00000;

always @(posedge clk or posedge reset) begin
  if (reset) begin
    buf <= 5'b00000;
  end
  
  buf <= { buf[3:0], din };
    
  if (buf == sig) begin
    hit <= 1
  end
end
 
endmodule
