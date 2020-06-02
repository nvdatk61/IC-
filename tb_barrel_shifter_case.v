module tb_barrel_shifter_case();

 reg [7:0] a;
 reg [2:0] amt ;
 wire [7:0] y;

barrel_shifter_case V (a,amt,y);
initial 
begin
a=8'b10010111; amt=3'b001;
#25
amt=3'b010;
#25
amt=3'b100;
#25
amt=3'b111;
end
endmodule
