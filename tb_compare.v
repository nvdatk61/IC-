module tComp_2();
wire 	A_gt_B, A_lt_B, A_eq_B;
reg 	[1:0] A;
reg [1:0]B;	
Comp_2 m(A_gt_B, A_lt_B,A_eq_B, A,B);
//initial #2000 $finish;		
initial 
begin 
#5 for (A = 0; A < 4; A = A + 1) 
	begin 	     
       	  for (B = 0; B < 4; B = B + 1) 
	    begin #5;  
       end 
     end 
end
endmodule

