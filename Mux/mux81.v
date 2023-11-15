module m81 (OUT, I, Sel);
	input [7:0] I;
	input [2:0] Sel;
	output OUT;
	//Write your code below
	wire O1, O2;
	m41 m1 (O1, I[0], I[1], I[2], I[3], Sel[1], Sel[0]);
	m41 m2 (O2, I[4], I[5], I[6], I[7], Sel[1], Sel[0]);
	m21 m3 (OUT, O1, O2, Sel[2]);
endmodule