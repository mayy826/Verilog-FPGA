`timescale 1ns/1ns

module testbench;
reg	[3:0] a,b,d,e;
reg	      sel1,sel2,sel3;
wire 	[3:0] c,f;

nestedmux EX105_instance(
	.a(a),
	.b(b),
	.c(c),
	.d(d),
	.e(e),
	.f(f),
	.sel1(sel1),
	.sel2(sel2),
	.sel3(sel3)
	);

initial
begin
 a 	  = 'b0000;
 b 	  = 'b0000;
 e 	  = 'b0000;
 d 	  = 'b0000;
 sel1 = 'b0;
 sel2 = 'b0;
 sel3 = 'b0;
 
 #20;  // sel1:sel2:sel3=0:0:1 c=f=d,
 sel3 = 'b1;
 d	  = 'b0101;
 
 #10;  // sel1:sel2:sel3=1:0:1 c=a,f=b;
 sel1 = 'b1;
 a	  = 'b1100;
 b	  = 'b1001;
  
 
end

endmodule
