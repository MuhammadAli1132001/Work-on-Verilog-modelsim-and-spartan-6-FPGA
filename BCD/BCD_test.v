module BCD_test (CLOCK, CLR, Q);
	
	output CLOCK, CLR;
	input [3:0] Q;
	
	reg CLOCK;
	reg CLR;
	
	
	always
		#3 CLOCK = ~CLOCK;

	initial
	begin
		CLOCK = 1'b0; 
		CLR = 1'b1;
		#5
		CLR = 1'b0;
	end

	initial
		$monitor("%d, COUNT = %d", $time, Q);

endmodule