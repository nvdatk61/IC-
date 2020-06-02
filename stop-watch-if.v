module  stop_watch_if 
( 
input wire clk , 
input wire go, clr, 
output wire [3:0] d2, d1, d0 
) ;  
  
localparam   DVSR  =  5000000; 
reg   [22:0]  ms_reg; 
wire  [22:0]  ms_next ; 
reg   [3:0]  d2_reg, d1_reg, d0_reg; 
reg   [3:0]  d2_next ,  d1_next , d0_next ; 
wire   ms_tick; 
 
always @(posedge clk) 
	begin  
		ms_reg<=ms_next; 
		d2_reg<=d2_next; 
		d1_reg<=d1_next; 
		d0_reg<=d0_next; 
	end 

assign ms_next=(clr||(ms_reg==DVSR &&go))?4'b0:(go)?ms_reg+1:ms_reg ; 
assign ms_tick=(ms_reg==DVSR)?1'b1:1'b0; 

always  @*  
	begin  
		d0_next  =  d0_reg; 
		d1_next  =  d1_reg; 
		d2_next  =  d2_reg; 
		if (clr) 
			begin  
				d0_next = 4'b0; 
				d1_next = 4'b0; 
				d2_next = 4'b0; 
			end 
		else if(ms_tick) 
			if (d0_reg != 9) 
				d0_next  = d0_reg  +  1; 
			else
				begin  
					d0_next = 4'b0; 
					if (d1_reg !=9) 
						d1_next=d1_reg + 1; 
					else   //  reach  X99 
						begin  
							d1_next  =  4'b0; 
							if(d2_reg !=9)
								d2_next  =  d2_reg + 1; 
							else   //  reach 999 
								d2_next = 4'b0; 
						end 
					end 
				end 
				
assign   d0  =  d0_reg; 
assign   d1  =  d1_reg; 
assign   d2 =  d2_reg; 
endmodule 