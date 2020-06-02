module mux2to1(out,x0,x1,s);
output out;
input x0,x1,s;

assign
	out=(x0*(~s))|(x1*s);
endmodule

module mux4to1(out,x0,x1,x2,x3,s0,s1);
output out;
input x0,x1,x2,x3,s0,s1;
wire y0,y1;
mux2to1 f1(y0,x0,x1,s0);
mux2to1 f2(y1,x2,x3,s1);
mux2to1 f3(out,y0,y1,s0);
endmodule

