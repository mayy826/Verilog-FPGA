`timescale 1 ns/1 ns


module blocking( data, clk, rstn, q_a1_reg, q_a2_reg, q_a3_reg );
	input   [7:0] data;
	input   rstn, clk;
    output  [7:0] q_a1_reg, q_a2_reg, q_a3_reg;
    reg		[7:0] q_a1_reg, q_a2_reg, q_a3_reg;
	
	 //test1
	always@(posedge clk or negedge rstn)
	begin
		if(!rstn)begin
			q_a1_reg = 8'h00;
			q_a2_reg = 8'h00;
			q_a3_reg = 8'h00;
			end
		else begin
			q_a1_reg = data;
			 q_a2_reg = #5 q_a1_reg;
			#10 q_a3_reg = q_a2_reg;
			end
	end
	
	
	/*/test2
	
	always@(posedge clk or negedge rstn)
	begin
		if(!rstn) begin
			q_a1_reg = 'b0;
			q_a2_reg = 'h00;
			q_a3_reg = 'h00;
			end
 		else    begin
			q_a3_reg = q_a2_reg;
			q_a2_reg = q_a1_reg;
			q_a1_reg = data;
			end
	end
	*/
	
endmodule
