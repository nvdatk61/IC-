module disp_mux_test_tb();
reg clk;
reg [3:0] btn;
reg [7:0] sw;
wire [3:0] an;
wire [7:0] sseg;

disp_mux_test unit(.clk(clk),.btn(btn),.sw(sw),.an(an),.sseg(sseg));

initial begin
  clk=0;forever #10 clk=~clk;
end
initial begin
  sw = 00000000;
  btn = 1000;
  #20;
  sw = 11110000;
  btn = 0100;
  #20;
  sw = 00001111;
  btn = 0010;
  #20;
  sw = 11111111;
  btn = 0001;
end
endmodule

