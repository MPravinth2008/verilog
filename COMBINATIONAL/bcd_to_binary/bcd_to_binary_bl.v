module bcd_to_binary_bl (
    input [7:0] BCD,
    output reg [7:0] BINARY
);
    always @(*) 
    begin
        BINARY = (BCD[7:4] * 10) + BCD[3:0];
    end

endmodule