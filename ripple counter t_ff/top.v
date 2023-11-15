module top;

	wire [4:0] q;
	wire T, clock, reset;
	
	ripple_counter rc (q, T, clock, reset);
	stimulus tb (q, T, clock, reset);

endmodule 