module excess3_to_bcd_bl(
    input [3:0] EXCESS3,
    output reg [3:0] BCD
);
    always @(*)
    begin

        BCD = EXCESS3 - 4'b0011 ;
    end
endmodule