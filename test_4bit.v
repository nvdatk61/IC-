module tb_4bit();
reg [3:0]A;
reg [3:0]B;
reg Ci;
wire Co; 
wire [3:0] S;
full_adder_4bit M(A,B,Ci,S,Co);
initial begin
#10 A = 4'b0011;B=4'b0011;Ci = 1'b0; 
#10 A = 4'b1011;B=4'b0111;Ci = 1'b0; 
#10 A = 4'b1111;B=4'b1101;Ci = 1'b1; 
end
endmodule