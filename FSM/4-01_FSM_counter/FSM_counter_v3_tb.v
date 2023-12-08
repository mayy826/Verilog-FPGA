`timescale 1 ns/1 ns

module FSM_counter_v3_tb();

reg   clk, rstn, start, skip;
wire  skip_to_five; 
wire  [7:0]count_out;
 



FSM_counter_v3 EX401_instance( 
				.clk(clk), 
				.rstn(rstn), 
				.start(start), 
				.skip(skip), 
				.skip_to_five(skip_to_five), 
				.count_out(count_out)	
							  );
								
parameter clkper=10;
								

always
begin
 #(clkper/2) clk =  ~clk;
end

									
initial
begin

 clk  	 = 'b0;
 rstn  	 = 'b0; 
 start	 = 'b0; 
 skip 	 = 'b0;
 

 #100
 rstn  	 = 'b1; 
 start	 = 'b1; 
 skip 	 = 'b0;
 
 #100
  
 skip 	 = 'b0;
 

 #100
 skip 	 = 'b1;

 #107 
 start	 = 'b1;  
 skip 	 = 'b0;


 #100 
 start	 = 'b1; 
 skip 	 = 'b0;
 


 

  
end
endmodule
