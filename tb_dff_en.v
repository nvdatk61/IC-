module tb_dff_en ();
reg clk,reset;
reg en;
reg d;
wire q;
dff_en dut(.clk(clk),.reset(reset),.d(d),.en(en),.q(q));
initial 
begin
clk=0;
forever #5 clk=~clk;
end
initial 
begin
reset=0'b1;
#10;
reset=0'b0;
end
initial 
begin
en=0'b0;
#5;
en=0'b1;
#10;
en=0'b0;
#15;
en=0'b1;
end
initial
begin
d=0;
forever #20 d=~d;
end
endmodule
