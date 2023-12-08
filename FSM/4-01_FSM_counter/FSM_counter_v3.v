`timescale 1 ns/1 ns

module FSM_counter_v3( clk, rstn, start, skip, skip_to_five, count_out);
	input 	clk, rstn, start, skip;
	output	skip_to_five; 
	output	[7:0] count_out;
	
	reg		[7:0] Next_Count,count_out; 
	reg		skip_to_five;
	
	//sequential circuit
	always@(posedge clk or negedge rstn)
	begin
		if(!rstn)
		count_out	 <= 'd0;		
		else 
		count_out	 <= Next_Count;
		//skip_to_five <= Next_Skip_to_five;
	end
	
	//combinational circuit
	always@(*)
	begin
		skip_to_five <= 'b0;
		case(count_out)
		8'd0 : if(start == 1'b1)
				Next_Count <= 'd7;		 
		8'd7 : if(skip == 1'b1)
				Next_Count <= 'd3;
			  else
				Next_Count <= 'd1;
		8'd1 : if(skip == 1'b1)
				Next_Count <= 'd2;
			  else
				Next_Count <= 'd3;
		8'd3 : if(skip == 1'b1)begin
				Next_Count   <= 'd5;
				skip_to_five <= 'b1;
				end
			   else
				Next_Count <= 'd2;
		8'd2 : if(skip == 1'b1)
				Next_Count <= 'd11;
			   else
				Next_Count <= 'd5;
		8'd5 : if(skip == 1'b1)begin
				Next_Count <= 'd13;
				
				end
			  else
				Next_Count <= 'd11;
		8'd11 : Next_Count <= 'd13;
		8'd13 : Next_Count <= 'd7;
		default : begin
				  Next_Count <='d0;
				  skip_to_five <= 'b0;
				  end
		endcase	
	end
	
	
		
endmodule
