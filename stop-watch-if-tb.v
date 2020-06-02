module stop_watch_if_tb();
  
reg clk;
reg  go, clr;  
wire [3:0] d2,d1,d0; 

stop_watch_if dmm(clk,go,clr,d2,d1,d0);

initial begin
  clk=0;forever #5 clk=~clk;
end

initial
begin
	clr=1;go=0;#10;
	clr=0;go=0;#10;
	clr=0;go=1;
end 
endmodule  