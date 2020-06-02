module ram_tb();
parameter picture_size =28;
parameter SIZE_1=16;
parameter SIZE_2=16;
parameter SIZE_4=16;
parameter SIZE_9=16;
parameter SIZE_address_pix=16;
parameter SIZE_address_pix_t=16;
parameter SIZE_address_wei=16;

reg clk;
reg signed [SIZE_1-1:0] dp;   //write data
reg signed [(SIZE_2)*1-1:0] dtp;   //write data
reg signed [SIZE_9-1:0] dw;   //write weight
reg we_p,we_tp,we_w;
wire signed [SIZE_1-1:0] qp;       //read data
wire signed [(SIZE_2)*1-1:0] qtp;       //read data
wire signed [SIZE_9-1:0] qw;      //read weight
reg re_p,re_tp,re_w;
reg [SIZE_address_pix-1:0] write_addressp, read_addressp;
reg [SIZE_address_pix_t-1:0] write_addresstp, read_addresstp;
reg [SIZE_address_wei-1:0] write_addressw, read_addressw;


RAM DUT(qp,qtp,qw,dp,dtp,dw,write_addressp,read_addressp,write_addresstp
,read_addresstp,write_addressw,read_addressw,we_p,we_tp,we_w,re_p,re_tp,re_w,clk);

initial begin
clk=1'b0;
forever #10 clk=~clk;
end
initial begin
dp=1;
dtp=2;
dw=3;
end
initial begin
we_p=0;
we_tp=0;
we_w=0;
re_p=0;
re_tp=0;
re_w=0;
#10
we_p=1;
we_tp=1;
we_w=1;
re_p=0;
re_tp=0;
re_w=0;
#20
we_p=0;
we_tp=0;
we_w=0;
re_p=0;
re_tp=0;
re_w=0;
#10
we_p=0;
we_tp=0;
we_w=0;
re_p=1;
re_tp=1;
re_w=1;
#20
we_p=0;
we_tp=0;
we_w=0;
re_p=0;
re_tp=0;
re_w=0;
end
initial begin
#10
write_addressp=4;
write_addresstp=5;
write_addressw=6;
read_addressp=4;
read_addresstp=5;
read_addressw=6;
end
endmodule

