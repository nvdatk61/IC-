module relu6
(input [3:0] A,
output [3:0] B
);
wire [2:0] C;
assign C = A[2:0];
assign B = (A[3] == 1'b1) ? 0:
	((C < 3'b110) ? A:
	{{1'b0},{3'b110}});
endmodule
