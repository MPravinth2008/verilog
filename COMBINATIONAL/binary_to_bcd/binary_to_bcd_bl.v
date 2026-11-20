module binary_to_bcd_bl(
    input [3:0] BINARY,
    output reg [7:0] BCD
);
    always @(*)
    begin
        
        BCD = ( ( BINARY / 10) * 16) + ( BINARY % 10 ) ;
    end
endmodule