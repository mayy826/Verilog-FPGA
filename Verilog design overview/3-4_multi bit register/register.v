`timescale 1 ns/1 ns


module register( data, en, clk, rstn, q );
	input   [7:0] data;
	input   en, clk;
    input   rstn;
    output  [7:0] q;
    reg		[7:0] q;
	
	always@(posedge clk or negedge rstn)
	begin
		if(!rstn)
			q <= data;
		else if(en)
			q <= data;
			else
			q <= q;
	
	
	end
	
	endmodule
	