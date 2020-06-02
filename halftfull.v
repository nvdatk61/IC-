module half_add(x,y,s,c);
input x,y;
output s,c;
xor Sum(s,x,y);
and carry(c,x,y);
endmodule
module full_add(A,B,Ci,S,Co);
input A,B,Ci;
output S,Co;
wire S1,C1,C2;
half_add ps(A,B,S1,C1);
half_add sum(S1,Ci,S,C2);
or carry(Co, C1, C2);
endmodule
