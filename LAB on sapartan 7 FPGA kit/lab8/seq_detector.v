module seq_detector(x, clk, z);
 input x, clk;
 output z; reg z;
 reg stat;
 parameter s0 = 0, s1 = 1,s2 = 2,s3 = 3,s4 = 4;

   always @(posedge clk)
case (stat)
   s0: begin
   z <= x? 0:1;
   stat <= x? s0:s1;
end
   s1: begin
   z <= x? 1:0;
   stat <= x? s2:s1;
end

   s2: begin
   z <= x? 1:0;
   stat <= x? s0:s3;
end

   s3: begin
   z <= x? 0:1;
   stat <= x? s4:s1;
end

   s4: begin
   z <= x? 0:1;
   stat <=s0;
end

 default: stat <= s0;
 
endcase
endmodule
