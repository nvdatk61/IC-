module comp_4b(AgtB,AltB,AeqB,A,B);
input [1:0]A;
input	[1:0]B;
output AgtB,AltB,AeqB;
wire A1,A0,B1,B0;
assign A1 = ~A[1],
	A0 = ~A[0],
	B1 = ~B[1],
	B0 = ~B[0];
assign AgtB = (A[1]&B1)|(A[0]&B1&B0)|(A[1]&A[0]&B0);
assign AltB = (A1&B[1])|(A1&A0&B[0])|(A0&B[1]&B[0]);
assign AeqB = (A[0]~^B[0])&(A[1]~^B[1]);
endmodule