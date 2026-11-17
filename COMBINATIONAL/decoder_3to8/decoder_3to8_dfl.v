module decoder_3to8_dfl(
    input A0,
    input A1,
    input A2,
    output Y0 , Y1 , Y2 , Y3 , Y4 , Y5 , Y6 , Y7 
);

    assign Y0 = ~A0 & ~A1 & ~A2 ;
    assign Y1 = ~A0 & ~A1 & A2 ;
    assign Y2 = ~A0 & A1 & ~A2 ;
    assign Y3 = ~A0 & A1 & A2 ;
    assign Y4 = A0 & ~A1 & ~A2 ;
    assign Y5 = A0 & ~A1 & A2 ;
    assign Y6 = A0 & A1 & ~A2 ;
    assign Y7 = A0 & A1 & A2 ;

endmodule