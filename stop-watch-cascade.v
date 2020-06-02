module stop_watch_cascade
(
input wire clk,
input wire go, clr,
output wire [3:0] d2, d1, d0
);

localparam DVSR = 5000000;
reg [22:0] ms_reg;
wire [22:0] ms_next;
reg [3:0] d2_reg, d1_reg, d0_reg;
wire [3:0] d2_next, d1_next, d0_next;
wire d1_en, d2_en, d0_en;
wire ms_tick, d0_tick, d1_tick;

always @(posedge clk)
	begin 
		ms_reg<=ms_next;
		d2_reg<=d2_next;
		d1_reg<=d1_next;
		d0_reg<=d0_next;
	end
// trang thai logic tiep 
assign ms_next=(clr||(ms_reg==DVSR&&go))?4'b0:
			   (go)?ms_reg+1:ms_reg;
assign ms_tick=(ms_reg==DVSR)?1'b1:1'b0;
// den 0.1s
assign d0_en=ms_tick;
assign d0_next=(clr||(d0_en&&d0_reg==9))?4'b0:
			   (d0_en)?d0_reg+1:d0_reg;
assign d0_tick=(d0_reg==9)?1'b1:1'b0;
// dem 1s
assign d1_en=ms_tick&&d0_tick;
assign d1_next=(clr||(d1_en&&d0_reg==9))?4'b0:
			   (d1_en)?d1_reg+1:d1_reg;
assign d1_tick=(d1_reg==9)?1'b1:1'b0;
// dem 10s
assign d2_en=ms_tick&d0_tick&d1_tick;
assign d2_next=(clr||(d2_en&&d2_reg==9))?4'b0:
			   (d2_en)?d2_reg+1:d2_reg;

// output 
assign d0=d0_reg;
assign d1=d1_reg;
assign d2=d2_reg;

endmodule
	