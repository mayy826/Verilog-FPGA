`timescale 1 ns/1 ns

module testbench;
reg	clk, rstn, five_dollar, ten_dollar;
wire	product_release, change_return;

coin_buy EX404_instance(
	.clk(clk), .rstn(rstn), .five_dollar(five_dollar),
	.ten_dollar(ten_dollar),
	.product_release(product_release),
	.change_return(change_return) );

// set up clk with 50 ns period 20 MHz
parameter clkper = 50;
initial
begin
	clk = 1;			// Time = 0
end

always 
begin
	#(clkper / 2)  clk = ~clk;
end

initial
begin
 rstn       = 1'b0;			// Time = 0
 five_dollar = 1'b0;
 ten_dollar  = 1'b0;
 #155;					// Time = 155
 rstn = 1'b1;
 #500;					// Time = 655
 five_dollar = 1'b1;
 #500;					// Time = 1155
 five_dollar = 1'b0;
 #500;					// Time = 1655
 five_dollar = 1'b1;
 #500;					// Time = 2155
 five_dollar = 1'b0;
 #500;					// Time = 2655
 five_dollar = 1'b1;
 #500;					// Time = 3155
 five_dollar = 1'b0;
 #500;					// Time = 3655
 five_dollar = 1'b1;
 #500;					// Time = 4155
 five_dollar = 1'b0;
 #500;					// Time = 4655
 five_dollar = 1'b1;
 #500;					// Time = 5155
 five_dollar = 1'b0;
//----------------------------------------------------
 #1500;					// Time = 6655
 five_dollar = 1'b1;
 #500;					// Time = 7155
 five_dollar = 1'b0;
 #500;					// Time = 7655
 ten_dollar = 1'b1;
 #500;					// Time = 8155
 ten_dollar = 1'b0;
 #500;					// Time = 8655
 ten_dollar = 1'b1;
 #500;					// Time = 9155
 ten_dollar = 1'b0;
//----------------------------------------------------
 #1500;					// Time = 10655
 ten_dollar = 1'b1;
 #500;					// Time = 11155
 ten_dollar = 1'b0;
 #500;					// Time = 11655
 ten_dollar = 1'b1;
 #500;					// Time = 13155
 ten_dollar = 1'b0;
 #500;					// Time = 13655
 ten_dollar = 1'b1;
 #500;					// Time = 14155
 ten_dollar = 1'b0;
end
endmodule
