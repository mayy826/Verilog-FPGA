`timescale 1 ns/1 ns

module updown_counter_tb();

reg		clk,rstn,load;
reg		[15:0] upper_lim, down_lim, data;
wire	[15:0] count;

updown_counter EX312_instance( 
			.data(data),
			.clk(clk),
			.rstn(rstn),
		    .load(load),
			.upper_lim(upper_lim), 
			.down_lim(down_lim),
			.count(count)			
							  );
								
parameter clkper=10;
								

always
begin
 #(clkper/2) clk =  ~clk;
end

									
initial
begin

 clk  = 'b0;
 data = 16'd20;
 rstn = 'b0; 
 load = 'b1;
 upper_lim = 16'd32;
 down_lim  = 16'd2;
 
 #5
 rstn = 'b1; 
 load='b0;
 
 #10
 load='b1;
 
 #50
 load='b0;
 

  
end
endmodule
