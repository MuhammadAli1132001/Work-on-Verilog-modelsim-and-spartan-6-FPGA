module Johnson_Counter (CLK, CLR, COUNT);

	input CLK, CLR;
	output [3:0] COUNT;
	
	reg [3:0] COUNT;
		
	always @(posedge CLK)
		if (~CLR)
			COUNT = 4'd0;
		else
			case (COUNT)
				4'd0: COUNT = 4'd8;
				4'd8: COUNT = 4'd12;
				4'd12: COUNT = 4'd14;
				4'd14: COUNT = 4'd15;
				4'd15: COUNT = 4'd7;
				4'd7: COUNT = 4'd3;
				4'd3: COUNT = 4'd1;
				4'd1: COUNT = 4'd0;
				default: COUNT = 4'd0;
			endcase

endmodule