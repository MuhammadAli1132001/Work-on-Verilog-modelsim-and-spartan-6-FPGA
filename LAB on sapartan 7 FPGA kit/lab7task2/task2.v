`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:30:04 06/03/2022 
// Design Name: 
// Module Name:    task1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module task2(clk,rst,in,out,pulse);

input clk,rst,in;
output out,pulse;
wire synin, CLK_1hz;

CLOCK_Divider CD1(clk,rst,CLK_1hz);
synchron ss2(in,CLK_1hz,rst,synin);
task1 t1(clk,rst,synin,pulse);

parameter s0=0; 
parameter s1=1;
reg state, next_state,out;

always @(posedge CLK_1hz)
begin
	if(~rst)
		begin
			state=s0;
		end
	else
		state=next_state;
end
always @(*)
begin
	case(state)
		s0:
		begin
			if(pulse==0)
			begin
				next_state=s0;
				out=0;
				end
			else
			begin
				next_state=s1;
				out=1;
				end
		end
		s1:
		begin
			if(pulse==1)
			begin
				next_state=s0;
				out=0;
			end
			else
			begin
				next_state=s1;
				out=1;
			end
		end
	endcase
end
endmodule

module task1(clk,rst,in,out);
input clk, rst,in;
output out;
wire synin, CLK_1hz;


CLOCK_Divider CD(clk,rst,CLK_1hz);
synchron ss1(in,CLK_1hz,rst,synin);

parameter s0=0; 
parameter s1=1;
reg state, next_state,out;

always @(posedge CLK_1hz)
begin
	if(~rst)
	begin
		state=s0;
		end
	else
		state=next_state;
end
always @(*)
begin
	case(state)
		s0:
		begin
			if(synin==0)
			begin
				next_state=s0;
				out=0;
				end
			else
			begin
				next_state=s1;
				out=1;
				end
		end
		s1:
		begin
			if(synin==1)
			begin
				next_state=s1;
				out=0;
			end
			else
			begin
				next_state=s0;
				out=0;
			end
		end
	endcase
end
endmodule

module synchron(in, clk, rst,synin);

input in,clk,rst;
output synin;

wire out;

D_FF ff1(out,in,clk,rst);
D_FF ff2(synin,out,clk,rst);
	
endmodule

module D_FF (q, d, clock, reset);

	output q;
	input d, clock, reset;
	
	reg q;

	always @(posedge clock)
	begin
		if (~reset)
			q = 1'b0;
		else
			q = d;
	end
	
endmodule

module CLOCK_Divider(input CLK_100MHz,input RESET,output reg CLK_1hz);
	
	integer c=0;	
	always @(posedge CLK_100MHz)
	begin
		if(~RESET)
		begin
			c = 0;
			CLK_1hz=1;
		end
		else 
		begin
			c = c+1;
			if(c==1000000)
			begin
				CLK_1hz = ~CLK_1hz;
				c=0;
			end
		end
	end
endmodule
