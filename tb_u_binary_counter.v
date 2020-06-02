module tb_u_binary_counter();
localparam T=20;
reg clk,reset;
reg syn_clr,load,en,up;
reg [2:0] d;
wire max_tick,min_tick;
wire [2:0] q;
univ_bin_counter #(.N(3)) uut
	(.clk(clk),.reset(reset),.syn_clr(syn_clr),
	 .load(load),.en(en),.up(up),.d(d),
	 .max_tick(max_tick), .min_tick(min_tick),.q(q));
always
begin
clk = 1'b1;
#(T/2);
clk = 1'b0;
#(T/2);
end
initial begin
reset = 1'b1;
#(T/2);
reset = 1'b0;	
end
initial begin
syn_clr = 1'b0;
load = 1'b0;
en = 1'b0;
up = 1'b1;
d = 3'b000;
@(negedge reset);
@(negedge clk);

load = 1'b1;
d = 3'b011;
@(negedge clk);
load = 1'b0;
repeat(2) @(negedge clk);

syn_clr =1'b1;
@(negedge clk);
syn_clr = 1'b0;

en = 1'b1;
up = 1'b1;
repeat(10)@(negedge clk);
en = 1'b0;
repeat(2)@(negedge clk);
en = 1'b1;
repeat(2)@(negedge clk);

up = 1'b0;
repeat(10)@(negedge clk);

wait(q==2);
@(negedge clk);
up = 1'b1;

@(negedge clk);
wait(min_tick);
@(negedge clk);
up = 1'b0;

#(4*T);
en = 1'b0;
#(4*T);

$stop;

end
endmodule

