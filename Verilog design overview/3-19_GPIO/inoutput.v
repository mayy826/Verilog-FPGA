

//for check GPIO input

module inoutput(PAD,b,c,sel);

input 	  [7:0] b;
input 	  sel;
inout  	  [7:0] PAD;
output    [7:0] c;


wire 	  [7:0] PAD,b,c;
wire sel;

assign PAD = (sel)? b: 8'bz;
assign c = PAD;

endmodule	

