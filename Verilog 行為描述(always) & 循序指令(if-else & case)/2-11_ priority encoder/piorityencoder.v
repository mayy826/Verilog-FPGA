`timescale 1ns/1ns

module piorityencoder( a, b, c, d, e, f, g, h, out0, out1, out2);
input 	a, b, c, d, e, f, g, h;
output  out0, out1, out2;

wire 	[7:0] code;
reg	[2:0] encode;

assign	code = {h, g, f, e, d, c, b, a};
assign	{out2, out1, out0} = encode;

always@(h or g or f or e or d or c or b or a)
begin
	casex(code) 
		'bxxxx_xxx1 : encode = 3'b000;
		'bxxxx_xx10 : encode = 3'b001;
		'bxxxx_x100 : encode = 3'b010;
		'bxxxx_1000 : encode = 3'b011;
		'bxxx1_0000 : encode = 3'b100;
		'bxx10_0000 : encode = 3'b101;
		'bx100_0000 : encode = 3'b110;
		'b1000_0000 : encode = 3'b111;
		default     : encode = 3'b000;			
	endcase
end

endmodule


