`timescale 1 ns/1 ns

module handshake( clk, rstn, req_in, ack_out, data_in, sum_out);
	input 	clk, req_in, rstn;
	input   [7:0] data_in;
	output	ack_out;
	output  [15:0] sum_out;
	
	reg		[15:0] sum_out;
	reg		ack_out;
	wire		req_in_r, req_in_f
	reg		req_in_d1,req_in_d2;

	
	assign req_in_r = req_in_d1& ~req_in_d2;
	assign req_in_f = ~req_in_d1 & req_in_d2;
	
	
	//every clk update req_in delay//
	always@(posedge clk or negedge rstn)
	begin
		if(!rstn)begin
			req_in_d1 <= 1'b0;
			req_in_d2 <= 1'b0;
			end
		else begin
			req_in_d1 <= #10 req_in;
			req_in_d2 <= #20 req_in;
			end		
	end	
	
	
	always@(posedge clk or negedge rstn)
	begin
		if(!rstn)begin
			sum_out <= 'h0000;
			ack_out <= 1'b0;
			end
		else 
		  if(req_in_r == 1'b1)begin
			sum_out <= sum_out + {{8{data_in[7]}},data_in};
			ack_out <= 1'b1;
			end
		  else 
		  if (req_in_f == 1'b1)		  
			ack_out <= 1'b0;
			
	end
endmodule
