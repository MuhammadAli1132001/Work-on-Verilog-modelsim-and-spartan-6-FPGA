module BCD (CLOCK, CLR, Q);

	input CLOCK, CLR; //Clock and Reset
	output [3:0] Q; //BCD output
	
	reg [3:0] Q;

	always @(negedge CLOCK)	
		if (CLR | Q==4'd9) //BCD or Mod-10 Counter
		
			Q <= 4'd0;
		else
			Q <= Q + 1;
						
endmodule