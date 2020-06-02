module tb_shift_reg();
localparam T=20;
reg clk,reset;
reg s_in;
wire s_out;
shift_reg #(3) m1(clk,reset,s_in,s_out);
	always begin
		clk=1'b0;
		#(T/2);
		clk=1'b1;
		#(T/2);
	end
	initial begin
		reset=1'b1;
		#(T/2);
		reset=1'b0;
		#(T/2);
	end
	initial begin
		s_in=1'b0;
		#5;
		s_in=1'b1;
		#5;
		s_in=1'b0;
		#5;
		s_in=1'b1;
	end
	endmodule
