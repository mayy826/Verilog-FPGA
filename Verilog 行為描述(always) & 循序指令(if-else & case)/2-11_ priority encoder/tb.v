`timescale 1 ns/1 ns

module tb();
wire	out0, out1, out2;
reg	a, b, c, d, e, f, g, h;

piorityencoder EX211_instance( 
			.a(a), 
			.b(b), 
			.c(c), 
			.d(d), 
			.e(e), 
			.f(f), 
			.g(g), 
			.h(h),
			.out0(out0), 
			.out1(out1), 
			.out2(out2)
							);
		
initial
begin

 {h, g, f, e, d, c, b, a}= 8'b0000_0000;

 #20;
 {h, g, f, e, d, c, b, a}= 8'b0000_0001;
 
 #20;			
 {h, g, f, e, d, c, b, a}= 8'b0010_0000;
 
 #20;			
 {h, g, f, e, d, c, b, a}= 8'b1000_0000;
  
 
end
endmodule
