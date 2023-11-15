
module Clk_Div(CLK, RST, NewCLK);
	output reg NewCLK;
	integer CNT;
	input CLK;
  	input RST;
	always @ (posedge CLK)
	begin
		if(~RST) //active low
		begin
			CNT = 0;
			NewCLK = 0;
		end
		else
			CNT = CNT + 1;
		if(CNT == 100000000)
			NewCLK = ~NewCLK;
	end
endmodule
