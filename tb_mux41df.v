module tb_mux41;
reg IN0, IN1, IN2, IN3; 
reg S1, S0;

wire OUTPUT;

mux4to1 mymux(OUTPUT, IN0, IN1, IN2, IN3, S1, S0);

initial
begin
 
 IN0 = 1; IN1 = 0; IN2 = 1; IN3 = 0;
  
 S1 = 0; S0 = 0;
 #5
 S1 = 0; S0 = 1;
 #5
 S1 = 1; S0 = 0;
 #5
 S1 = 1; S0 = 1;
 #5 ;
end
endmodule 
