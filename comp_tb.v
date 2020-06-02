module comp_tb();
wire AgtB,AltB,AeqB;
reg [2:0]A,B;
comp_4b M1(AgtB,AltB,AeqB,A[1:0],B[1:0]);
//initial @monitor("%t A:%h B:%h AgtB:%b AltB:%b AeqB:%B", 
//$time, A[1:0], B[1:0], AgtB, AltB, AeqB);
//initial #2000 $finish;
initial begin
#5 for(A=0; A<4; A = A+1) begin 
	for(B=0;B<4;B=B+1)begin #5;
	end
end
end
endmodule
