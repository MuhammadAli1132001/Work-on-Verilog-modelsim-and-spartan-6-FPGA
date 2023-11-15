
module Clk_Divider(CLK_1Mhz, reset, CLK_100Mhz);
	output reg CLK_100Mhz;
	integer Count;
	input CLK_1Mhz;
  	input reset;
	always @ (posedge CLK_1Mhz)
	begin
		if(~reset) 
		begin
			Count= 0;
			CLK_100Mhz = 0;
		end
		else
			Count = Count + 1;
		if(Count == 100000000)
			CLK_100Mhz = ~CLK_100Mhz;
	end
endmodule


module D_FF (q, d, CLK, RST);
    output q;
    input d, CLK, RST;
    
    reg q;

    always @(posedge CLK)
    begin
        if (~RST) // low
            q = 1'b0;
        else
            q = d;
    end
    
endmodule



module Parity_detector(
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
	 
	 Clk_Divider c1(CLK, RST, NewCLK);
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




module Seven_Seg_Decoder (
    output [6:0] out,
	 input [3:0] in
	 );
	 
	assign out = (in == 0) ? 7'b1000000 : 
						(in == 1) ? 7'b1111001 : 
							(in == 2) ? 7'b0100100 :
								(in == 3) ? 7'b0110000 :
									(in == 4) ? 7'b0011001 : 
										(in == 5) ? 7'b0100010 : 
											(in == 6) ? 7'b0000010 : 
												(in == 7) ? 7'b1111000 : 
													(in == 8) ? 7'b0000000 : 
														(in == 9) ? 7'b0010000 : 7'b1111111;
endmodule



module Sync(
    input in, CLK, RST,
    output sync_in
    );
    
    wire out;

    D_FF ff1(out,in, CLK, RST);
    D_FF ff2(sync_in, out, CLK, RST);        
endmodule



module Pulse(
    input NewCLK, RST, in,
    output reg out
    );
    
    wire sync_in;

    Sync s(in, NewCLK, RST, sync_in);

    parameter S0 = 0; 
    parameter S1 = 1;
    reg PS, NS;

    // State Flip Flop
    always @(posedge NewCLK)
    begin
        if(~RST)
        begin
            PS = S0;
            end
        else
            PS = NS;
    end
    
    // Next State / Output Logic
    always @(*)
    begin
        case(PS)
            S0: begin
                if(sync_in == 0) begin
                    NS = S1;
                    out = 0;
                end else begin
                    NS = S0;
                    out = 1;
                end
            end
            S1: begin
                if(sync_in == 1) begin
                    NS = S1;
                    out = 0;
                end else begin
                    NS = S1;
                    out = 0;
                end
            end
        endcase
    end
endmodule

