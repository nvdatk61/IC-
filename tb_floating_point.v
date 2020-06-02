
module TB_ft();
reg sign1,sign2;
reg [7:0] frac1 , frac2;
reg [3:0] exp1,exp2;
wire sign_out;
wire [3:0] exp_out;
wire [7:0] frac_out;

floating_point uut (sign1,sign2,frac1,frac2,exp1,exp2,sign_out,frac_out,exp_out);
 initial
  begin 
   sign1 = 0;
	sign2 = 1;
	frac1 = 8'b10001111;
	frac2 = 8'b00110011;
	exp1  = 4'd4;
	exp2  = 4'd5;
	#100;
	sign1 = 1;
	sign2 = 1;
	frac1 = 8'd52;
	frac2 = 8'd53;
	exp1  = 4'd5;
	exp2  = 4'd5;
	#50;
	sign1 = 0;
	sign2 = 0;
	frac1 = 8'b00000011;
	frac2 = 8'b00000010;
	exp1  = 4'd4;
	exp2  = 4'd3;
 end
 endmodule

