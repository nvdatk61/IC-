module  stop_watch_test 
( 
input    wire   clk, 
input    wire   [1:0] btn, 
output    wire   [3:0] an, 
output    wire   [7:0]  sseg 
); 
//  s i g n a l   d e c l a r a t i o n  
wire   [3:0]  d2, d1, d0;  
//  i n s t a n t i a t e   7 _ s e g   LED  d i s p l a y   module 
disp_hex_mux  disp_unit 
(.clk(clk),  .reset(1'b0), 
.hex3 (4'b0), .hex2 (d2),  .hex1 (d1), .hex0 (d0), 
. dp_in(4'b1101),  . an(an),  .sseg(sseg)); 
//  i n s t a n t i a t e   s t o p w a t c h  
stop_watch_if  counter_unit 
(.clk(clk),  .go(btn[1]),  .clr(btn[0]), 
.d2(d2), .d1(d1), .d0(d0)); 
endmodule 