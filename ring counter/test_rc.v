module test_rc (clock, reset, out);

	output clock, reset;
	output [7:0] out;
	
	reg clock;
	reg reset;
	

	always
		#5 clock = ~clock; //toggle clk every 5 time units

	initial
	begin
		clock = 1'b0; //set clk to 0		
		reset = 1'b1;
		#12
		reset = 1'b0;
		#200 $finish; //terminate the simulation
	end

	initial
		$monitor($time, ": Output = %b", out);

endmodule