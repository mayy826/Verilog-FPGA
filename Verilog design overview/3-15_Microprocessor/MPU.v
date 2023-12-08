`timescale 1 ns/1 ns


module MPU( clk, c, rstn, data_in, data_out);
	input 	clk, rstn;
	input   [7:0] data_in;
	input   [8:0] c;
	output  [7:0] data_out;

	reg		[7:0] r0, r1, r2, r_out;
	wire	[7:0] src_a, src_b, dest;
	
	assign data_out = r_out;
	
	always@(posedge clk or negedge rstn) //demux
	begin 
		if(!rstn)begin
			r0 		<= 'h00;
			r1 		<= 'h00;
			r2 		<= 'h00;
			r_out	<= 'h00;
			end
		else begin
			case({c[8],c[7]})
			2'b00 : r0 <= dest;
			2'b01 : r1 <= dest;
			2'b10 : r2 <= dest;
			2'b11 : r_out <= dest;
			//default : dest <= dest;
			endcase
			
		     end
	end
	
	assign src_a = ({c[4],c[3]}== 2'b00)? r0 :
				   ({c[4],c[3]}== 2'b01)? r1 :
				   ({c[4],c[3]}== 2'b10)? r2 : data_in;
	
	assign src_b = ({c[6],c[5]}== 2'b00)? r0 :
				   ({c[6],c[5]}== 2'b01)? r1 :
				   ({c[6],c[5]}== 2'b10)? r2 : data_in;
				   
	assign dest  = ({c[2],c[1],c[0]}== 3'b000)? src_a :
				   ({c[2],c[1],c[0]}== 3'b001)? src_a + src_b :
				   ({c[2],c[1],c[0]}== 3'b010)? src_a - src_b : 
				   ({c[2],c[1],c[0]}== 3'b011)? src_a & src_b :
				   ({c[2],c[1],c[0]}== 3'b100)? src_a | src_b :
				   ({c[2],c[1],c[0]}== 3'b101)? src_a ^ src_b : dest;

endmodule
				   
			
	