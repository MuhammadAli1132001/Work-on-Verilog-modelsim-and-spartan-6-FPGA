
module Parking(
    input Reg,
    input CLK,
    input RST,
    output reg Lock,
	 output [6:0] Seg_State,
	 output reg [2:0] Seg_En
    );
	 
	 wire NewCLK;
	 wire RegP;
	 
	 reg [2:0] PS, NS;
	 
	 parameter [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;
	 
	 Clk_Div c1(CLK, RST, NewCLK);
	 Pulse p1(NewCLK, RST, Reg, RegP);
	 
	 Seven_Seg_Decoder Seg(Seg_State, {1'b0, PS});
	 
	 always @ (posedge NewCLK)
		case(Seg_En)
			3'b110: Seg_En = 3'b101;
			3'b101: Seg_En = 3'b011;
			3'b011: Seg_En = 3'b110;
			default: Seg_En = 3'b110;
		endcase
	
	 always @(posedge NewCLK)
		if(~RST)
			PS = S0;
		else
			PS = NS;
	
	always @(PS or RegP or RST)
		case(PS)
			S0:	begin NS = RegP ? S0 : S1; Lock = 1'b0; end
			S1:	begin NS = RegP ? S1 : S2; Lock = 1'b0; end
			S2:	begin NS = RegP ? S2 : S3; Lock = 1'b0; end
			S3:	begin NS = RegP ? S3 : S4; Lock = 1'b0; end
			S4:	begin NS = RegP ? S4 : S5; Lock = 1'b0; end
			S5:	begin NS = RegP ? S5 : S0; Lock = 1'b0; end
			S6:	begin NS = RegP ? S0 : S6; Lock = 1'b1; end
			default: begin NS = S0; Lock = 1'b0; end
		endcase

endmodule
