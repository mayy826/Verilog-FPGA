`timescale 1ns/1ns //

module GPIO_TOP(
		clk,
		reset,
		r_en,
		w_en,
		data,
		GPIO0, GPIO1, GPIO2,
		add_reg		
			); 
			
	
	input	clk ,reset ;
	input 	[2:0] add_reg;
	input	r_en, w_en;
	inout	[7:0] data;
	inout	[7:0] GPIO0, GPIO1, GPIO2;
	
	wire	[7:0] GPIO0,  GPIO1,  GPIO2;
	wire	[7:0] GPIO_0, GPIO_1, GPIO_2;
	wire 	[7:0] data_0, data_1, data_2;
	reg		[7:0] data_mux;
	
	
	assign	GPIO0 = (add_reg[2:0]==001)? GPIO_0 : 8'hz;
	assign	GPIO1 = (add_reg[2:0]==011)? GPIO_1 : 8'hz;
	assign	GPIO2 = (add_reg[2:0]==101)? GPIO_2 : 8'hz;	
	
	assign	data  = data_mux;
	
	always@(posedge clk or negedge reset)
	begin
	if(!reset)
		data_mux <= 8'h0;
	else
	  case(add_reg[2:0])
	  3'b 000: data_mux = data_0;
	  3'b 010: data_mux = data_1;
	  3'b 100: data_mux = data_2;
	  default: data_mux = 8'h00;
	  endcase
	 end 
	
		
	

	GPIO0 GPIO00(  .clk(clk),
		          .reset(reset),
		          .r_en(r_en),
		          .w_en(w_en),
		          .data(data_0),
		          .GPIO(GPIO_0),
		          .add(add_reg)  );
			  
	GPIO0 GPIO11(  .clk(clk),
		          .reset(reset),
		          .r_en(r_en),
		          .w_en(w_en),
		          .data(data_1),
		          .GPIO(GPIO_1),
		          .add(add_reg)  );
			  
	GPIO0 GPIO22(  .clk(clk),
		          .reset(reset),
		          .r_en(r_en),
		          .w_en(w_en),
		          .data(data_2),
		          .GPIO(GPIO_2),
		          .add(add_reg)  );
				  
endmodule