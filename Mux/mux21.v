module m21 (OUT, A, B, S);
	input A, B, S;
	output OUT;
	
	assign OUT=S?B:A;
endmodule