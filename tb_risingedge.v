module risingedge_tb();
reg clk,reset,level;
wire tick;
edge_detect_moore F(clk,reset,level,tick);
initial
begin
clk = 0;
forever #5 clk = ~clk;
end
initial
begin
reset = 0;
#7 reset = 1;
#10 reset = 0;
end
initial
begin
level = 0;
#7 level = 1;
#20 level = 0;
end
endmodule
