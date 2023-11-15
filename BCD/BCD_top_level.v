module BCD_top_level;

	wire CLOCK, CLR;
	wire [3:0] Q;
	
	BCD bcd (CLOCK, CLR, Q);
	BCD_test bcd_t (CLOCK, CLR, Q);

endmodule