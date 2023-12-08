`timescale 1 ns/1 ns


module updown_counter( data, clk, rstn, load, upper_lim, down_lim, count );
	input   [15:0] data, upper_lim, down_lim;
	input   rstn, clk, load;
    output  [15:0] count;
    reg		[15:0] count;
	reg		updown_ctl;
	

	always@(posedge clk or negedge rstn )
	begin
		if(!rstn)begin
			count <= data;
			updown_ctl <= 1'b0;
			end
		else 
		  if (load == 1'b1)
			begin
			 count <= data;
				if (data >= upper_lim) //
					updown_ctl  <= 1'b1; //down count
				else 
					updown_ctl  <= 1'b0; //up count
			end
		  else
			 //count <= count;
			 if(updown_ctl == 1'b0)
				if(count >= upper_lim)begin
					count 		<= count - 'h0001;
					updown_ctl	<= 1'b1;
				end
				else
					count		<= count + 'h0001;
			 else if(count <= down_lim)
				begin
					count 		<= count + 'h0001;
					updown_ctl	<= 1'b0;
				end
				else
					count		<= count - 'h0001;		
	end				
					
endmodule			
	