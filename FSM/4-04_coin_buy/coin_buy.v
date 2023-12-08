`timescale 1 ns/1 ns

module coin_buy( five_dollar, ten_dollar, clk, rstn, change_return, product_release);
	input 	five_dollar, ten_dollar, clk, rstn;
	output	change_return, product_release; 

	reg	product_release,change_return;
	
	parameter
	ZERO 	    = 6'b000000,
	FIVE  	    = 6'b000101,
	TEN 	    = 6'b001010,
	FIFTEEN     = 6'b001111,
	TWENTY      = 6'b010100,
	TWENTY_FIVE = 6'b011001,
	THIRTY      = 6'b011110;	
	 
	reg		[5:0] dollar;
	reg		five_dollar_dy1,five_dollar_dy2, ten_dollar_dy1, ten_dollar_dy2;
	wire	five_dollar_pulse, ten_dollar_pulse;
	
	//sequential circuit for dollor_pulse
	always@(posedge clk or negedge rstn)
	begin
		if(!rstn)begin
		five_dollar_dy1 <= 1'b0;
		five_dollar_dy2 <= 1'b0;
		ten_dollar_dy1  <= 1'b0;
		ten_dollar_dy2  <= 1'b0;
		end
		else begin
		five_dollar_dy1 <= #1 five_dollar;
		five_dollar_dy2 <= #1 five_dollar_dy1;
		ten_dollar_dy1  <= #1 ten_dollar;
		ten_dollar_dy2  <= #1 ten_dollar_dy1;		
		end	
	end
	
	//combinational circuit
	assign five_dollar_pulse = five_dollar_dy1 && ~ five_dollar_dy2;
	assign ten_dollar_pulse = ten_dollar_dy1 && ~ ten_dollar_dy2;
	
	//sequential circuit
	always@(posedge clk or negedge rstn)
	begin
		if(!rstn)begin
		dollar			<= ZERO;
		change_return	<= 1'b0;
		product_release <= 1'd0;
		end		
		else 
		 case(dollar)
		 ZERO : begin
				 change_return	  <= 1'b0;
				 product_release <= 1'b0;
				if (five_dollar_pulse == 1'b1)
				dollar <= FIVE;
				else 
				if (ten_dollar_pulse == 1'b1)
				dollar <= TEN;
				else
				dollar <= ZERO;
				end
		 FIVE : begin
				 change_return	  <= 1'b0;
				 product_release <= 1'b0;		 
				if (five_dollar_pulse == 1'b1)
				dollar <= TEN;
				else 
				if (ten_dollar_pulse == 1'b1)
				dollar <= FIFTEEN;
				else
				dollar <= FIVE;
				end
		 TEN : begin
				 change_return	  <= 1'b0;
				 product_release <= 1'b0;
				if (five_dollar_pulse == 1'b1)
				dollar <= FIFTEEN;
			    else 
				if (ten_dollar_pulse == 1'b1)
				dollar <= TWENTY;
				else
				dollar <= TEN;
				end
		 FIFTEEN : begin
				 change_return	 <= 1'b0;
				 product_release <= 1'b0;
				if (five_dollar_pulse == 1'b1)
				dollar <= TWENTY;
			 else 
				if (ten_dollar_pulse == 1'b1)
				dollar <= TWENTY_FIVE;
				else
				dollar <= FIFTEEN;
				end
		 TWENTY : begin
				 change_return	 <= 1'b0;
				 product_release <= 1'b0;
				 if (five_dollar_pulse == 1'b1)
				dollar <= TWENTY_FIVE;
			 else 
				if (ten_dollar_pulse == 1'b1)
				dollar <= THIRTY;
				else
				dollar <= TWENTY;
				end
		 TWENTY_FIVE :begin
			  product_release <= 1'b1;
			  change_return	  <= 1'b0;
			  dollar 	  <= ZERO;
			 end
		 THIRTY :begin
			  change_return	   <= 1'b1;
			  product_release <= 1'd1;
			  dollar 	  <= ZERO;
			 end
		
		default : begin
				  change_return	  <= 1'b0;
				  product_release <= 1'b0;
				  dollar  	  <= ZERO;
				  end
		endcase
	end	
	
	endmodule
		
		 
		 
				 
		 
		 