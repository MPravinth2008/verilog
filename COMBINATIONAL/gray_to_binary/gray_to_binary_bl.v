module gray_to_binary_bl(
    input [2:0] G,
    output reg [2:0] B
);

    always @(*)
    begin

        B[2] = G[2] ;
        B[1] = B[2] ^ G[1] ;
        B[0] = B[1] ^ G[0] ;
    end
endmodule