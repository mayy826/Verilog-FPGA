`timescale 1 ns/1 ns

module tb();
wire	q1, q2, q3;
reg		d, clk, rstn;



circuitdelaymodel EX302_instance( 
			.d(d),
			.clk(clk),
			.rstn(rstn),
			.q1(q1), 
			.q2(q2), 
			.q3(q3) 
				 );
								
parameter clkper=10;
								

always
begin
 #(clkper/2) clk =  ~clk;
end

									
initial
begin
 clk = 'b0;
 d    = 'b0;
 rstn = 'b0; 
 
 #5;
 d    = 'b1;
 rstn = 'b1; 

 #60;
 d    = 'b0;
 rstn = 'b1; 
 
 #10;
 d    = 'b1;
  
  #10;
 d    = 'b0;
 
 #10;
 d    = 'b1;
 
  #10;
 d    = 'b1;
  
  #10;
 d    = 'b0;
 
 #10;
 d    = 'b1;
 
  #10;
 d    = 'b1;
  
  #10;
 d    = 'b0;
 
 #10;
 d    = 'b1;
 
  #10;
 d    = 'b1;
  
  #10;
 d    = 'b0;
 
 #10;
 d    = 'b1;

  
end
endmodule
