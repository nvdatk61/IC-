module tb_encoder;
reg [4:1] r;
wire [2:0] y;
prio_encoder myencoder(r,y);
initial begin
r=4'b000;#10;
r=4'b001;#10;
r=4'b010;#10;
r=4'b011;#10;
r=4'b100;#10;
r=4'b101;#10;
r=4'b110;#10;
r=4'b111;#10;
end
endmodule
