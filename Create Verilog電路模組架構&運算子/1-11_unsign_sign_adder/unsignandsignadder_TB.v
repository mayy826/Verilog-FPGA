`timescale 1 ns/1 ns

module unsignandsignadder_tb;

reg		[7:0]  a, b, c;
wire	[15:0] k_usgn, k_sgn;

unsignandsignadder EX111_instance(
		.a(a), 
		.b(b), 
		.c(c),
		.k_usgn(usgn),
		.k_sgn(sgn)	   );
		
initial
begin
 a		= 8'd0;
 b		= 8'd0;
 c		= 8'd0;
 
 
 #20;			// Time = 75
 a		= 8'd30;
 b		= 8'd255;
 c		= 8'd255;
 
 #20;			// Time = 101
 a		= 8'd255;
 b		= 8'd255;
 c		= 8'd255;
 #20;			// Time = 201
 a		= 8'd30;
 b		= 8'd1;
 c		= 8'd1;
 
 
end
endmodule
