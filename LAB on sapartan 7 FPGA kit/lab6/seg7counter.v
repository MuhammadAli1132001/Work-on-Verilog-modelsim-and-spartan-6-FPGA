

module seg7counter(
   input[3:0] u, h, t,
	input rst,
	output reg clk
    );
  always @(posedge clk)
begin
	  if (rst)
	  begin
	   u = 0; 
		h = 0;
	end
	  else 
	  begin
	   u++;
	   if (u==9)
		begin
		 u=0;
		 h++;
		 else if (h==9)
		 begin
		  h=0;
	     u=u+1;
		  else if (t==9)
		  begin
		  t=0;
	     h=h+1;
		 end
	  end  
  end

endmodule

 module Adder2BCD(out,dp,en,Cout,X,Y);

output Cout;
wire [3:0] S;
input [3:0] X, Y;
seg7couter rc(Cout,S,X,Y);
output [6:0] out;
output dp;
input en;

assign dp=en;
 
    assign out =
  (S==0)?(7'b1000000):
    (S==1)?(7'b1111001):
    (S==2)?(7'b0100100):
    (S==3)?(7'b0110000):
    (S==4)?(7'b0011001):
    (S==5)?(7'b0010010):
    (S==6)?(7'b0000010):
    (S==7)?(7'b1111000):
	 (S==8)?(7'b0000000):
	 (S==9)?(7'b0011000):(7'b1111111);
       
endmodule
 
	module enabler(en,in,clk,u,h,t);
	
	input en[2:0];
	input in;
	output[3:0] u,h,t;
	input reset;
	
	always @((posedge clk)
	if (reset)
    begin 
    en=3'b110;
    in= u;
    else if (en==3'b101)
	  begin
    in=h
    else if (en==3'b011)
	 begin
    in=t;
	 
endmodule 


