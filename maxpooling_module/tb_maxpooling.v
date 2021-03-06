`timescale  1ns / 1ns
module maxp_TB();
parameter SIZE_1=11;
parameter SIZE_2=22;
parameter SIZE_3=33;
parameter SIZE_4=44;
parameter SIZE_address_pix=13;
// in/output
reg clk,maxp_en;
wire STOP;
reg [SIZE_address_pix-1:0] memstartp,memstartzap;
wire[SIZE_address_pix-1:0] read_addressp,write_addressp;
wire re,we;
reg [SIZE_1-1:0] qp;
wire signed [SIZE_1-1:0] dp;
reg [4:0] matrix;
reg [9:0] matrix2;
//maxp mp(.clk(clk),.maxp_en(maxp_en),.memstartp(memstartp)
//,.memstartzap(memstartzap),.read_addressp(read_addressp),.write_addressp(write_addressp)
//,.re(re),.we(we),.qp(qp),.dp(dp),.STOP(STOP),.matrix2(maxtrix2),.matrix(maxtrix));
//body
maxp mp (clk,maxp_en,memstartp,memstartzap,read_addressp,write_addressp,re,we,qp,dp,STOP,matrix2,matrix);
initial 
begin 
  clk = 0;
  forever #100 clk = ~clk;
end 
initial
 begin 
 maxp_en = 0;
#50;
maxp_en= 1;
 end
 initial
 begin 
 maxp_en = 0;
#50;
maxp_en= 1;
 end
 initial 
 begin 
 #200;
 memstartp = 0;
 memstartzap = 0;
 qp=0;
 matrix = 0;
 matrix2 = 0;
 #200;

#100;
memstartp = 100;
#100;
memstartzap = 500;
#100;
matrix = 70;
#100;
matrix2 = 75;
#100;
end

initial
begin
#500 qp= 20;
#200 qp=40;
#200 qp=15;
#200 qp=75;
#200 qp=95;
#200 qp=60;
#200 qp=80;
#200 qp=120;
#200 qp=50;
#200 qp=10;
end

endmodule

