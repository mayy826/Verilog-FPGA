`timescale 1 ns/1 ns

module testbench();
reg		in0, in1, in2;
wire	a, b, c, d, e, f, g, h;

decoder EX209_instance( 
			.in0(in0), 
			.in1(in1), 
			.in2(in2), 
			.a(a), 
			.b(b), 
			.c(c), 
			.d(d), 
			.e(e), 
			.f(f), 
			.g(g), 
			.h(h)     );
		
initial
begin

 in0 =  1'b0;
 in1 =  1'b0;
 in2 =  1'b0;
 
 #20;
 in0 =  1'b1;
 in1 =  1'b0;
 in2 =  1'b1;
 
 #20;			
 in0 =  1'b1;
 in1 =  1'b1;
 in2 =  1'b1;
 
 #20;			
 in0 =  1'b0;
 in1 =  1'b0;
 in2 =  1'b1;
  
 
end
endmodule
