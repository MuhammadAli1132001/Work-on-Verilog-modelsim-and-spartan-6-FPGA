module three_BCD (CLOCK, CLR, BCDu, BCDt, BCDh);
	
	input CLOCK, CLR;
	output [3:0] BCDu, BCDt, BCDh; //u=UNITS, t=TENS, h=HUNDREDS
	
	BCD bcdu (CLOCK, CLR, BCDu[3:0]);
	BCD bcdt (BCDu[3], CLR, BCDt[3:0]);
	BCD bcdh (BCDt[3], CLR, BCDh[3:0]);

endmodule