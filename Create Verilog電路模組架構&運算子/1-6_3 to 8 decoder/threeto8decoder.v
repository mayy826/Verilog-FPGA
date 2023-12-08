`timescale 1ns/1ns

module threeto8decoder(a,b);
input 	[2:0] a;
output 	[7:0] b;
wire 		[7:0] b;

assign b = (a=='b000)?'b0000_0001:
			  (a=='b001)?'b0000_0010:
			  (a=='b010)?'b0000_0100:
			  (a=='b100)?'b0000_1000:
			  (a=='b100)?'b0001_0000:
			  (a=='b101)?'b0010_0000:
			  (a=='b110)?'b0100_0000:
			  (a=='b111)?'b1000_0000:'b0000_0000;			  


endmodule
