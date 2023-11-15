module top_Johnson;

	wire CLK, CLR;
	wire [3:0] COUNT;

	Johnson_Counter jc (CLK, CLR, COUNT);
	test_Johnson  t_jc (CLK, CLR, COUNT);

endmodule