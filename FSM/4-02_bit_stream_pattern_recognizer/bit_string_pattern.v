`timescale 1 ns/1 ns

module bit_string_pattern( clk, rstn, bit_in, match);
	input 	clk, rstn, bit_in;
	output	match; 	
	
	reg		match; 
	reg		[2:0] beforematch;
	
	//sequential circuit
	always@(posedge clk or negedge rstn)
	begin
		if(!rstn)begin
		match	 	<= 1'b0;
		beforematch <= 3'd0;
		end
		else 
		 case(beforematch)
		 //ZERO前置
		 'd0 : if(bit_in == 1'b1)begin
				beforematch <= 3'd1;
				match		<= 1'b0;
				end
			else begin
				beforematch <= 3'd0;
				match		<= 1'b0;
				end
		 //P : 1	
		 'd1 : if(bit_in == 1'b1)begin
				beforematch <= 3'd2;
				match		<= 1'b0;
				end
		       else begin
				beforematch <= 3'd0;
				match		<= 1'b0;
			    end
		 // A : 0
		 'd2 : if(bit_in == 1'b0)begin
				beforematch <= 3'd3;
				match		<= 1'b0;
				end
		       else begin
				beforematch <= 3'd2;
				match		<= 1'b0;
				end
				
		 //B  : 1
		 'd3 : if(bit_in == 1'b1)begin
				beforematch <= 3'd4;
				match		<= 1'b0;
				end
		       else begin
				beforematch <= 3'd0;
				match		<= 1'b0;
				end
		
		//C  :  1
		 'd4 :  if(bit_in == 1'b1)begin
				beforematch <= 3'd2;
				match		<= 1'b1;
				end
			else begin
				beforematch <= 3'd0;
				match		<= 1'b0;
				end
				
		 default:
				beforematch <= 3'd0; 
		endcase		
	end
	
	endmodule
	