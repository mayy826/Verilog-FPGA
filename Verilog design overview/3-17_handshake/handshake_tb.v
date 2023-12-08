`timescale 1 ns/1 ns

module handshake_tb();

reg   clk, req_in, rstn;
reg   [7:0] data_in;
wire  ack_out;
wire  [15:0] sum_out;



handshake EX317_instance( 
				.clk(clk), 
				.rstn(rstn), 
				.req_in(req_in), 
				.ack_out(ack_out), 
				.data_in(data_in), 
				.sum_out(sum_out)	
							  );
								
parameter clkper=10;
								

always
begin
 #(clkper/2) clk =  ~clk;
end

									
initial
begin

 clk  	 = 'b0;
 req_in  = 'b0; 
 rstn 	 = 'b0; 
 data_in = 'h0000;
 
// @(posedge ack_out);
 #100
 req_in  = 'b1; 
 rstn 	 = 'b1;
 data_in = 'h4441;
 
// @(posedge ack_out);
 #100
 req_in  = 'b0; 
 data_in = 'h51;
 

 #100
 req_in  = 'b1; 
 rstn 	 = 'b1;
 data_in = 'h1111;
 

#100
req_in  = 'b0; 
data_in = 'h0000;
 
 //@(posedge ack_out);
 #100
 req_in  = 'b1; 
 rstn 	 = 'b1;
 data_in = 'h1001;

//@(posedge ack_out);
#100
req_in  = 'b0; 
data_in = 'h0000;
 
//@(posedge ack_out);
 #100
 req_in  = 'b1; 
 rstn 	 = 'b1;
 data_in = 'hffff;
 
 //@(posedge ack_out);
 #100
 req_in  = 'b0; 
 data_in = 'h0000;
 
 //@(posedge ack_out);
 #100
 req_in  = 'b1; 
 rstn 	 = 'b1;
 data_in = 'h0001f;
 
 //@(posedge ack_out);
 #100
 req_in  = 'b0; 
 data_in = 'h0000;
 
// @(posedge ack_out);
 #500
 req_in  = 'b1; 
 rstn 	 = 'b0;
 data_in = 'h1001;
 
 

  
end
endmodule
