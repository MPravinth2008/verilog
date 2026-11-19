module binary_to_gray_dfl(
    input [2:0] B ,
    output [2:0] G
);

    assign G = B ^ (B >> 1) ;

endmodule