module mux4t01_tb();
reg A,B,C,D,S0,S1;
wire F;
mux4to1 MUX41(A,B,C,D,S0,S1,F);
initial
begin
#5 A=0;B=0;C=0;D=0;S0=1;S1=0;
#5 A=0;B=1;C=0;D=1;S0=1;S1=1;
#5 A=1;B=0;C=1;D=1;S0=0;S1=1;
#5 A=1;B=1;C=1;D=1;S0=0;S1=0;
end
endmodule
