module encoder_8to3_dfl(
    input D0 , D1 , D2 ,D3 , D4 , D5 , D6 , D7 ,
    output Y0 , Y1 , Y2 
);

    assign Y0 = D4 | D5 | D6 | D7 ;
    assign Y1 = D2 | D3 | D6 | D7 ;
    assign Y2 = D1 | D3 | D5 | D7 ;

endmodule
