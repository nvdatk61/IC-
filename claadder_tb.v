module cla_tb();
reg [3:0] a,b;
reg c_in;
wire [3:0] sum;
wire c_out;
fulladd4 M1(sum, c_out, a, b, c_in);
initial 
begin
c_in = 1;
for (a = 0; a<16; a = a+1) begin
	for (b = 0; b<16; b = b+1) begin #5;
end
end
end
endmodule