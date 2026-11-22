module magnitude_comparator_4bit_dfl(
    input [3:0] A ,
    input [3:0] B ,
    output A_GT_B ,
    output A_LT_B ,
    output A_EQ_B 
);
    assign A_GT_B = ( A > B ) ;
    assign A_LT_B = ( A < B ) ;
    assign A_EQ_B = ( A == B ) ;
endmodule