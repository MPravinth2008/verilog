module magnitude_comparator_4bit_bl(
    input [3:0] A,
    input [3:0] B,
    output reg A_GT_B ,
    output reg A_LT_B ,
    output reg A_EQ_B 
);

    always @(*)
    begin 
        A_GT_B = ( A > B ) ;
        A_LT_B = ( A < B ) ;
        A_EQ_B = ( A == B ) ;
    end
endmodule
