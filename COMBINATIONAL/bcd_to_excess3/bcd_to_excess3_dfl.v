module bcd_to_excess3_dfl(
    input [3:0] BCD ,
    output [3:0] EXCESS3
);

    assign EXCESS3 = BCD + 4'b0011 ;

endmodule
