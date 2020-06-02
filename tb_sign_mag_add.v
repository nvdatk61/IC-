module tb_sign_mag_add();
parameter N=5;
 reg [4:0] x, y;
 wire [4:0] s;
sign_mag_add #(5) add(x[4:0],y[4:0],s[4:0]);
initial 
begin
x=4'b01000;
y=4'b01000;
end
endmodule
