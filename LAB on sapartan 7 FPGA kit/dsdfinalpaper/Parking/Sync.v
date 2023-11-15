
module Sync(
    input in, CLK, RST,
    output sync_in
    );
    
    wire out;

    D_FF ff1(out,in, CLK, RST);
    D_FF ff2(sync_in, out, CLK, RST);        
endmodule
