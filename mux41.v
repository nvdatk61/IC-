module mux4to1(A,B,C,D,S0,S1,F);
input A,B,C,D,S0,S1;
output F;
wire X0,X1;
assign X0 = ~S0,
       X1 = ~S1;
assign F = (A&S0&S1)|(B&X0&S1)|(C&S0&X1)|(D&X0&X1);
endmodule
