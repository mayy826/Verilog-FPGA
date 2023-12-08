`timescale 1ns/1ns

module alwayslatch ( a, b, c, d, sel, sel2, reset);
input 	a, b, sel, sel2, reset;
output  c, d;
reg 	c, d;

always@(a or sel)
begin
	if(sel==1'b1)
		c <= a;
	else
		c <= c;
end

always@(b or sel2 or reset)
begin
	if(sel2==1)
		d <= b;
	else if(reset==1)
		d <= 1'b0;
	else
		d <= d;
end



endmodule


