`timescale 1 ns/1 ns

module blocking_tb();

reg		clk,rstn;
reg		[7:0] data;
wire	[7:0] q_a1_reg, q_a2_reg, q_a3_reg;


blocking EX305_instance( 
			.data(data),
			.clk(clk),
			.rstn(rstn),
		    .q_a1_reg(q_a1_reg),
			.q_a2_reg(q_a2_reg), 
			.q_a3_reg(q_a3_reg) 
			
				       );
								
parameter clkper=10;
								

always
begin
 #(clkper/2) clk =  ~clk;
end

									
initial
begin
 clk  = 'b0;
 data = 'b0;
 rstn = 'b0; 
 
 #5;
 rstn = 'b1;
 data = 'hfd;

 #30;
 data = 'h01;

 
 #30;
 data = 'hee;
  
 #10;
 data = 'h82;
 
  #5;
 data = 'h77;
 
  #25;
 data = 'hd4;
 
  
end
endmodule
