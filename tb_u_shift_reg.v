module tb_u_shift_reg();
reg clk,reset;
reg[1:0]ctrl;
reg[7:0]d;
wire[7:0]q;
u_shift_reg #(8) my(clk,reset,ctrl,d,q);
initial begin
	clk=0;
	forever #5 clk=~clk;
	end
initial begin
	reset=1'b1;
	#15;
	reset=1'b0;
end
initial begin
	ctrl=2'b00;d=8'b00011100;
	#10;
	ctrl=2'b01;d=8'b00011101;
	#10;
	ctrl=2'b10;d=8'b00011110;
	#10;
	ctrl=2'b11;d=8'b00011111;
	end
endmodule

