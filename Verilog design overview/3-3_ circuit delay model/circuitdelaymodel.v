`timescale 1 ns/1 ns

//parameter clkper=50; //

module circuitdelaymodel( d,clk,rstn,q1, q2, q3 );
	input   d;
	input   clk;
    input   rstn;
    output  q1, q2, q3;
	wire	d;
    reg		q1, q2, q3;
 
always@(posedge clk or negedge rstn)  //@當()內事件觸發, 往下跑流程 
begin		                       //內部指令超過1道,就要用begin / end包起來
	if(!rstn)begin                 //內部指令超過1道,就要用begin / end包起來
		q1 = 'b0;
		q2 = 'b0;
	    q3 = 'b0; 
		end 
	else begin                     //內部指令超過1道,就要用begin / end包起來
		q1 = #1  d;
		q2 = #23 d;
	#23	q3 = d;
		end
end

endmodule
	
