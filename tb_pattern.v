module disp_mux_tb();

reg clk, reset;
reg [7:0] in0, in1, in2, in3;
wire [3:0] an;
wire [7:0] sseg;

disp_mux disp_unit(.clk(clk), .reset(reset), .in0(in0), .in1(in1), .in2(in2), .in3(in3), .an(an), .sseg(sseg));

initial begin
  clk=0;forever #10 clk=~clk;
end

initial begin
	reset=1;
	in0=8'b11111111;in1=8'b00001111;in2=8'b11110000;in3=8'b00000000;
	#10;
	reset=0;
	end
endmodule
