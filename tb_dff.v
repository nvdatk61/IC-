
module t_d_ff_reset();
reg clk,reset;
reg d;
wire q;
d_ff_reset dut(.clk(clk),.reset(reset),.d(d),.q(q));
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
reset = 1'b1;
#10;
reset = 1'b0;
end
initial begin
d = 0;
forever #15 d = ~d;
end
endmodule
