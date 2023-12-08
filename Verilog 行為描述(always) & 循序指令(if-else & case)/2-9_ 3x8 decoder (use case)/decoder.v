`timescale 1ns/1ns

module decoder( in0, in1, in2, a, b, c, d, e, f, g, h);
input 	in0, in1, in2;
output  a, b, c, d, e, f, g, h;

wire 	[2:0] code;
reg		[7:0] decode;

assign	code = {in2, in1, in0};
assign	{ h, g, f, e, d, c, b, a} = decode;

always@(in2, in1, in0)
	case(code) 
		'b000 : decode = 8'b0000_0001;
		'b001 : decode = 8'b0000_0010;
		'b010 : decode = 8'b0000_0100;
		'b011 : decode = 8'b0000_1000;
		'b100 : decode = 8'b0001_0000;
		'b101 : decode = 8'b0010_0000;
		'b110 : decode = 8'b0100_0000;
		'b111 : decode = 8'b1000_0000;
		default : decode = 8'b0000_0000;			
	endcase




endmodule


