module floatingpoint_tb();
reg sign1, sign2; 
reg [3:0] exp1, exp2; 
reg [7:0] frac1, frac2;
wire sign_out; 
wire [3:0] exp_out; 
wire [7:0] frac_out; 
fp_adder m(sign1,sign2,exp1,exp2,frac1,
frac2,sign_out,exp_out,frac_out);
initial
begin 
sign1=0;sign2=0;
exp1=4'b1000;exp2=4'b1001;
frac1=8'h12;frac2=8'h45;
#5
sign1=0;sign2=1;	
exp1=4'b0011;exp2=4'b0100;
frac1=8'h54;frac2=8'h87;
#5
sign1=1;sign2=0;
exp1=4'b0011;exp2=4'b0011;
frac1=8'h55;frac2=8'h54;
#5
sign1=1;sign2=1;
exp1=4'b1000;exp2=4'b1100;
frac1=8'ha8;frac2=8'he4;
end
endmodule
