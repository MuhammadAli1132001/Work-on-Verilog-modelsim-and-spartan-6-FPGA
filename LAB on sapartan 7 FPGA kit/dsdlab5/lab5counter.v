`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:31:52 04/21/2022 
// Design Name: 
// Module Name:    lab5counter 
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
module lab5a(
	input clk100hz,
	input rst,
	output reg clk1hz
    );
	 reg count;

	 always @(posedge clk100hz)
begin
	  if (rst)
	  begin
	   count = 0; 
		clk1hz = 0;
	end
	  else 
	     count=count+1;
		  
	   if(count==100000000)
		    clk1hz =~clk1hz;
  end

endmodule

module lab5counter(
	input clk,
	input reset,
	output reg [7:0] count
    );
    wire clk100hz;
	 lab5a divider(clk100hz,reset,clk);
	 always @(posedge clk100hz)
	begin
	
	 if (reset)
	  count <= 8'b10000000;
	  
	  else  
	   begin
		 count<=count<<1;
		 count[0] <= count[7];
	  end
	end  
	 
endmodule
