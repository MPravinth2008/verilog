module bcd_to_excess3_bl(
    input [3:0] BCD,
    output reg [3:0] EXCESS3 
);

    always @(*)
    begin

        EXCESS3 = BCD + 4'b0011 ;
    end
endmodule