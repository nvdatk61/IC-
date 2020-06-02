module hex_to_sseg ( 
input wire [3:0] hex, 
input wire dp, 
output reg [7:0] sseg // output active low 
); 
always @* 
begin 
case(hex) 
4'h0: sseg [6:0] = 7'b0000001; 
4'h1: sseg [6:0] = 7'b1001111; 
4'h2: sseg [6:0] = 7'b0010010; 
4'h3: sseg [6:0] = 7'b0000110; 
4'h4: sseg [6:0] = 7'b1001100; 
4'h5: sseg [6:0] = 7'b0100100;
4'h6: sseg [6:0] = 7'b0100000; 
//4'h7: sseg [6:0] = 7'b000l1ll; 
4'h7: sseg [6:0] = 7'b0001111;
4'h8: sseg [6:0] = 7'b0000000; 
4'h9: sseg [6:0] = 7'b0000100; 
4'ha: sseg [6:0] = 7'b0001000; 
4'hb: sseg [6:0] = 7'b1100000; 
//4'hc: sseg [6:0] = 7'b0110001; 
4'hc: sseg [6:0] = 7'b0110001;
//4'hd: sseg [6:0] = 7'bl0000l0; 
4'hd: sseg [6:0] = 7'b1000010;
4'he: sseg [6:0] = 7'b0110000; 
default: sseg [6:0] = 7'b0111000; //4 'hf 
endcase 
sseg [7] = dp; 
end 
endmodule
module disp_mux
(
input wire clk, reset, 
input [7:0] in3, in2, in1, in0, 
output reg [3:0] an, 
output reg [7:0] sseg  
);
localparam N = 4;
reg [N-1:0] q_reg; 
wire [N-1:0] q_next; 
always @(posedge clk , posedge reset) 
	if(reset) 
		q_reg <= 0; 
	else 
		q_reg <= q_next; 
	assign q_next = q_reg + 1;
always @*
	case(q_reg [N-1:N-2]) 
		2'b00: 
			begin 
				an = 4'b1110; 
				sseg = in0; 
			end 
		2'b01: 
			begin 
				an = 4'b1101; 
				sseg = in1; 
			end 
		2'b10: 
			begin 
				an = 4'b1011; 
				sseg = in2; 
			end 
		default: 
			begin 
				an = 4'b0111; 
				sseg = in3; 
			end 
	endcase 
endmodule  
module hex_to_sseg_test(clk,sw,an,sseg);
input clk;
input [7:0] sw;
output [3:0] an;
output [7:0] sseg;
wire [7:0] inc; 
wire [7:0] led0, led1, led2, led3;  
assign inc = sw + 1;  
hex_to_sseg sseg_unit_0 (.hex(sw[3:0]), .dp(1'b0), .sseg(led0));  
hex_to_sseg sseg_unit_1 (.hex(sw[7:4]), .dp(1'b0), .sseg(led1));  
hex_to_sseg sseg_unit_2 (.hex(inc[3:0]), .dp(1'b1), .sseg(led2)); 
hex_to_sseg sseg_unit_3 (.hex(inc[7:4]), .dp(1'b1), .sseg(led3));
disp_mux disp_unit (.clk(clk), .reset(1'b0), .in0(led0), .in1(led1), 
.in2(led2), .in3(led3), .an(an), .sseg(sseg));
endmodule

