`timescale 1ns/1ns

module testbench();
reg	 [2:0] a;
wire [7:0] b;

threeto8decoder EX106_instance(
	.a(a),
	.b(b)	);

initial
begin
 a 	  = 'b000;
 
 #10;  
 a 	  = 'b001;
 #10;  
 a	  = 'b111;
 #10;  
 a	  = 'b101;

 
 
end

endmodule
