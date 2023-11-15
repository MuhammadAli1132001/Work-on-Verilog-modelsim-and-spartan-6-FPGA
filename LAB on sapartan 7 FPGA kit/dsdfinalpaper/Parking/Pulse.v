

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
                    NS = S0;
                    out = 0;
                end else begin
                    NS = S1;
                    out = 1;
                end
            end
            S1: begin
                if(sync_in == 1) begin
                    NS = S1;
                    out = 0;
                end else begin
                    NS = S0;
                    out = 0;
                end
            end
        endcase
    end
endmodule
