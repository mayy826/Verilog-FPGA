`timescale 1 ns/1 ns

module register_tb();
wire	[7:0] q;
reg		[7:0] data;
reg     clk, rstn, en;


register EX304_instance( 
			.data(data),
			.en(en),
			.clk(clk),
			.rstn(rstn),
		    .q(q) 
				 );
								
parameter clkper=10;
								

always
begin
 #(clkper/2) clk =  ~clk;
end

									
initial
begin
 clk  = 'b0;
 en   = 'b0;
 data = 'b0;
 rstn = 'b0; 
 
 #5;
 data = 'hfd;
 en   = 'b1; 

 #30;
 data = 'h01;
 en   = 'b1; 
 
 #30;
 data   = 'hee;
  
 #10;
 data    = 'h82;
 
  #5;
 data    = 'h77;
 
  #25;
 data    = 'hd4;
 
 
  
end
endmodule
