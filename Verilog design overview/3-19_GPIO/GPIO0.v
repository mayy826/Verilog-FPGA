`timescale 1ns/1ns //

module GPIO0(
		clk,
		reset,
		r_en,
		w_en,
		data,
		GPIO,
		add		
			); 
	
input	clk, reset,add;
// add=1,write reg
// add=0,read reg
input	r_en, w_en;
inout	[7:0] data;
inout	[7:0] GPIO;


reg		[7:0] reg0_r, reg0_w; 


//write of internal register
always@(posedge clk or negedge reset)
begin
	if(!reset) begin
		reg0_w <= 8'b0;
		reg0_r <= 8'b0;
	end
	else if(w_en == 1)
		reg0_w <= data;	
	else if(r_en == 1)
		reg0_r <= GPIO;
end



assign GPIO = (w_en&&add)? reg0_w : 8'bz;
assign data = (r_en&&(!add))? reg0_r : 8'bz;



endmodule

