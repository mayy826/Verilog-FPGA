`timescale 1ns/1ns

module GPIO_TOP_TB;

		reg		clk;
		reg 	reset;
		reg 	r_en,w_en;
		reg	[2:0] add_reg;
		
		wire	[7:0] data;
		wire	[7:0] GPIO0, GPIO1, GPIO2;
		
		reg  	[7:0] b00,b11,b22,data_wr;
		//wire [7:0] c00,c11,c22,data_rd;
		reg  	sel00, sel11, sel22, sel33;
			


//set up clk 20ns=50MHz
parameter clkper = 20;

always
begin
	#(clkper/2) clk = ~clk;
end


GPIO_TOP GPIO_TOP( .clk(clk),
	  .reset(reset),
	  .r_en(r_en),.w_en(w_en),
	  .data(data),
	  .GPIO0(GPIO0), .GPIO1(GPIO1), .GPIO2(GPIO2),
	  .add_reg(add_reg)		
			); 


// data&GPIO use I/O module
inoutput GPIO_IO0(.PAD(GPIO0),.b(b00),.c(c00),.sel(sel00));
inoutput GPIO_IO1(.PAD(GPIO1),.b(b11),.c(c11),.sel(sel11));
inoutput GPIO_IO2(.PAD(GPIO2),.b(b22),.c(c22),.sel(sel22));

inoutput data_IO (.PAD(data),.b(data_wr),.c(data_rd),.sel(sel33));




initial 
begin

clk   ='b0;
reset ='b0;
r_en  ='b0;
w_en  ='b0;



//step1. GPIO0_R
#200;
	add_reg = 3'h 000;
	b00 		= 8'h AF;
	sel00		= 1;
#10;
	r_en    = 1'b 1;
#200
	r_en	= 1'b 0;
	

//step2. GPIO0_W



//step3. GPIO1_R
#200;
	add_reg = 3'h 010;
	b11 		= 8'h CF;
	sel11		= 1;
#10;
	r_en    = 1'b1;
#200
	r_en	= 1'b0;

//step4. GPIO1_W
	
end
endmodule
