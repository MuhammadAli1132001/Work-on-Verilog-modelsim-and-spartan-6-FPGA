module three_BCD_test (CLOCK, CLR, BCDu, BCDt, BCDh);

	output CLOCK, CLR;
	input [3:0] BCDu, BCDt, BCDh;
	
	reg CLOCK;
	reg CLR;

	always
		#1 CLOCK = ~CLOCK;

	initial
	begin
		CLOCK = 1'b0; 
		CLR = 1'b1;
		#5
		CLR = 1'b0;
	end

	initial
		$monitor("%d, COUNT = %d%d%d", $time, BCDh, BCDt, BCDu);

endmodule