
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
