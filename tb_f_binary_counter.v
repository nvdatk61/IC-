module tb_f_binary_counter();
reg clk, reset;
wire max_tick;
wire [3:0] q;
f_binary_counter #(4) myrun (.clk(clk), .reset(reset), .max_tick(max_tick), .q(q[3:0]));
initial begin
	clk=0;
	forever #5 clk=~clk;
	end
initial begin
	reset=1;
	#20;
	reset=0;
	end
endmodule
