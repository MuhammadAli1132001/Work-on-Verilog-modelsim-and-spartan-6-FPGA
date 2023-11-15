module three_BCD_top_level;

	wire CLOCK, CLR;
	wire [3:0] BCDu, BCDt, BCDh; 
	
	three_BCD c0 (CLOCK, CLR, BCDu, BCDt, BCDh);
	three_BCD_test c1 (CLOCK, CLR, BCDu, BCDt, BCDh);

endmodule