	
	module D_FF(q,d,clock,reset);
	output reg q;
	input d,clock,reset;
	

	always @( negedge clock or posedge reset)
	begin
		if (reset)
			q = 1'b0;
		else
			q = d;
	end
endmodule

	module syncronizer(clk,rst,in,out);
	
	input in,clk,rst;
	output out;
	wire w;
	
	D_FF dff1(w,in,clk,rst);
	D_FF dff2(out,w,clk,rst);
	
	endmodule
	
   module clk_divider(clk,clk1,rst);
	integer cnt;
	input clk, rst;
	output reg clk1;
	always @(posedge clk)
		begin
			if(rst)
				begin
					cnt = 0;
					clk1 = 0;
				end
			else
				begin
					cnt = cnt + 1;
					if(cnt == 100000000)
						begin
							clk1 = ~clk1;
							cnt = 0;
						end
				end
		end
endmodule

	module leveltopulseconverter(clk, rst, in, out);
	input clk,in,rst;
	output reg out;
	
	syncronizer syn(clk,rst,in ,s_out);
	clk_divider cd(clk,clk1,rst);
		
	parameter  s0=0;
	parameter  s1=1;
	reg stat;
	reg n_stat;
	
	always @(posedge clk)
	
	 if (rst)
	 begin
	 stat =s0;
	 end
	 else 
	 stat = n_stat;
	
	always @(*) begin
	
	case (stat)
	s0:
	   if (s_out==0)
		begin
		out= 0;
		n_stat=s0;
	end
	  else if (s_out==1)
	  begin
	  out= 1;
		n_stat=s1;
	  end
	  
   s1:
	   if (s_out==0)
		begin
		out= 0;
		n_stat=s0;
	end
	  else if (s_out==1)
	  begin
	  out= 1;
		n_stat=s1;
	  end
	
  endcase
 end
endmodule
		