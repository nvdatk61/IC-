module stop_watch_test_tb();
reg clk;
reg  [1:0]  btn;  
wire [3:0] an; 
wire [7:0] sseg;
stop_watch_test dmm(clk,btn,an,sseg);
initial begin
clk = 0;
btn = 2'b00;
end
always #10 clk=~clk;
always #20 btn=btn+1;
endmodule  