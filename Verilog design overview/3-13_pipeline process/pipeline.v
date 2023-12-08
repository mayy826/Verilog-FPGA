`timescale 1 ns/1 ns


module pipeline( d, clk, reset, a, c, e, ctl ,d4);
	input   [7:0] d, e , a, c;
	input   clk, reset, ctl;
    output  [15:0] d4;
	
    reg		[15:0] d4;
	reg		[7:0] d1, d2, d3;
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset)
			d1 <= d1;
		else
			d1 <= d;
	end
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset)
			d2 <= d2;
		else
			d2 <= d1+a;
	end
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset)
			d3 <= d3;
		else if(ctl==1'b1)
			d3 <= c;
			else
			d3 <= d2;			
	end
	
	always@(posedge clk or negedge reset)
	begin
		if(!reset)
			d4 <= d4;
		else 
			d4 <= e*{8'h00,d3};
						
	end
	
endmodule	