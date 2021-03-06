module conv_tb();
reg clk;
wire signed [44:0] Y1;
reg [1:0] prov;
reg [4:0] matrix;
reg [9:0] matrix2;
reg [9:0] i;
reg signed [22:0] w1,w2,w3,w4,w5,w6,w7,w8,w9;
reg signed [22:0] w11,w12,w13,w14,w15,w16,w17,w18,w19;
reg conv_en;
reg dense_en;
con_v #(.SIZE(23)) DUT(
.prov(prov),
.matrix(matrix),
.matrix2(matrix2),
.i(i),
.w1(w1),.w2(w2),.w3(w3),.w4(w4),.w5(w5),.w6(w6),.w7(w7),.w8(w8),.w9(9),
.w11(w11),.w12(w12),.w13(w13),.w14(w14),.w15(w15),.w16(w16),.w17(w17),.w18(w18),.w19(w19),
.conv_en(conv_en),
.dense_en(dense_en)
);
initial begin
clk=1'b0;
conv_en=1'b0;
dense_en=1'b0;
forever 
#10 clk=~clk;
#10 conv_en=~conv_en;
#10 dense_en=~dense_en;
end
initial begin
#10 prov=2'b10;
#20 prov=2'b11;
#30 prov=2'b10;
#40 prov=2'b11;
#50 prov=2'b10;
#60 prov=2'b11;
#70 prov=2'b10;
#80 prov=2'b11;
end
initial begin
matrix= 5'b10101;
end
initial begin
matrix2= 10'b1101110100;
end
initial begin 
i=10'b0011011100;
end
initial begin
w1=23'b00000000000000000000001;
w2=23'b00000000000000000000000;
w3=23'b00000000000000000000000;
w4=23'b00000000000000000000001;
w5=23'b00000000000000000000001;
w6=23'b00000000000000000000000;
w7=23'b00000000000000000000001;
w8=23'b00000000000000000000001;
w9=23'b00000000000000000000001;
//w1=23'b00000000000000000000001;
end
initial begin
w11=23'b00000000000000000000001;
w12=23'b00000000000000000000000;
w13=23'b00000000000000000000001;
w14=23'b00000000000000000000000;
w15=23'b00000000000000000000001;
w16=23'b00000000000000000000000;
w17=23'b00000000000000000000001;
w18=23'b00000000000000000000000;
w19=23'b00000000000000000000001;
end
endmodule

