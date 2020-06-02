module full_add_tb();
reg A,B,Ci;
wire S,Co;
full_add m(A,B,Ci,S,Co);
initial
begin
A = 1; B =1; Ci = 0;
#5 A = 1; B =1; Ci = 1;
#5 A = 0; B = 0; Ci = 1;
#5 A = 1; B = 1; Ci = 1;
#5 A = 0; B = 1; Ci = 0;
#5 A = 0; B = 1; Ci = 1;
end
endmodule
