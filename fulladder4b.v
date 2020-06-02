module full_adder(A,B,Ci,S,Co);
input A,B,Ci;
output S,Co;
assign S = A^B^Ci;
assign Co = (A&B)|(Ci&(A^B));
endmodule
module full_adder_4bit(A,B,Ci,S,Co);
input [3:0] A;
input [3:0] B;
input Ci;
output [3:0] S;
output Co;
wire C1,C2,C3;
full_adder f1(A[0],B[0],Ci,S[0],C1);
full_adder f2(A[1],B[1],C1,S[1],C2);
full_adder f3(A[2],B[2],C2,S[2],C3);
full_adder f4(A[3],B[3],C3,S[3],Co);
endmodule

