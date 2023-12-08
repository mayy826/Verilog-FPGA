`timescale 1ns/1ns

module multiadder(a,b,c,d);
input 	[7:0]  a,b;
input 	[15:0] c;
output  [15:0] d;
wire 	[15:0] d;
wire 	[15:0] tmp,tmp1;

assign tmp  = a * b;
assign tmp1 = c << 2 ;
assign d    = tmp + tmp1;

endmodule
