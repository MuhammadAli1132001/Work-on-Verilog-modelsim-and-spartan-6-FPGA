module m41 (OUT, A, B, C, D, S1, S0);
	input A, B, C, D, S1, S0;
	output OUT;
	reg OUT;
	always @(*)
		case ({S1, S0})
			0: OUT=A;
			1: OUT=B;
			2: OUT=C;
			3: OUT=D;
		endcase
endmodule