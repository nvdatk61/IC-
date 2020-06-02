module stimulus; 
reg CLOCK, CLEAR; 
wire [3:0] Q; 
initial         
	$monitor($time, " Count Q = %b Clear= %b",  Q[3:0],CLEAR);
counter c1(Q, CLOCK, CLEAR); 
initial 
begin         
	CLEAR = 1'b1;         
	#34 CLEAR = 1'b0;        
	#200 CLEAR = 1'b1;         
	#50 CLEAR = 1'b0; 
end
initial 
begin         
	CLOCK = 1'b0;         
	forever #10 CLOCK = ~CLOCK; 
end 
initial 
begin         
	#400 $finish; 
end  
endmodule   