module top_counter;

	wire [3:0] count;
	wire clk, rst;
	
	counter_dn cnt (count, clk, rst);
	stimulus tb (count, clk, rst);

endmodule 