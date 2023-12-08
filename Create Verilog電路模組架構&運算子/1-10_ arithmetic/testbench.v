`timescale 1ns/1ns

module testbench();
reg	 [7:0] a,b;
reg	 [15:0] c;
wire [15:0] d;

multiadder EX110_instance(
	.a(a),
	.b(b),
	.c(c),
	.d(d));

initial
begin
 a 	  = 'h00;
 b 	  = 'h00;
 c 	  = 'h0000;
 
 #10;  
 a 	  = 'h01;
 b	  = 'h01;
 c	  = 'hffff;
 #10;  
 a 	  = 'h00;
 b	  = 'h01;
 c	  = 'hffff;
 #10;  
 a 	  = 'h01;
 b	  = 'h0f;
 c	  = 'h0010;


 
end

endmodule
