module led7doan_tb();
reg clk;
reg [7:0] sw;
wire [3:0] an;
wire [7:0] sseg;
hex_to_sseg_test T(clk,sw,an,sseg);
initial
 begin 
 clk = 0;
forever #7 clk = ~clk;
end 
initial
begin
sw = 8'b00001111;
#5  sw = 8'b01011010;
#5  sw = 8'b10011100;
#5  sw = 8'b01001100;
#5  sw = 8'b10111000;
end
endmodule
