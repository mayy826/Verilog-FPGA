`timescale 1 ns/1 ns

module testbench();
reg	a, b, sel, sel2, reset;
wire	c, d;

alwayslatch latch_instance(
		.a(a), 
		.b(b), 
		.c(c),
		.d(d)//,
		//.reset(reset),
		//.sel(sel),
		//.sel2(sel2) 
); 
		
initial
begin

 a	= 1'b0;
 sel	= 1'b0;
 b	= 1'b0;
 sel2   = 1'b0;
 reset  = 1'b0;

 #20;
 a	= 1'b1;
 sel	= 1'b1; 
 b	= 1'b1;
 sel2   = 1'b0;
 reset  = 1'b0;
			
 
 #20;			// Time = 75
 a	= 1'b0;
 sel	= 1'b1; 
 b	= 1'b1;
 sel2   = 1'b0;
 reset  = 1'b1;
 
 #20;			// Time = 101
 a	= 1'b1;
 sel	= 1'b1; 
 b	= 1'b0;
 sel2   = 1'b1;
 reset  = 1'b0;
 
 #20;			// Time = 201
 a	= 1'b0;
 sel	= 1'b1; 
 b	= 1'b1;
 sel2   = 1'b1;
 reset  = 1'b0;
 
 
end
endmodule
