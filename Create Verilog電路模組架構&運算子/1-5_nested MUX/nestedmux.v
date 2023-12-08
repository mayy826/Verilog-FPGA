`timescale 1ns/1ns


module	nestedmux(a,b,c,d,e,f,sel1,sel2,sel3);
input		[3:0] a,b,d,e;
input				sel1, sel2, sel3;
output	[3:0] c,f;
wire 		[3:0] c,f;


assign c = (sel1 == 1)? a :
			  (sel2 == 1)? b :
			  (sel3 == 1)? d : e ;
			  
assign f = (sel1 == 1)? ((sel2 == 1)? a : b) :
						((sel3 == 1)? d : e) ;

endmodule
