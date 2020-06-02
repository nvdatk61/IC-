module relu6_tb();
reg [3:0] A;
wire [3:0] B;
relu6 utt(A,B);
initial
begin
A = 4'b0101;
#5 A = 4'b1001;
#5 A = 4'b0100;
#5 A = 4'b0011;
#5 A = 4'b0111;
end
endmodule
