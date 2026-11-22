
module bcd_to_binary_dfl (
    input [7:0] BCD,
    output [7:0] BINARY
);

assign BINARY = (BCD[7:4] * 8'd10) + BCD[3:0];

endmodule
