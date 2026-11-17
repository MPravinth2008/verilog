module decoder_2to4_dfl(
    input A0,
    input A1,
    output Y0,
    output Y1,
    output Y2,
    output Y3
);
assign Y0 = ~A0 & ~A1 ;
assign Y1 = ~A0 & A1 ;
assign Y2 = A0 & ~A1 ;
assign Y3 = A0 & A1 ;

endmodule