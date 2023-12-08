`timescale 1ns/1ns

module unsignandsignadder( a, b, c, k_usgn, k_sgn);
input 	[7:0]  a, b, c;
output  [15:0] k_usgn, k_sgn;
wire 	[15:0] tmp_usgn, tmp_sgn;
wire		[7:0] d_usgn, e_usgn, d_sgn, e_sgn;

//unsign adder
assign tmp_usgn = a*b;
assign {d_usgn, e_usgn} = tmp_usgn + {8'h00,c};
assign k_usgn   = {d_usgn, e_usgn};


//sign adder
assign tmp_sgn = {{8{a[7]}},a}*{{8{b[7]}},b};
assign {d_sgn, e_sgn} = tmp_sgn + {{8{c[7]}},c};
assign k_sgn   = {d_sgn, e_sgn};

endmodule


