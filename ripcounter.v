module edge_dff(q, qbar, d, clk, clear); 
output q,qbar;
input d, clk, clear; 
wire s, sbar, r, rbar,cbar;  
assign cbar = ~clear; 
assign  
	sbar = ~(rbar & s),         
	s = ~(sbar & cbar & ~clk),         
	r = ~(rbar & ~clk & s),         
	rbar = ~(r & cbar & d); 
assign  
	q = ~(s & qbar),         
	qbar = ~(q & r & cbar); 
endmodule 
module T_FF(q, clk, clear); 
output q; 
input clk, clear; 
edge_dff ff1(q, ,~q, clk, clear); 
endmodule
module counter(Q , clock, clear); 
output [3:0] Q; 
input clock, clear; 
T_FF tff0(Q[0], clock, clear); 
T_FF tff1(Q[1], Q[0], clear); 
T_FF tff2(Q[2], Q[1], clear); 
T_FF tff3(Q[3], Q[2], clear); 
endmodule  
