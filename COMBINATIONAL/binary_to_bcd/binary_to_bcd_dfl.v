module binary_to_bcd_dfl(
    input [3:0] BINARY,
    output [7:0] BCD
);
    assign BCD = ( ( BINARY / 10 ) * 16 ) + ( BINARY % 10 ) ;
endmodule
